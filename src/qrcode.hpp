#pragma once

#include <visionserver2.h>
#include <opencv2/core.hpp>
#include <visionserver2.h>
#include <opencv2/highgui.hpp>
#include <opencv2/objdetect.hpp>
#include <opencv2/imgproc.hpp>
#include <networktables/NetworkTableEntry.h>
#include <vector>
#include <string>
#include <zbar.h>

class QRCodePipeline : public vs2::VPipeline<QRCodePipeline> {
    private:
        bool enabled = true;
        // size_t count;
        // std::string data;
        std::string *accepts;
        // std::vector<cv::Point2d> points;
        // std::vector<cv::Point2d> straightCode;
        // cv::QRCodeDetector detector;
        nt::NetworkTableEntry ntEntry;
        // zbar::ImageScanner scanner;
    public:
        QRCodePipeline(std::string name, std::string accepts[] = NULL);
        ~QRCodePipeline() {}
        void process(cv::Mat &frame);
};