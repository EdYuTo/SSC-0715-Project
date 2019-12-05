#!/bin/bash
(cd darkflow/utils/ && curl "https://drive.google.com/uc?export=download&id=1-IGFd-XyIVsRWaJkgyPIvskXbMQ8j9v_" -Lo loader.py)
(cd bin/ && curl "https://pjreddie.com/media/files/yolov2-tiny-voc.weights" -Lo tiny-yolo-voc-sign.weights)
(cd cfg/ && curl "https://drive.google.com/uc?export=download&id=1KEZwzSZfbsI3rRibGEKse_pnTocFPe7A" -Lo tiny-yolo-voc-sign.cfg)
curl -L -c cookies.txt 'https://drive.google.com/uc?export=download&id=1ATQiFtL0h9Ul4gFWL-AS1QCjC4IRtJE0' | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p' > confirm.txt
curl -L -b cookies.txt -o train.zip 'https://drive.google.com/uc?export=download&id=1ATQiFtL0h9Ul4gFWL-AS1QCjC4IRtJE0&confirm='$(<confirm.txt)
unzip train.zip && rm train.zip
rm -f confirm.txt cookies.txt
echo "sign" > labels.txt
python flow --model cfg/tiny-yolo-voc-sign.cfg --load bin/tiny-yolo-voc-sign.weights --train --annotation ./train/annotations --dataset ./train/images --epoch 2000 --gpu 0.8