#include "cascade.hpp"
#include <string>
#include <opencv2/highgui.hpp>
#include <opencv2/objdetect.hpp>
#include <iostream>
#include <wpi/raw_ostream.h>
#include <opencv2/imgproc.hpp>

CascadePipeline::CascadePipeline(std::string name) : vs2::VPipeline<CascadePipeline>(name) {
    this->cascade.load("cascades/face.xml");
}

CascadePipeline::~CascadePipeline() {}

void CascadePipeline::process(cv::Mat &frame) {
    this->detections.clear();

    cv::cvtColor(frame, this->grayImg, cv::COLOR_BGR2GRAY);

    cv::resize(this->grayImg, this->scaledImg, cv::Size(), this->_scale, this->_scale, cv::INTER_LINEAR);
    cv::equalizeHist(this->scaledImg, this->scaledImg);

    this->cascade.detectMultiScale(this->scaledImg, this->detections, 1.1, 3);

    if (detections.size()) {
        for (cv::Rect detection : detections) {
            // Point conversions

            if (this->scale != 1) {
                detection = cv::Rect(detection.x * this->scale, detection.y * this->scale, detection.width * this->scale, detection.height * this->scale);
            }

            cv::rectangle(frame, detection, cv::Scalar(0, 255, 0));
        }
    }

    cv::putText(frame, std::to_string(detections.size()), cv::Point(50, 100), cv::FONT_HERSHEY_DUPLEX, 3, cv::Scalar(0, 255, 0));
}
