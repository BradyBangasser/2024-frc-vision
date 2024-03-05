// This should be moved into a seprate script eventually

#ifndef CALIB_PIPE_HPP
#define CALIB_PIPE_HPP

#define OUTPUT_FILE "./calib.json"

#include <visionserver2.h>
#include <opencv2/core.hpp>

class CalibPipe: public vs2::VPipeline<CalibPipe> {
    public:
        CalibPipe();
        ~CalibPipe();

    void process(cv::Mat &);

    private:
        static bool calibPipeCreated;
        cv::Mat matrix;
        cv::Mat distortion;
};

#endif