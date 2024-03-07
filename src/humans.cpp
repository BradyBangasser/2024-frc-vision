#include "humans.hpp"
#include <string>
#include <opencv2/highgui.hpp>
#include <opencv2/objdetect.hpp>
#include <opencv2/imgproc.hpp>

HumanDetectionPipeline::HumanDetectionPipeline(std::string name) : vs2::VPipeline<HumanDetectionPipeline>(name) {
    this->cascade.load("cascades/humans.xml");
    // this->cascade.open(1);
}

HumanDetectionPipeline::~HumanDetectionPipeline() {

}

void HumanDetectionPipeline::process(cv::Mat &frame) {
    this->humans.clear();
}
