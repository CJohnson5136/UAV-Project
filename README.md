# Ubuntu Install Guide

```bash
apt-get install golang-go

go get github.com/google/skicka
echo "export PATH=$PATH:$GOPATH/bin" >> ~/.bashrc

git clone https://github.com/OpenDroneMap/OpenDroneMap.git
cd OpenDroneMap
bash configure.sh install

skicka ls
```

At this point you will need to log in to your Google Drive account and authorize Skicka to access your files.
You will also need to set your `project-path` in your `settings.yaml` file to an empty folder you wish to store your images in.

# Usage
```bash
./imageProcessing.sh $driveFolderContainingImages $localLocationToStoreImages $locationOfOpenDroneMapInstall
```
For example:
```bash
./imageProcessing.sh DroneSurvey/Images/ /home/user/images/DroneSurvey/ /home/user/OpenDroneMap
```
The 3D mesh file will be in $localLocationToStoreImages/odm_meshing
A georeferenced 3D mesh file will be in $localLocationToStoreImages/odm_georeferencing
Orthophotos will be in $localLocationToStoreImages/odm_orthophoto

# For more information see:
OpenDroneMap
https://github.com/OpenDroneMap/OpenDroneMap

Skicka
https://github.com/google/skicka
