#!/bin/bash

export inofile=$SDAPP_FOLDER/../$EXAMPLE.ino
export outfile=$SDAPP_FOLDER/../downloader.h


if [ -f $inofile ]; then
  echo "Compiling $inofile"
  arduino --preserve-temp-files --verbose-build --verify $inofile &>/dev/null
  find /tmp -name \*.partitions.bin -exec rm {} \; #
  find /tmp -name \*.bin -exec mv {} $M5_SD_BUILD_DIR/TobozoLauncher.bin \; #
  cp $M5_SD_BUILD_DIR/TobozoLauncher.bin $M5_SD_BUILD_DIR/menu.bin
else
  echo "WARN: cannot compile menu.bin"
fi

if [ -f $outfile ]; then
  echo "Attempting to enable unstable channel by patching $outfile"
  sed -i -e 's/"\/sd-updater"/"\/sd-updater\/unstable"/g' $outfile
  grep unstable $outfile && export patchok=1 || export patchok=0
  if (( $patchok == 1 )); then
    echo "Compiling Beta $inofile"
    arduino --preserve-temp-files --verbose-build --verify $inofile &>/dev/null
    find /tmp -name \*.partitions.bin -exec rm {} \; #
    find /tmp -name \*.bin -exec mv {} $M5_SD_BUILD_DIR/BetaLauncher.bin \; # 
  else
    echo "Pathing unstable channel failed !!";
  fi
else
  echo "WARN: cannot compile BetaLauncher.bin"
fi

echo "Fake Binary" >> $M5_SD_BUILD_DIR/Downloader.bin
echo "Main APPs Compilation successful, now compiling deps"