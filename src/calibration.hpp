#pragma once

#include <string>
#include <vector>
#include <visionserver2.h>
#include <opencv2/core.hpp>

struct calibration {
    std::string name;
    cv::Mat1f matrix;
    cv::Mat1f dist;
};

bool loadJSONCalibrations(std::vector<VisionCamera> &cameras, std::string path = "/home/pi/calibration.json");