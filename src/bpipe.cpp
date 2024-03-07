#include "bpipe.hpp"
#include "constants.hpp"

#include <string>
#include <chrono>
#include <array>

#include <visionserver2.h>
#include <opencv2/aruco/dictionary.hpp>
#include <opencv2/aruco.hpp>

#define V2024_DETECT_POSE

BPipe::BPipe(std::string name, cv::aruco::PREDEFINED_DICTIONARY_NAME dict, cv::Ptr<cv::aruco::DetectorParameters> params) : vs2::VPipeline<BPipe>(name) {
    this->name = name;
    this->dict = cv::aruco::getPredefinedDictionary(dict);
    this->dictParams = params;
    // this->ntInst = nt::GetDefaultInstance();
    auto ntt = this->ntable()->GetEntry("Hello");
    ntt.SetBoolean(true);


    // std::array<std::pair<std::string_view, uint>, 3> servers({
        // { "10.34.7.70", 0U },
        // { "10.34.7.2", 0U },
        // { "10.34.7.29", 0U }
    // });

    this->EnumerateSinks();


    // this->tables.ids = nt::GetEntry(ntInst, "/bv2024/ids");
    // this->tables.x = nt::GetEntry(ntInst, "/bv2024/x");
    // this->tables.y = nt::GetEntry(ntInst, "/bv2024/y");
    // this->tables.z = nt::GetEntry(ntInst, "/bv2024/z");
    // this->tables.rx = nt::GetEntry(ntInst, "/bv2024/rx");
    // this->tables.ry = nt::GetEntry(ntInst, "/bv2024/ry");
    // this->tables.rz = nt::GetEntry(ntInst, "/bv2024/rz");

    // this->video = cv::VideoWriter("test.avi", cv::VideoWriter::fourcc('m', 'j', 'g', 'p'), 60, cv::Size(680, 480));

    // nt::SetServer(ntInst, servers);
    // nt::SetServerTeam(this->ntInst, 3407, NT_DEFAULT_PORT4);
    // nt::StartDSClient(ntInst, NT_DEFAULT_PORT4);
}

BPipe::~BPipe() {
    nt::DestroyInstance(this->ntInst);
}

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
                        // Not Tested
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
                        tagPos.rx.push_back(rvecs[0][0]);
                        // yaw
                        tagPos.ry.push_back(rvecs[0][1]);
                        // roll
                        tagPos.rz.push_back(rvecs[0][2]);
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


    // nt::SetDoubleArray(tables.z, tagPos.z);
    // nt::SetDoubleArray(tables.y, tagPos.y);
    // nt::SetDoubleArray(tables.x, tagPos.x);
    // nt::SetDoubleArray(tables.rx, tagPos.rx);
    // nt::SetDoubleArray(tables.ry, tagPos.ry);
    // nt::SetDoubleArray(tables.rz, tagPos.rz);
    // nt::SetIntegerArray(tables.ids, tagPos.id);
    #ifdef TIMESTAMP
        cv::putText(frame, std::to_string(std::chrono::high_resolution_clock::now().time_since_epoch().count()), cv::Point(0, 10), cv::FONT_HERSHEY_DUPLEX, .3, cv::Scalar(0, 255, 0));
    #endif
}