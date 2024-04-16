from types import NoneType
import cv2
import json
import glob
import time
import numpy as np

f = open("calibration.json")

j = json.load(f)

m = np.zeros((3, 3), "double")
m[:] = np.array(j["matrix"]).reshape((3, 3))
d = np.zeros((5, 1), "double")
d[:] = np.array(j["dist"]).reshape((5, 1))

for img in glob.glob("calibration-imgs/*.jpg"):
    im = cv2.imread(img)
    im0 = im.copy()
    
    if type(im) == NoneType:
        print("Failed", img)
        exit()

    cv2.undistort(src=im, dst=im0, distCoeffs=d, cameraMatrix=m)

    cv2.imshow("this", im)
    cv2.imshow("correction", im0)
    cv2.waitKey()

    time.sleep(30)
    break

cv2.destroyAllWindows()