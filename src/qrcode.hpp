#pragma once

#include <visionserver2.h>
#include <opencv2/core.hpp>
#include <visionserver2.h>
#include <opencv2/highgui.hpp>
#include <opencv2/objdetect.hpp>
#include <opencv2/imgproc.hpp>
#include <vector>
#include <string>

class QRCodePipeline : public vs2::VPipeline<QRCodePipeline> {
    private:
        std::string data;
        std::vector<cv::Point2d> points;
        std::vector<cv::Point2d> straightCode;
        size_t count;
    public:
        QRCodePipeline(std::string name);
        ~QRCodePipeline() {}
        void process(cv::Mat &frame);
};