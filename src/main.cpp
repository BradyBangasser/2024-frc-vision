#include <visionserver2.h>
#include <config.h>
#include <vector>
#include <iostream>
#include <tfmodel.h>
#include <opencv2/core.hpp>
#include <opencv2/dnn.hpp>
#include <opencv2/highgui.hpp>
#include <frc/geometry/Pose3d.h>
#include <opencv2/aruco/dictionary.hpp>
#include <opencv2/aruco.hpp>
#include <opencv2/aruco/charuco.hpp>
#include "bpipe.hpp"
#include "calibration.hpp"
#include <wpi/raw_istream.h>
#include <stdint.h>
#include "cascade.hpp"
#include "qrcode.hpp"

uint8_t loadCameras(std::vector<VisionCamera> &cameras) {
    wpi::json json;
    std::error_code ec;
    wpi::raw_fd_istream is("/boot/frc.json", ec);

    json = wpi::json::parse(is);

    std::vector<wpi::json> camJson = json.at("cameras");

    for (wpi::json c : camJson) {
        cameras.emplace_back(c);
    }

    return 0;
}

int main() {

    std::vector<VisionCamera> cameras{};

    // Make this more graceful
    if (loadCameras(cameras)) {
        std::cout << "Failed to load cameras\n";
        exit(5);
    };
    if (!loadJSONCalibrations(cameras)) {
        std::cout << "Failed to load camera calibration\n";
        exit(5);
    };

    vs2::VisionServer::Init();

    nt::NetworkTableInstance::GetDefault().StartClient4("VisionServer");
    nt::NetworkTableInstance::GetDefault().SetServer(std::array<std::pair<std::string_view, unsigned int>, 3>({
        { "10.34.7.2", 0U },
        { "10.34.7.70", 0U },
        { "10.34.7.1", 0U },
    }));

    vs2::VisionServer::addStreams(2);

    vs2::VisionServer::addCameras(std::move(cameras));

    BPipe aprilTagDetectionPipeline("bv2024", .19453977264788191);
    BPipe driverCameraPipeline("driverCam");
    QRCodePipeline qrDetectionPipeline("qr");
    // CascadePipeline cp("test");

    vs2::VisionServer &inst = vs2::VisionServer::getInstance();

    inst.addCameraPipe("aprilTagDetection0", &aprilTagDetectionPipeline, 0, 0);
    inst.addCameraPipe("qrDetection0", &qrDetectionPipeline, 0, 0);
    if (inst.numCameras() > 1) inst.addCameraPipe("aprilTagDetection1", &driverCameraPipeline, 0, 1);
    // inst.addCameraPipe("cascadePipeline", &cp, 0, 1);

    vs2::VisionServer::run(60);

    std::cout << ("Not running\n") << std::endl;
    return 0;
}