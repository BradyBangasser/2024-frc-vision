#include "qrcode.hpp"

#include <vector>
#include <string>
#include <visionserver2.h>
#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/objdetect.hpp>
#include <networktables/NetworkTable.h>


QRCodePipeline::QRCodePipeline(std::string name, std::string accepts[]) : vs2::VPipeline<QRCodePipeline>(name) {
    this->accepts = accepts;
    this->ntEntry = this->ntable()->GetEntry("qr");
}

void QRCodePipeline::process(cv::Mat &frame) {
    if (!enabled) return;
    std::string tagData = this->detector.detectAndDecode(frame);
    std::cout << this->GetActualFPS() << "\n";

    if (tagData != "" && data == tagData) {
        count++;

        if (count >= 180) {
            std::string hexData = data.substr(5);
            std::string dataBuilder;
            for (size_t i = 0; i < hexData.size(); i += 2) {
                dataBuilder.push_back((char) std::stoi(hexData.substr(i, i + 2), nullptr, 16));
            }

            this->ntEntry.SetString(dataBuilder.substr(0, dataBuilder.find(':')));
            this->enabled = false;
        }
    } else {
        count = 0; 
        if (tagData.starts_with("3407a")) data = tagData;
    }
}