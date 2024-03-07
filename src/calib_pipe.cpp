// This should be moved into a separt script eventually

#include "calib_pipe.hpp"
#include <visionserver2.h>
#include <opencv2/core.hpp>

bool CalibPipe::calibPipeCreated = false;

CalibPipe::CalibPipe() : vs2::VPipeline<CalibPipe>("calib") {
    this->calibPipeCreated = true;
}

CalibPipe::~CalibPipe() {
    // write calib data
    this->calibPipeCreated = false;
}

void CalibPipe::process(cv::Mat &frame) {

}