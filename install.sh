#!/bin/bash

# run ". install.sh"

python -m venv venv
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    source "venv/bin/activate"
elif [[ "$OSTYPE" == "msys" ]]; then
    source "venv/Scripts/Activate"
else
        echo "Unknown OS"
        exit 1
fi

placebo="delete"

python -m pip install --upgrade pip setuptools wheel
pip install -r requirements_gpu.txt

git clone https://github.com/thtrieu/darkflow $placebo
mv -t. $placebo/cfg $placebo/darkflow $placebo/flow $placebo/setup.py 
rm -rf $placebo

pip install -e .

mkdir bin/
(cd bin/ && curl https://pjreddie.com/media/files/yolov2.weights -Lo yolo.weights)
(cd darkflow/utils/ && curl "https://drive.google.com/uc?export=download&id=1-IGFd-XyIVsRWaJkgyPIvskXbMQ8j9v_" -Lo loader.py)
(cd bin/ && curl "https://pjreddie.com/media/files/yolov2-tiny-voc.weights" -Lo tiny-yolo-voc-sign.weights)
(cd cfg/ && curl "https://drive.google.com/uc?export=download&id=1KEZwzSZfbsI3rRibGEKse_pnTocFPe7A" -Lo tiny-yolo-voc-sign.cfg)
echo "sign" > labels.txt
