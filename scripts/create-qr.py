import cv2
import hashlib
import os

qrEncoder = cv2.QRCodeEncoder.create()

AUTO_FOLDER = "auto-codes"

try:
    os.stat(AUTO_FOLDER)
    try:
        os.rmdir(AUTO_FOLDER)
    except:
        os.remove(AUTO_FOLDER)
except:
    None

os.mkdir(AUTO_FOLDER)

while True:
    data = input("Auto Code: ")

    if data == "-1":
        break

    autoCodeData = f"{data}:{hashlib.sha1(data.encode()).hexdigest()}".encode().hex()
    qrCode = qrEncoder.encode("3407a:" + autoCodeData)
    qrCode = cv2.resize(qrCode, (6 * 300, 6 * 300), interpolation=cv2.INTER_NEAREST)

    cv2.imwrite(os.path.join(AUTO_FOLDER, f"qrcode-{data}.png"), qrCode)