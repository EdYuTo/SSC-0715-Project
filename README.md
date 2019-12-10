# Students
* Bruno Flavio Ferreira - 9791330
* Edson Yudi Toma - 9791305

# Course
SSC-0715 - Sensores Inteligentes  
2nd Semester of 2019  
Prof. Fernando Santos OSÓRIO  

# Goal
The goal of this project was to train a neural network with transfer learning to detect our object.

* The method used to detect the object was YOLO: https://pjreddie.com/darknet/yolo/
* We used a YOLO python implementation found on https://github.com/thtrieu/darkflow
* The object that we were tying to detect was:

![image](https://user-images.githubusercontent.com/18668585/70563271-b678a800-1b6c-11ea-84c4-6f6f27e72719.png)

# Our Dataset
We had 74 images with the sign disposed in different positions. And, for YOLO to work, we needed to generate annotation files with the bounding box description of the object for each image.

![00](https://user-images.githubusercontent.com/18668585/70563204-95b05280-1b6c-11ea-8a33-bcda067c4d35.jpg)
![02](https://user-images.githubusercontent.com/18668585/70563205-95b05280-1b6c-11ea-8235-3f79f36a29db.jpg)

```
<annotation>
  <folder>./train/images</folder>
  <filename>00.jpg</filename>
  <segmented>0</segmented>
  <size>
    <width>640</width>
    <height>480</height>
    <depth>3</depth>
  </size>
  <object>
    <name>sign</name>
    <pose>Unspecified</pose>
    <truncated>0</truncated>
    <difficult>0</difficult>
    <bndbox>
      <xmin>242</xmin>
      <ymin>239</ymin>
      <xmax>332</xmax>
      <ymax>274</ymax>
    </bndbox>
  </object>
</annotation>
```
This was a manual process.

# Installation
1. Download CUDA toolkit v10.0 from https://developer.nvidia.com/cuda-toolkit-archive
2. Download cuDNN for CUDA toolkit v10.0 from https://developer.nvidia.com/cudnn

3. run `. install.sh` note the `.`, if you forget to add it, the script wont work properly.

# Execution
* run python live.py IPPADDR (where IPADDR is the ip from the ipwebcam app = https://play.google.com/store/apps/details?id=com.pas.webcam&hl=en)
* The ip format must be something like `123.45.678.912` (without `http://` and `:8080`)

# Results
The outcome was really interesting, not only the network training was really fast (because of the transfer learning), but also the program was really good when trying to detect the objects on the scenes (taking into consideration that we had only 74 images to train with).

![example](https://user-images.githubusercontent.com/18668585/70563642-5c2c1700-1b6d-11ea-83c8-360baeda14f8.png)

[Here is a video demo](https://youtu.be/odZQIcEpc9U)
