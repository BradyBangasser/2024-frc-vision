#include "qrcode.hpp"

#include <vector>
#include <string>
#include <visionserver2.h>
#include <opencv4/opencv2/core.hpp>


QRCodePipeline::QRCodePipeline(std::string name) : vs2::VPipeline<QRCodePipeline>(name) {}

void QRCodePipeline::process(cv::Mat &frame) {
    
}