#pragma once

#include <string>
#include <vector>

#include <visionserver2.h>
#include <opencv2/aruco/dictionary.hpp>
#include <opencv2/core.hpp>
#include <opencv2/aruco.hpp>
#include <networktables/NetworkTable.h>

#define TAG_REFINEMENT
#define PNP_REFINEMENT
#define CALC_CENTER
#define DRAW_DETECTED

/**
 * @brief 
 * @todo Make this average 2 frames or make another pipeline for that
 */
class BPipe: public vs2::VPipeline<BPipe> {
    private:
        std::string name;
        cv::Ptr<cv::aruco::Dictionary> dict;
        std::shared_ptr<nt::NetworkTable> ntInst;
        double distanceCorrection;

        struct {
            nt::NetworkTableEntry x;
            nt::NetworkTableEntry y;
            nt::NetworkTableEntry z;
            nt::NetworkTableEntry rx;
            nt::NetworkTableEntry ry;
            nt::NetworkTableEntry rz;
            nt::NetworkTableEntry ids;
        } tables;

        cv::Ptr<cv::aruco::DetectorParameters> dictParams;
        std::vector<std::vector<cv::Point2f>> corners, rejectedCorners;

        #ifdef CALC_CENTER
        std::vector<cv::Point> center;
        #endif

        std::vector<int> ids;
        
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
        BPipe(std::string name, double distanceCorrection = 1, cv::aruco::PREDEFINED_DICTIONARY_NAME dict = cv::aruco::DICT_APRILTAG_36h11, cv::Ptr<cv::aruco::DetectorParameters> = cv::aruco::DetectorParameters::create());
        ~BPipe();
        void process(cv::Mat &frame);
};