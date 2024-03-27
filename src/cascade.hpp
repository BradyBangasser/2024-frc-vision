#pragma once

#include <visionserver2.h>
#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/objdetect.hpp>
#include <opencv2/imgproc.hpp>
#include <string>
#include <vector>

class CascadePipeline : public vs2::VPipeline<CascadePipeline> {
    private:
        std::vector<cv::Rect> detections;
        cv::CascadeClassifier cascade;
        static inline constexpr double scale = .75f;
        static inline constexpr double _scale = 1.f / scale;
        cv::Mat grayImg, scaledImg;

    public:
        CascadePipeline(std::string name);
        ~CascadePipeline();
        void process(cv::Mat &frame);
};