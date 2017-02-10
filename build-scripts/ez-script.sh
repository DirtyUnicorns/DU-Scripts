#!/bin/bash

#
# EZ Script
#
# Created by Michael S Corigliano (Mike Criggs) (michael.s.corigliano@gmail.com)
# Adapted for Dirty Unicorns (DU) from a portion of the EZ AOSP tool
#
# DU GitHub: https://github.com/DirtyUnicorns
# DU Website: http://dirtyunicorns.com
# EZ AOSP GitHub: https://github.com/mikecriggs/ez-aosp
# EZ AOSP build script: https://github.com/mikecriggs/ez-aosp/blob/master/build-rom.sh
#
# Usage: cd <DU-SOURCE>
#        git clone git://github.com/DirtyUnicorns/DU-Scripts
#        mv ez-script.sh ..
#        rm -rf DU-Scripts (if you no longer wish to keep the directory)
#        ./ez-script.sh <DEVICE>
#
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Colors for terminal output
BLDRED="\033[1m""\033[31m"
RST="\033[0m"

# Time tracking
NOW=$(date +"%Y-%m-%d-%S")
START=$(date +%s)
END=$(date +%s)

# ROM being built
$ROM=DirtyUnicorns

# What device are we building for?
        DEVICE=$(whiptail --title "EZ Script" --inputbox "What device are we compiling $ROM for (e.g: shamu)?" 10 70 3>&1 1>&2 2>&3)
        exitstatus=$?
        if [ $exitstatus = 0 ]; then
                whiptail --title "EZ Script" --msgbox "We will compile $ROM for $DEVICE" 20 70
        else
                whiptail --title "EZ Script" --msgbox "You did not tell us what device we are compiling $ROM for. Exiting EZ Script. Please rerun 'ez-script.sh'." 20 70
                sleep
                exit
  fi
  clear

# Make 'logs/build' directory if it doesn't already exist
    echo -e ${BLDRED}"Making a 'logs/build' for your convenience..."${RST}
  echo -e ""
  echo -e ""
  sleep 3
    mkdir -p logs
    mkdir -p logs/build
  clear


# Make 'logs/repo-sync' directory if it doesn't already exist
    echo -e ${BLDRED}"Making a 'logs/repo-sync' for your convenience..."${RST}
  echo -e ""
  echo -e ""
  sleep 3
    mkdir -p logs
    mkdir -p logs/repo-sync
  clear

# Do we want to sync the latest source code from our repositories?
  if(whiptail --title "EZ Script" --yesno "Would you like to sync the latest source code from the $ROM repositories?" 10 70) then
    echo -e ${BLDRED}"Syncing latest source code from $ROM repositories..."${RST}
    sleep 3
    repo sync 2>&1 | tee logs/repo-sync/$ROM-$NOW.log
    sleep 3
    clear
  else
    echo -e ${BLDRED}"Not syncing latest source code from $ROM repositories..."${RST}
    sleep 3
    clear
  fi

# Do we want to use NINJA wrapper?
  if(whiptail --title "EZ Script" --yesno "Would you like to use the NINJA wrapper to compile the $ROM source code?" 10 70) then
    echo -e ${BLDRED}"Compiling $ROM with NINJA..."${RST}
    sleep 3
  else
    echo -e ${BLDRED}"Not compiling $ROM with NINJA..."${RST}
    sleep 3
    export USE_NINJA=false
  fi

# Do we need to use Jack Server workarounds?
  if(whiptail --title "EZ Script" --yesno "If your machine has less than 16GB of RAM, we may need to use some Jack server workarounds. Would you like to use these?" 30 70) then
    echo -e ${BLDRED}"Using Jack server workarounds..."${RST}
    sleep 3
    rm -rf ~/.jack*
    ./prebuilts/sdk/tools/jack-admin kill-server
    ulimit -n unlimited
    export ANDROID_JACK_VM_ARGS="-Xmx4096g -Dfile.encoding=UTF-8 -XX:+TieredCompilation"
    export SERVER_NB_COMPILE=2
    export ANDROID_JACK_VM_ARGS=$JACK_SERVER_VM_ARGUMENT
    ./prebuilts/sdk/tools/jack-admin install-server prebuilts/sdk/tools/jack-launcher.jar prebuilts/sdk/tools/jack-server-4.8.ALPHA.jar
    ./prebuilts/sdk/tools/jack-admin start-server
  else
    echo -e ${BLDRED}"Not using Jack server workarounds..."${RST}
    sleep 3
  fi

# Do we want to build clean?
  if(whiptail --title "EZ Script" --yesno "Would you like to build clean? If you used Jack server workarounds, it is recommended to do so or your build may fail." 30 70) then
    echo -e ${BLDRED}"Building clean..."${RST}
    sleep 3
    make clean
    clear
  else
    echo -e ${BLDRED}"Not building clean..."${RST}
    sleep 3
  fi

# Setup environment and grab device dependencies
  echo -e ${BLDRED}"Getting ready and grabbing device dependencies..."${RST}
  echo -e ""
  echo -e ""
  sleep 3
  . build/envsetup.sh
  lunch du_$DEVICE-userdebug

# Start tracking build time
  echo -e ${BLDRED}"Build starting at $(date +%D\ %r)..."${RST}
  echo -e ""
  echo -e ""
  sleep 3

# Start the build while sending a log to 'build-logs'
  make bacon 2>&1 | tee logs/build/du_$DEVICE-$NOW.log

# Stop tracking build time
  echo -e ${BLDRED}"ROM compilation has ended at $(date +%D\ %r)"${RST}
  echo -e ""
  echo -e ${BLDRED}"It took $(echo $(($END-$START)) | awk '{print int($1/60)"mins "int($1%60)"secs"}') to complete"${RST}
  echo -e ""
  sleep 3

# Let the user know that the script has finished
whiptail --title "EZ Script" --msgbox "The script has finished. If your repo sync failed, check the 'logs/repo-sync' folder\nto figure out why. \n \nIf your build failed, please check the 'logs/build' folder\nto figure out why.\n \nTIP: search your build logs for the most common error signals and save the actual errors from above or below the following text(s):\n \n'unfinished job(s)', 'finishing job(s)', etc\n \nBe sure to search Google, Devs-Base (www.devs-base.com), Stack Overflow (www.stackoverflow.com), and XDA Developers (www.xda-developers.com)\nfor your errors. If you have exhausted all self-help and \nfeel that you need outside help, please turn to Devs-Base, Stack Overflow, or XDA Developers. There are some\namazing people in these communities who would love to help you!\n" 30 70