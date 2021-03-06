#!/bin/bash


#- curl -v --retry 5 "https://api.github.com/repos/lovyan03/M5Stack_LovyanLauncher/releases/latest?access_token=$GH_TOKEN" | jq -r "".assets[0].browser_download_url"" | wget --output-document=M5Burner.zip -i -
#- unzip -d /tmp M5Burner.zip
#- cp /tmp/M5Burner/firmwares/LovyanLauncher/LovyanLauncher.bin $M5_SD_BUILD_DIR/
#- rm -Rf /tmp/M5Burner

cd /tmp

wget https://github.com/lovyan03/M5Stack_LovyanLauncher/archive/master.zip --output-document=M5Stack_LovyanLauncher.zip
unzip -d /tmp M5Stack_LovyanLauncher.zip
cp -Rf /tmp/M5Stack_LovyanLauncher-master/LovyanLauncher/build/* $M5_SD_BUILD_DIR/
rm -Rf /tmp/M5Stack_LovyanLauncher*

wget https://github.com/lovyan03/M5Stack_LovyanToyBox/archive/master.zip --output-document=M5Stack_LovyanToyBox.zip
unzip -d /tmp M5Stack_LovyanToyBox.zip
cp -Rf /tmp/M5Stack_LovyanToyBox-master/LovyanLauncher/build/* $M5_SD_BUILD_DIR/
rm -Rf /tmp/M5Stack_LovyanToyBox*

wget https://github.com/robo8080/SD_Updater_TestData/archive/master.zip --output-document=SD-Apps.zip
unzip -d /tmp SD-Apps.zip
cp -uf /tmp/SD_Updater_TestData-master/*.bin $M5_SD_BUILD_DIR/
cp -Rf /tmp/SD_Updater_TestData-master/jpg $M5_SD_BUILD_DIR/
cp -Rf /tmp/SD_Updater_TestData-master/json $M5_SD_BUILD_DIR/
rm -Rf /tmp/SD_Updater_TestData*

wget https://github.com/mongonta0716/M5Stack-Avatar-fugu1/archive/master.zip --output-document=M5Stack-Avatar-fugu1.zip
unzip -d /tmp M5Stack-Avatar-fugu1.zip
cp -Rf /tmp/M5Stack-Avatar-fugu1-master/Avatar_fugu/jpg $M5_SD_BUILD_DIR/
cp -Rf /tmp/M5Stack-Avatar-fugu1-master/Avatar_fugu/json $M5_SD_BUILD_DIR/
cp -Rf /tmp/M5Stack-Avatar-fugu1-master/Avatar_fugu/*.bin $M5_SD_BUILD_DIR/
rm -Rf /tmp/M5Stack-Avatar-fugu1-master

wget https://github.com/EiichiroIto/m5apple2/archive/master.zip --output-document=m5apple2.zip
unzip -d /tmp m5apple2.zip
cp -Rf /tmp/m5apple2-master/bin/* $M5_SD_BUILD_DIR/
rm -Rf /tmp/m5apple2*

