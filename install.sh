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
