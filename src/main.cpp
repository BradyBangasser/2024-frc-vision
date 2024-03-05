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

int loadCameras(std::vector<VisionCamera> &cameras) {
    wpi::json json;
    std::error_code ec;
    wpi::raw_fd_istream is("/boot/frc.json", ec);

    json = wpi::json::parse(is);

    std::vector<wpi::json> camJson = json.at("cameras");

    for (wpi::json c : camJson) {
        // VisionCamera cam(c);
        cameras.emplace_back(c);
    }

    return -1;
}

int main() {

    std::vector<VisionCamera> cameras{};

    loadCameras(cameras);

    // if (!readConfig(cameras)) return -1;

    std::cout << loadJSONCalibrations(cameras) << std::endl;
    vs2::VisionServer::Init();

    nt::NetworkTableInstance::GetDefault().StartClient4("VisionServer");

    for (int i = 0; i < cameras.size(); i++) {
        // std::cout << cameras[i].getJson().at("") << " this" << std::endl;
    }

    // vs2::VisionServer::addCameras(std::move(cameras));

    vs2::VisionServer::addStreams(2);

    BPipe bp("bv2024", cameras[0]);
    // BPipe bp0("bv2025", cameras[1]);

    auto &inst = vs2::VisionServer::getInstance();

    // vs2::VisionServer::addPipelines({ &bp, &bp0 });

    // std::cout << vs2::VisionServer::numStreams() << " this" << std::endl;

    inst.addCameraPipe("Hello", &bp, std::move(cameras[0]), 0);
    // inst.addCameraPipe("Hello1", &bp0, std::move(cameras[1]), 1);



    // vs2::VisionServer::compensate();
    vs2::VisionServer::run(60);

    std::cout << ("Not running\n") << std::endl;
    return 0;
}