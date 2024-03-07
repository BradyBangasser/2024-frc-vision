#ifndef HUMANS_HPP
#define HUMANS_HPP

#include <visionserver2.h>
#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/objdetect.hpp>
#include <opencv2/imgproc.hpp>
#include <string>
#include <vector>

class HumanDetectionPipeline : public vs2::VPipeline<HumanDetectionPipeline> {
    private:
        std::vector<cv::Rect> humans;
        cv::CascadeClassifier cascade;
        static inline constexpr double scale = .75f;

    public:
        HumanDetectionPipeline(std::string name);
        ~HumanDetectionPipeline();
        void process(cv::Mat &frame);
};

#endif