#ifndef RECORDING_HPP
#define RECORDING_HPP

#include <visionserver2.h>
#include <opencv2/core.hpp>

class Recording : public vs2::VisionPipeline<Recording> {
    public:
        void process(cv::Mat &frame);
}

#endif