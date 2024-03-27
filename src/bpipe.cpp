#include "bpipe.hpp"
#include "constants.hpp"

#include <string>
#include <chrono>
#include <array>
#include <math.h>

#include <visionserver2.h>
#include <opencv2/aruco/dictionary.hpp>
#include <opencv2/aruco.hpp>

#define V2024_DETECT_POSE

BPipe::BPipe(std::string name, cv::aruco::PREDEFINED_DICTIONARY_NAME dict, cv::Ptr<cv::aruco::DetectorParameters> params) : vs2::VPipeline<BPipe>(name) {
    this->name = name;
    this->dict = cv::aruco::getPredefinedDictionary(dict);
    this->dictParams = params;
    this->ntInst = this->ntable();

    this->tables.x = this->ntInst->GetEntry("bv2024/x");
    this->tables.y = this->ntInst->GetEntry("bv2024/y");
    this->tables.z = this->ntInst->GetEntry("bv2024/z");
    this->tables.rx = this->ntInst->GetEntry("bv2024/rx");
    this->tables.ry = this->ntInst->GetEntry("bv2024/ry");
    this->tables.rz = this->ntInst->GetEntry("bv2024/rz");
    this->tables.ids = this->ntInst->GetEntry("bv2024/ids");
}

BPipe::~BPipe() {
}

inline double degreeConversion(double rotations) {
    // Just in case we wanna convert to degrees
    return rotations;//  * (180 / CV_PI);
}

inline double decideRy(double ry0, double ry1, std::vector<cv::Point2f> corners) { return ((abs(corners[1].y - corners[2].y) < abs(corners[0].y - corners[3].y)) ? std::max(ry0, ry1) : std::min(ry0, ry1)); }

void BPipe::process(cv::Mat &frame) {
    tagPos.z.clear();
    tagPos.x.clear();
    tagPos.y.clear();
    tagPos.rz.clear();
    tagPos.rx.clear();
    tagPos.ry.clear();
    tagPos.id.clear();
    center.clear();

    size_t j, i = 0;

    cv::aruco::detectMarkers(frame, dict, corners, ids, dictParams, rejectedCorners);

    size_t numberOfDetections = corners.size();

    std::vector<cv::Vec3f> rvecs(numberOfDetections), tvecs(numberOfDetections);

    #if defined(CALC_CENTER) || defined(V2024_DETECT_POSE) || defined(DRAW_DETECTED)
        if (numberOfDetections > 0) {
            decideRy(0, 0, corners.at(i));
            for (i = 0; i < numberOfDetections; i++) {
                #ifdef CALC_CENTER
                    double xsum = 0, ysum = 0;

                    for (j = 0; j < corners[i].size(); j++) {
                        xsum += corners[i][j].x;
                        ysum += corners[i][j].y;
                    }

                    xsum /= 4;
                    ysum /= 4;

                    this->center.push_back(cv::Point(xsum, ysum));
                #endif

                #ifdef V2024_DETECT_POSE
                    static double distance, x, y;
                    // This will return two possible solutions for each of values
                    cv::solvePnPGeneric(::TAG_POINTS, corners.at(i), this->getSrcMatrix(), this->getSrcDistort(), rvecs, tvecs, false, cv::SOLVEPNP_IPPE_SQUARE);

                    if (rvecs.size() == 2 && tvecs[0][0]) {
                        #ifdef PNP_REFINEMENT
                            // This was giving me a pointer error inside opencv, probably worth further debugging and research 
                            // cv::solvePnPRefineLM(::TAG_POINTS, corners.at(i), this->getSrcMatrix(), this->getSrcDistort(), rvecs, tvecs);
                        #endif

                        // Distance, seems to be fairly accurate with the correct distance calculations 
                        distance = tvecs[0][2] / DISTANCE_CORRECTION;

                        // This should be improved to check which solution is better
                        x = tvecs[0][1];
                        y = tvecs[0][0];

                        tagPos.z.push_back(distance);
                        tagPos.x.push_back(x);
                        tagPos.y.push_back(y);

                        // roll 
                        tagPos.rx.push_back(degreeConversion((abs(rvecs[0][0]) > abs(rvecs[1][0])) ? rvecs[0][0] : rvecs[1][0]));
                        // yaw
                        tagPos.ry.push_back(degreeConversion(decideRy(rvecs[0][1], rvecs[1][1], corners.at(i))));
                        // pitch
                        tagPos.rz.push_back(degreeConversion(std::max(rvecs[0][2], rvecs[1][2])));
                        tagPos.id.push_back(ids[i]);

                        #ifdef DRAW_DETECTED
                            cv::drawFrameAxes(frame, this->getSrcMatrix(), this->getSrcDistort(), rvecs.at(i), tvecs.at(i), 10);

                            #ifdef CALC_CENTER
                                cv::circle(frame, this->center.at(i), 3, cv::Scalar(255, 140, 25), 2);
                            #endif
                        #endif
                    #endif
                }
            }

            #ifdef DRAW_DETECTED
                cv::aruco::drawDetectedMarkers(frame, corners, ids);
            #endif
        }
    #endif

    this->tables.ids.SetIntegerArray(tagPos.id);
    this->tables.x.SetDoubleArray(this->tagPos.x);
    this->tables.y.SetDoubleArray(this->tagPos.y);
    this->tables.z.SetDoubleArray(this->tagPos.z);
    this->tables.rx.SetDoubleArray(this->tagPos.rx);
    this->tables.ry.SetDoubleArray(this->tagPos.ry);
    this->tables.rz.SetDoubleArray(this->tagPos.rz);
    #ifdef TIMESTAMP
        cv::putText(frame, std::to_string(std::chrono::high_resolution_clock::now().time_since_epoch().count()), cv::Point(0, 10), cv::FONT_HERSHEY_DUPLEX, .3, cv::Scalar(0, 255, 0));
    #endif
}