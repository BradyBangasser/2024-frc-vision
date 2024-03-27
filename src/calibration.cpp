#include "calibration.hpp"
#include <string>
#include <vector>
#include <visionserver2.h>
#include <iostream>
#include <fstream>
#include <opencv2/core.hpp>
#include <wpi/json.h>
#include <wpi/raw_istream.h>

static const std::vector<struct calibration> calibrations;
static bool init = false;
static cv::Mat1f matrix( {3, 3 }, { 0,0,0,0,0,0,0,0,0}); 
static cv::Mat1f dist( { 1, 5 } );

bool loadJSONCalibrations(std::vector<VisionCamera> &cameras, std::string path) {
    std::cout << "Attempting to load calibrations" << std::endl;
    if (!init) {
        std::error_code ec;
        wpi::json json;
        uint i;
        wpi::raw_fd_istream is(path, ec);

        wpi::json j = wpi::json::parse(is);

        for (VisionCamera &cam : cameras) {
            std::string camType = cam.GetDescription();

            if (j.count(camType) == 0) {
                std::cout << "Calibration for '" << camType << "'\n";
                break;
            }

            wpi::json calibJson = j.at(camType).get<wpi::json>();
            
            std::vector<wpi::json> m = calibJson.at("matrix").get<std::vector<wpi::json>>();

            double ma[9];
            double da[5];


            for (i = 0; i < m.size(); i++) {
                ma[i] = m[i].get<double>();
            }

            matrix = cv::Mat_<double>(3, 3, (double *) ma);


            std::vector<wpi::json> d = calibJson.at("dist").get<std::vector<wpi::json>>();

            for (i = 0; i < d.size(); i++) {
                da[i] = d[i].get<double>();
            }

            dist = cv::Mat_<double>(1, 5, (double *) da);

            if (!cam.setCameraMatrix(std::move(matrix)) && !cam.setDistortionCoefs(std::move(dist))) return false;
        }

        return true;

    } else return true;
}