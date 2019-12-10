#!/bin/bash
curl -Lo train.zip 'https://drive.google.com/uc?export=download&id=1ATQiFtL0h9Ul4gFWL-AS1QCjC4IRtJE0'
unzip train.zip && rm train.zip
rm -f confirm.txt cookies.txt
python flow --model cfg/tiny-yolo-voc-sign.cfg --load bin/tiny-yolo-voc-sign.weights --train --annotation ./train/annotations --dataset ./train/images --epoch 2000 --gpu 0.8
