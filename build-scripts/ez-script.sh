#!/bin/bash

#
#
# EZ Script V0.1 for Dirty Unicorns
#
# Created by Michael S Corigliano (Mike Criggs) (michael.s.corigliano@gmail.com)
# for DirtyUnicorns (www.dirtyunicorns.com)
#
# Small portions of this script have been taken from the "Nicholas-Build-Script.sh"
# created by Nicholas Chancellor (nathanchance) (natechancellor@gmail.com).
# It can be found here: http://github.com/DirtyUnicorns/DU-Scripts/build-scripts/Nathan-Build-Script.git
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
# USAGE: sudo ./ez-build.sh
# TIP: You can stop the script at any time with the key combination 'CTRL+C'
#

NOW=$(date +"%Y-%m-%d-%S")

# Colors for terminal output
BLDRED="\033[1m""\033[31m"
RST="\033[0m"

# Let user know that they are using EZ Script
	clear
	echo -e ${BLDRED}"EZ Script V0.1 for Dirty Unicorns by Mike Criggs"${RST}
	echo -e

# Where is the source located?
	read -p "Where is your source located? (e.g: /home/criggs/du-source) " -e SOURCEDIR
	clear

# Change directories to source directory
	cd $SOURCEDIR

# What device are we building for?
	read -p "What device are we building for? (e.g: shamu) " -e DEVICE
	clear
 
# Make 'build-logs' directory if it doesn't already exist
  	echo -e ${BLDRED}"Making a 'logs/build-logs' for your convenience..."${RST}
	echo -e ""
	mkdir -p logs
	mkdir -p logs/build-logs


# Make 'build-logs' directory if it doesn't already exist
  	echo -e ${BLDRED}"Making a 'logs/sync-logs' for your convenience..."${RST}
	echo -e ""
	mkdir -p logs/sync-logs

 
# Do we want to repo sync?
	read -r -p "Would you like to sync the latest sources? [Y/N] " answer
	if [[ $answer =~ ^([yY][eE][sS]|[yY])$ ]]
	then
		echo -e ${BLDRED}"Syncing latest sources from GitHub... "${RST} && repo sync 2>&1 | tee logs/sync-logs/du_$DEVICE-$NOW.log
	else
		echo -e ${BLDRED}"Not syncing latest sources from GitHub... "${RST}
	fi

# Do we want to build clean?
	read -r -p "Would you like to build clean? [Y/N] " answer
	if [[ $answer =~ ^([yY][eE][sS]|[yY])$ ]]
 	then
   		echo -e ${BLDRED}"Building clean..."${RST} && make clean
	else
		echo -e ${BLDRED}"Not building clean..."${RST}
	fi
 
# Invoke the environment setup script to start the building process
	echo -e ${BLDRED}"Setting up build environment..."${RST}
	echo -e ""
	. build/envsetup.sh
 
# Grab device dependencies with roomservice and eat lunch
	echo -e ${BLDRED}"Eating lunch..."${RST}
	echo -e ""
	lunch du_$DEVICE-userdebug
	clear

# Start tracking build time
	echo -e ${BLDRED}"Build starting at $(date +%D\ %r)..."${RST}
	echo -e ""
	START=$(date +%s)

# Execute the build while sending a log to 'build-logs'
	echo -e ${BLDRED}"Starting build..."${RST}
	echo -e ""
	make bacon 2>&1 | tee build-logs/du_$DEVICE-$NOW.log

# Stop tracking build time
	echo -e ${BLDRED}"EZ Script for Dirty Unicorns has ended at $(date +%D\ %r)"${RST}
	echo -e ""
	echo -e ${BLDRED}"Your build took $(echo $(($END-$START)) | awk '{print int($1/60)"mins "int($1%60)"secs"}') to complete"${RST}
	echo -e ""
	END=$(date +%s)
 
# Let the user know that the EZ Script has ended has finished
printf "If your repo sync failed, check the 'logs/sync-logs' folder\nto figure out why. \n \nIf your build failed, please check the 'logs/build-logs' folder\nto figure out why.\n \nTIP: search your build log for the most common error signals\nwith CTRL+F\n \n'unfinished job(s)', 'finishing job(s)', etc\n \nBe sure to search Google and XDA (www.xda-developers.com)\nfor your errors. If you have exhausted all self-help and \nfeel that you need help, please turn to XDA. There are some\namazing people there who would love to help you! \n"

# End of EZ Script

