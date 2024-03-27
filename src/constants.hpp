#ifndef V2024_CONSTANTS_HPP
#define V2024_CONTANTS_HPP

#include <opencv2/core.hpp>
#include <array>

// Thanks Sam
// https://github.com/FRC3407/2023-Charged-Up/blob/ff925110b396bfc395a1eb5ecb244db4b32a5136/vision/src/field.h

// 6.5 inch tags
static inline constexpr float TAG_SIDE_LEN = 0.0254f;

static inline const std::array<cv::Point3f, 4> TAG_POINTS {
    cv::Point3f{ -TAG_SIDE_LEN / 2.f, TAG_SIDE_LEN / 2.f, 0.f },
    cv::Point3f{ TAG_SIDE_LEN / 2.f, TAG_SIDE_LEN / 2.f, 0.f },
    cv::Point3f{ TAG_SIDE_LEN / 2.f, -TAG_SIDE_LEN / 2.f, 0.f },
    cv::Point3f{ -TAG_SIDE_LEN / 2.f, -TAG_SIDE_LEN / 2.f, 0.f }
};

#endif