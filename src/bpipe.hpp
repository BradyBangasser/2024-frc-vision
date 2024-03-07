#include <string>
#include <vector>

#include <visionserver2.h>
#include <opencv2/aruco/dictionary.hpp>
#include <opencv2/core.hpp>
#include <opencv2/aruco.hpp>
#include <networktables/NetworkTable.h>

#ifndef BPIPE_HPP
#define BPIPE_HPP

#define TAG_REFINEMENT
#define PNP_REFINEMENT
#define CALC_CENTER
#define DRAW_DETECTED

/**
 * @brief The distance will be divided from the calculated distance
 */
#define DISTANCE_CORRECTION 1

/**
 * @brief 
 * 
 */
class BPipe: public vs2::VPipeline<BPipe> {
    private:
        std::string name;
        cv::Ptr<cv::aruco::Dictionary> dict;
        NT_Inst ntInst;
        NT_Entry ntDistance;

        struct {
            NT_Entry x;
            NT_Entry y;
            NT_Entry z;
            NT_Entry rx;
            NT_Entry ry;
            NT_Entry rz;
            NT_Entry ids;
        } tables;

        cv::Ptr<cv::aruco::DetectorParameters> dictParams;
        std::vector<std::vector<cv::Point2f>> corners, rejectedCorners;

        #ifdef CALC_CENTER
        std::vector<cv::Point> center;
        #endif

        std::vector<int> ids;
        cv::VideoWriter video;
        
        struct {
            std::vector<double> x;
            std::vector<double> y;
            std::vector<double> z;
            std::vector<double> rx;
            std::vector<double> ry;
            std::vector<double> rz;
            std::vector<int64_t> id;

        } tagPos;

    public: 
        BPipe(std::string name, cv::aruco::PREDEFINED_DICTIONARY_NAME dict = cv::aruco::DICT_APRILTAG_36h11, cv::Ptr<cv::aruco::DetectorParameters> = cv::aruco::DetectorParameters::create());
        ~BPipe();
        void process(cv::Mat &frame);
};

#endif