import cv2
from darkflow.net.build import TFNet
import numpy as np
import urllib.request
import sys

if len(sys.argv) != 2:
    print("Usage: python", sys.argv[0], "IPADDR")
    sys.exit(-1)

options = {
    'model': 'cfg/yolo.cfg',
    'load': 'bin/yolo.weights',
    'threshold': 0.5,
    'gpu': 0.8
}

'''options = {
    'model': 'cfg/tiny-yolo-voc-sign.cfg',
    'load': 7250,
    'threshold': 0.0,
    'gpu': 0.8
}'''

tfnet = TFNet(options)
colors = [tuple(255 * np.random.rand(3)) for _ in range(10)]

URLPORT = ':8080'
URLPREFIX = 'http://'
URLSUFIX = '/shot.jpg'
IPADD = sys.argv[1]
URL = URLPREFIX + IPADD + URLPORT + URLSUFIX
FONTCOLOR = (0, 255, 0) # (B, G, R)

while True:
    try:
        img_arr = np.array(bytearray(urllib.request.urlopen(URL).read()),dtype=np.uint8)
        img = cv2.imdecode(img_arr,-1)
    except:
        print("Connection error")
        break
    try:
        results = tfnet.return_predict(img)
        for color, result in zip(colors, results):
            tl = (result['topleft']['x'], result['topleft']['y'])
            br = (result['bottomright']['x'], result['bottomright']['y'])
            label = result['label']
            confidence = result['confidence']
            text = '{}: {:.0f}%'.format(label, confidence * 100)
            img = cv2.rectangle(img, tl, br, color, 5)
            img = cv2.putText(
                img, text, tl, cv2.FONT_HERSHEY_COMPLEX, 1, FONTCOLOR, 2)
        cv2.imshow('img', img)
    except:
        print("error")
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cv2.destroyAllWindows()
