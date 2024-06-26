#pragma once

#include <string>
#include <atomic>
#include <thread>
#include <chrono>
#include <initializer_list>

#include <opencv2/opencv.hpp>
#include <networktables/NetworkTable.h>

#include "cpp-tools/src/types.h"

#include "visioncamera.h"


namespace vs2 {

class VisionServer final {
	struct OutputStream;
public:
	inline static const std::shared_ptr<nt::NetworkTable>& ntable() {
		static std::shared_ptr<nt::NetworkTable> base{nt::NetworkTableInstance::GetDefault().GetTable("Vision Server")};
		return base;
	}

	inline static VisionServer& getInstance() {
		static VisionServer instance;
		return instance;
	}
	inline static void Init() {
		getInstance();
		BasePipe::ntable();
		OutputStream::ntable();
	}


	class BasePipe : public cs::CvSource {
		friend class VisionServer;
	public:
		inline static const std::shared_ptr<nt::NetworkTable>& ntable() {
			static std::shared_ptr<nt::NetworkTable> pipes{VisionServer::ntable()->GetSubTable("Pipelines")};
			return pipes;
		}

		inline const std::string& getName() const { return this->name; }
		inline const std::shared_ptr<nt::NetworkTable>& getTable() const { return this->table; }

		virtual void process(cv::Mat& io_frame) = 0;
		inline virtual void init() {}
		inline virtual void close() {}

	protected:
		inline BasePipe(const char* name) :	/* start enable/disable callback for more efficent threading */
			CvSource(name, cs::VideoMode()), name(name),
			input(this->name), table(BasePipe::ntable()->GetSubTable(this->name)) {}
		inline BasePipe(const std::string& name) :
			CvSource(name, cs::VideoMode()), name(name),
			input(this->name), table(BasePipe::ntable()->GetSubTable(this->name)) {}
		inline BasePipe(std::string&& name) :
			CvSource(name, cs::VideoMode()), name(name),
			input(this->name), table(BasePipe::ntable()->GetSubTable(this->name)) {}
		BasePipe() = delete;


		void setCamera(const VisionCamera&);
		void setPipeline(const BasePipe&);
		void setSource(const cs::VideoSource&);
		void getFrame(cv::Mat&);

		inline const cv::Mat1f& getSrcMatrix() const { return *this->src_matrix; }
		inline const cv::Mat1f& getSrcDistort() const { return *this->src_distort; }

	private:
		std::string name;
		cs::CvSink input;
		const cv::Mat_<float>
			*src_matrix{&VisionCamera::default_matrix},
			*src_distort{&VisionCamera::default_distort}
		;
		const std::shared_ptr<nt::NetworkTable> table;


	};


	static bool addCamera(VisionCamera&&);
	static bool addCameras(std::vector<VisionCamera>&&);
	static bool setCameras(std::vector<VisionCamera>&&);
	static std::vector<VisionCamera>& getCameras();
	static size_t numCameras();

	// Bradys little helpful function? 
	static inline bool addCameraPipe(std::string name, BasePipe *pipeline, size_t camIdx, size_t streamIndex) {
		VisionServer &inst = vs2::VisionServer::inst();
		pipeline->setCamera(inst.cameras[camIdx]);
		inst.addPipeline(pipeline);

		inst.streams.at(streamIndex).setPipelineIdx(inst.numPipelines());

		return true;
	}	

	template<class pipeline>
	static bool addPipeline();
	static bool addPipeline(BasePipe*);
	template<class... pipelines>
	static bool addPipelines();
	static bool addPipelines(std::vector<BasePipe*>&&);
	static bool addPipelines(std::initializer_list<BasePipe*>);
	template<class... pipelines>
	static bool setPipelines();
	static bool setPipelines(std::vector<BasePipe*>&&);
	static bool setPipelines(std::initializer_list<BasePipe*>);
	static const std::vector<BasePipe*>& getPipelines();
	static size_t numPipelines();

	static bool addStream();
	static bool addStream(std::string_view);
	static bool addStream(std::string_view, int port);
	static bool addStream(const cs::MjpegServer&);
	static bool addStream(cs::MjpegServer&&);
	static bool addStreams(size_t = 2);
	static bool addStreams(std::initializer_list<std::string_view>);
	static bool addStreams(std::initializer_list<std::pair<std::string_view, int> >);
	static bool addStreams(const std::vector<cs::MjpegServer>&);
	static const std::vector<OutputStream>& getStreams();
	static size_t numStreams();

	static bool compensate();	// attempts to attach all pipelines to the first available camera, and all outputs to the first available source
	static bool runRaw();		// run stream index handling for raw inputs (no processing, just camera feeds) - stops when processing is started
	static bool runRawThread();	// run stream index handling in a separate thread - stops when processing is started

	static bool run(float fps_cap = 30.f);			// start multithreaded processing - blocks until stop() is called [in another thread]
	static bool runSingle(float fps_cap = 30.f);	// start singlethreaded processing - blocks until stop() is called [in another thread]
	static bool runThread(float fps_cap = 30.f);	// start multithreaded processing in a separate thread - does not block
	static bool runSingleThread(float fps_cap = 30.f);	// start singlethreaded processing in a separate thread - does not block
	static bool isRunning();
	static bool stop();							// stop processing - returns if any instances were actually stopped
	static inline void stopExit() { stop(); }	// a void-returning wrapper for stop() to be used within 'atexit'


	template<class pipeline = void, class... pipelines>
	static size_t pipeExpander(std::vector<std::unique_ptr<BasePipe> >&);

protected:
	inline static VisionServer& inst() { return getInstance(); }

	static void pipelineRunner(BasePipe*, float fps_cap);

private:
	VisionServer();
	~VisionServer();
	VisionServer(const VisionServer&) = delete;
	VisionServer(VisionServer&&) = delete;
	void operator=(const VisionServer&) = delete;
	void operator=(VisionServer&&) = delete;

	std::vector<VisionCamera> cameras;
	std::vector<BasePipe*> pipelines;
	std::vector<std::unique_ptr<BasePipe> > heap_allocated;
	std::vector<OutputStream> streams;

	std::thread head;
	std::atomic<bool> is_running{false};


	struct OutputStream : public cs::MjpegServer {
		friend class VisionServer;
	public:
		inline static const std::shared_ptr<nt::NetworkTable>& ntable() {
			static std::shared_ptr<nt::NetworkTable> streams{VisionServer::ntable()->GetSubTable("Streams")};
			return streams;
		}

		OutputStream(cs::MjpegServer&& s);
		inline OutputStream(std::string_view n) :
			OutputStream(frc::CameraServer::AddServer(n)) {}
		inline OutputStream(std::string_view n, int p) :
			OutputStream(frc::CameraServer::AddServer(n, p)) {}
		inline OutputStream(const OutputStream& o) :
			MjpegServer(o), table(o.table), local_idx(o.local_idx.load()) {}
		inline OutputStream(OutputStream&& o) :
			MjpegServer(std::move(o)), table(std::move(o.table)), local_idx(o.local_idx.load()) {}
		~OutputStream();

		void setSourceIdx(int i);
		inline void setPipelineIdx(uint16_t i) { this->setSourceIdx(i); }
		inline void setCameraIdx(uint16_t i) { this->setSourceIdx(-(int)i); }

	protected:
		void syncIdx();

	private:
		const std::shared_ptr<nt::NetworkTable> table;
		std::atomic_int local_idx{0};

	};


};



typedef struct VPipeline_S		BasePipe;	// non-instanced ("singular") VPipeline is just an alias of BasePipe

template<class derived>	// CRTP for instance counting -> all derived classes should inherit a passthrough template if they are expected to be extended as well
class VPipeline : public Instanced<VPipeline<derived> >, public VisionServer::BasePipe {
	typedef struct VPipeline<derived>	This_t;
protected:
	VPipeline() = delete;
	VPipeline(const VPipeline&) = delete;
	inline VPipeline(const char* name) : 
		Instanced<This_t>(), BasePipe(name + ("/Instance " + std::to_string(this->instance))) {}
	inline VPipeline(const std::string& name) :
		Instanced<This_t>(), BasePipe(name + "/Instance " + std::to_string(this->instance)) {}
	inline VPipeline(std::string&& name) :
		Instanced<This_t>(), BasePipe(name + "/Instance" + std::to_string(this->instance)) {}
	inline virtual ~VPipeline() = default;


	inline virtual void process(cv::Mat& io_frame) override {}


};

template<class... pipelines_t>
class SequentialPipeline : public VPipeline<SequentialPipeline<pipelines_t...> > {
	typedef struct SequentialPipeline<pipelines_t...>		This_t;
public:
	inline SequentialPipeline() :
		VPipeline<This_t>("SequentialPipeline<" + Construct(this->heap_ptrs) + "> ")
	{
		for(size_t i = 0; i < this->heap_ptrs.size(); i++) {
			this->pipelines.push_back(this->heap_ptrs.at(i).get());
		}
	}

	void addPipeline(VisionServer::BasePipe*);
	void addPipelines(std::vector<VisionServer::BasePipe*>&&);
	void addPipelines(std::initializer_list<VisionServer::BasePipe*>);

	virtual void process(cv::Mat& io_frame) override;

protected:
	static std::string Construct(std::vector<std::unique_ptr<VisionServer::BasePipe> >&);

	std::vector<VisionServer::BasePipe*> pipelines;
	std::vector<std::unique_ptr<VisionServer::BasePipe> > heap_ptrs;


};
typedef SequentialPipeline<>	SeqPipeline;


}	// namespace vs2










/** visionserver2.inc **/

#include <type_traits>
#include <sstream>


namespace vs2 {

inline std::vector<VisionCamera>& VisionServer::getCameras() { return inst().cameras; }
inline size_t VisionServer::numCameras() { return inst().cameras.size(); }
inline const std::vector<VisionServer::BasePipe*>& VisionServer::getPipelines() { return inst().pipelines; }
inline size_t VisionServer::numPipelines() { return inst().pipelines.size(); }
inline const std::vector<VisionServer::OutputStream>& VisionServer::getStreams() { return inst().streams; }
inline size_t VisionServer::numStreams() { return inst().streams.size(); }
inline bool VisionServer::isRunning() { return inst().is_running; }

template<class pipeline>
bool VisionServer::addPipeline() {
	static_assert(std::is_base_of<VisionServer::BasePipe, pipeline>::value, "Template argument (pipeline) must inherit from BasePipe");
	static_assert(std::is_default_constructible<pipeline>::value, "Template arguement (pipeline) must be default constructible");
	if(!VisionServer::isRunning()) {
		VisionServer& _inst = getInstance();
		_inst.heap_allocated.emplace_back(std::make_unique<pipeline>());
		_inst.pipelines.push_back(_inst.heap_allocated.back().get());
		return true;
	}
	return false;
}
template<class... pipelines_t>
bool VisionServer::addPipelines() {
	if(!VisionServer::isRunning()) {
		VisionServer& _inst = getInstance();
		_inst.heap_allocated.reserve(_inst.heap_allocated.size() + sizeof...(pipelines_t));
		_inst.pipelines.reserve(_inst.pipelines.size() + sizeof...(pipelines_t));
		size_t alloc = VisionServer::pipeExpander<pipelines_t...>(inst().heap_allocated);
		for(size_t i = alloc; i >= 0; --i) {
			_inst.pipelines.push_back(_inst.heap_allocated.at(_inst.heap_allocated.size() - i - 1).get());
		}
		return true;
	}
	return false;
}
template<class... pipelines_t>
bool VisionServer::setPipelines() {
	if(!VisionServer::isRunning()) {
		VisionServer& _inst = getInstance();
		_inst.heap_allocated.clear();
		_inst.heap_allocated.reserve(sizeof...(pipelines_t));
		_inst.pipelines.clear();
		_inst.pipelines.reserve(sizeof...(pipelines_t));
		VisionServer::pipeExpander<pipelines_t...>(_inst.heap_allocated);
		for(size_t i = 0; i < _inst.heap_allocated.size(); i++) {
			_inst.pipelines.push_back(_inst.heap_allocated.at(i).get());
		}
		return true;
	}
	return false;
}

template<class pipeline, class... pipelines>
size_t VisionServer::pipeExpander(std::vector<std::unique_ptr<BasePipe> >& pipes) {
	if constexpr(!std::is_same<pipeline, void>::value) {
		static_assert(std::is_base_of<VisionServer::BasePipe, pipeline>::value, "Template argument (pipeline) must inherit from BasePipe");
		static_assert(std::is_default_constructible<pipeline>::value, "Template arguement (pipeline) must be default constructible");

		pipes.emplace_back(std::make_unique<pipeline>());
		return 1U + VisionServer::pipeExpander<pipelines...>(pipes);
	}
	return 0U;
}

// template<class derived>
// void VPipeline<derived>::process(cv::Mat&) {}

template<class... pipelines_t>
inline std::string SequentialPipeline<pipelines_t...>::Construct(std::vector<std::unique_ptr<VisionServer::BasePipe> >& pipes) {
	if(VisionServer::pipeExpander<pipelines_t...>(pipes) < 1) {
		return "void";
	} else {
		std::stringstream ret(pipes.at(0)->getName());
		for(size_t i = 1; i < pipes.size(); i++) {
			ret << ", " << pipes.at(i)->getName();
		}
		return ret.str();
	}
	
}
template<class... pipelines_t>
void SequentialPipeline<pipelines_t...>::addPipeline(VisionServer::BasePipe* p) {
	this->pipelines.push_back(p);
}
template<class... pipelines_t>
void SequentialPipeline<pipelines_t...>::addPipelines(std::vector<VisionServer::BasePipe*>&& ps) {
	this->pipelines.insert(this->pipelines.end(), ps.begin(), ps.end());
}
template<class... pipelines_t>
void SequentialPipeline<pipelines_t...>::addPipelines(std::initializer_list<VisionServer::BasePipe*> ps) {
	this->pipelines.insert(this->pipelines.end(), ps.begin(), ps.end());
}
template<class... pipelines_t>
void SequentialPipeline<pipelines_t...>::process(cv::Mat& io_frame) {
	for(size_t i = 0; i < this->pipelines.size(); i++) {
		this->pipelines.at(i)->process(io_frame);
	}
}

}	// namespace vs2;