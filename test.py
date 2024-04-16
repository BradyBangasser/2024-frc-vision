import cv2

d = cv2.QRCodeDetector()

data = cv2.imread("./auto-codes/qrcode-80.png")

print(d.detectAndDecode(data))