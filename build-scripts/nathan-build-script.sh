#!/usr/bin/env bash
#
# Copyright (C) 2016-2017 Nathan Chancellor
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>


###############################
# DIRTY UNICORNS BUILD SCRIPT #
###############################

# Build Dirty Unicorns with one easy script. You will need to have the repo
# synced and configured already, use this page to help you with that:
# https://raw.githubusercontent.com/nathanchance/Android-Tools/master/Building_AOSP.txt


#########
# Usage #
#########

# $ bash nathan-build-script.sh -h

# Script needs to be run in a subshell; sourcing can break stuff
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo -e "\033[01;31m"
    echo "Script cannot be sourced, please run it with the bash command!"
    echo -e "\033[0m"
    return 0
fi


######################
# Required variables #
######################

# SOURCE_DIR: The directory that holds your DU repos. This is automatically
#             three folders above the scripts location as it is located in
#             vendor/scripts/build-scripts. Since the script will be symlinked
#             by the manifest, we need to use readlink to get where it actually is.

SOURCE_DIR=$( cd $( dirname $( readlink -f "${BASH_SOURCE[0]}" ) )/../../.. && pwd )


########################
# Changeable variables #
########################

# DEST_DIR: The directory that will hold your completed DU zip files for ease of
#           access (for example, /home/<username>/completed_zip). Only edit this
#           if you want your zips moved after compilation.
#
# LOG_DIR: The directory that will hold build logs. This is automatically a
#          folder within the ROM source (this can be changed)

DEST_DIR=
LOG_DIR="${SOURCE_DIR}"/build-logs


##########
# Colors #
##########

BOLD="\033[1m"
RED="\033[01;31m"
RST="\033[0m"
YLW="\033[01;33m"


#############
# Functions #
#############

# Prints a formatted header; used for outlining what the script is doing
function echoText() {
    echo -e ${RED}
    echo -e "====$( for i in $( seq ${#1} ); do echo -e "=\c"; done )===="
    echo -e "==  ${1}  =="
    echo -e "====$( for i in $( seq ${#1} ); do echo -e "=\c"; done )===="
    echo -e ${RST}
}

# Prints an error in bold red
function reportError() {
    echo -e ""
    echo -e ${RED}"${1}"${RST}
    if [[ -z ${2} ]]; then
        echo -e ""
    fi
}

# Prints a warning in bold yellow
function reportWarning() {
    echo -e ""
    echo -e ${YLW}"${1}"${RST}
    if [[ -z ${2} ]]; then
        echo -e ""
    fi
}

# Formats the time at the end
function format_time() {
    MINS=$(((${1}-${2})/60))
    SECS=$(((${1}-${2})%60))
    if [[ ${MINS} -ge 60 ]]; then
        HOURS=$((${MINS}/60))
        MINS=$((${MINS}%60))
    fi

    if [[ ${HOURS} -eq 1 ]]; then
        TIME_STRING+="1 HOUR, "
    elif [[ ${HOURS} -ge 2 ]]; then
        TIME_STRING+="${HOURS} HOURS, "
    fi

    if [[ ${MINS} -eq 1 ]]; then
        TIME_STRING+="1 MINUTE"
    else
        TIME_STRING+="${MINS} MINUTES"
    fi

    if [[ ${SECS} -eq 1 && -n ${HOURS} ]]; then
        TIME_STRING+=", AND 1 SECOND"
    elif [[ ${SECS} -eq 1 && -z ${HOURS} ]]; then
        TIME_STRING+=" AND 1 SECOND"
    elif [[ ${SECS} -ne 1 && -n ${HOURS} ]]; then
        TIME_STRING+=", AND ${SECS} SECONDS"
    elif [[ ${SECS} -ne 1 && -z ${HOURS} ]]; then
        TIME_STRING+=" AND ${SECS} SECONDS"
    fi

    echo ${TIME_STRING}
}

# Get the devices to compile
function get_devices {
    local DEVICE_LIST

    # Get the list of devices from the vendorsetup.sh file
    if [[ $( grep -i "n7x-caf" "${SOURCE_DIR}"/manifest/* ) ]]; then
        VENDORSETUP=$( cat "${SOURCE_DIR}"/vendor/du/caf-vendorsetup.sh )
    else
        VENDORSETUP=$( cat "${SOURCE_DIR}"/vendor/du/vendorsetup.sh )
    fi

    for TEMP in ${VENDORSETUP}; do
        DEVICE_LIST+="$( echo ${TEMP} | awk -v FS="(du_|-userdebug)" '{print $2}' ) "
    done

    # Add some bars to make it look pretty when displaying to user
    DEVICE_LIST=$( echo ${DEVICE_LIST} | sed -r 's/\s/ | /g' )

    echo ${DEVICE_LIST}
}

# Jack workaround for slow computers
function jack_workaround() {
    # Only allow one stream of compilation
    export SERVER_NB_COMPILE=1
    # Jack arguments
    export JACK_SERVER_VM_ARGUMENTS="-Xmx${1}g
                                     -XX:+TieredCompilation
                                     -Dfile.encoding=UTF-8"
    # Server restart is only needed if jack is already installed
    if [[ -d ${HOME}/.jack-server ]]; then
        ./prebuilts/sdk/tools/jack-admin kill-server
        ./prebuilts/sdk/tools/jack-admin start-server
    fi
}

# Get proper make command
function make_command() {
    if [[ $( command -v mka ) ]]; then
        mka $@
    else
        make -j$( nproc --all ) $@
    fi
}

# Print a help menu!
function help_menu() {
    SCRIPT_NAME=$( basename "${BASH_SOURCE[0]}" )
    echo -e "${BOLD}OVERVIEW:${RST} Build DU from source!\n"
    echo -e "${BOLD}USAGE:${RST} bash ${SCRIPT_NAME} <device> <options>\n"
    echo -e "${BOLD}EXAMPLE:${RST} bash ${SCRIPT_NAME} angler sync log jack 8\n"
    echo -e "${BOLD}REQUIRED PARAMETERS:${RST}\n"
    echo -e "   device:     $( get_devices )\n"
    echo -e "${BOLD}OPTIONAL PARAMETERS:${RST}\n"
    echo -e "   jack #:     Works around Jack issues on low memory machines"
    echo -e "               You may need this if you have less than 16GB of RAM"
    echo -e "               Replace # with your RAM in GB (e.g. jack 6)\n"
    echo -e "   sync:       Performs a repo sync before building"
    echo -e "               Default is no sync\n"
    echo -e "   noclean:    Only partially clean the out folder"
    echo -e "               Default is full out folder removal"
    echo -e "               Removing the out folder is always recommended"
    echo -e "               Only add this flag if you have slower hardware\n"
    echo -e "   log:        Log the build output to a file"
    echo -e "               Folder defaults to ${SOURCE_DIR}/build-logs"
    echo -e "               Default value is no log\n"

    exit
}


#################
# Sanity checks #
#################

# Always assume the user doesn't know what they are doing :^)

if [[ ! $( uname -a | grep -i "Linux" ) ]]; then
    reportError "You're not running this script on Linux!"
    exit
elif [[ -z ${SOURCE_DIR} ]] && [[ ! -d "${SOURCE_DIR}" ]]; then
    reportError "There was an issue with reading the source directory!" -c
    reportError "Make sure readlink is installed!"
elif [[ ! -d "${SOURCE_DIR}"/.repo ]]; then
    reportError "The source directory found does not have a .repo folder!" -c
    reportError "Make sure readlink is installed!"
    exit
fi


##############
# Parameters #
##############

# If there are no arguments, print the help menu
if [[ $# -eq 0 ]]; then
    echo
    help_menu
fi

# Parse parameters
while [[ $# -ge 1 ]]; do
    PARAMS+="${1} "

    case "${1}" in
        "sync")
            SYNC=true ;;
        "noclean")
            CLEAN=false ;;
        "log")
            if [[ -z ${LOG_DIR} ]]; then
                reportError "LOG_DIR is not set but a log was requested!"
            else
                LOG=true
            fi  ;;
        "jack")
            shift
            if [[ $# -ge 1 ]]; then
                RAM=${1}
                NEED_JACK=true
            else
                reportError "Jack parameter must take a RAM value!"
                help_menu
            fi ;;
        "-h"|"--help")
            echo
            help_menu ;;
        *)
            if [[ $( get_devices | grep ${1} ) ]] ; then
                 DEVICE=${1}
                 OUT_DIR="${SOURCE_DIR}"/out/target/product/${DEVICE}
            else
                reportError "Invalid parameter detected!"
                help_menu
            fi ;;
    esac

    shift
done

if [[ -z ${DEVICE} ]] || [[ -z ${OUT_DIR} ]]; then
    reportError "You did not specify a device or it was invalid!"
    help_menu
fi


#####################
# START OF BUILDING #
#####################

# Start tracking the time to see how long it takes the script to run
clear
START=$( date +%s )

# Move into the directory containing the source
cd "${SOURCE_DIR}"

# Do jack workaround right at the beginning
if [[ ${NEED_JACK} = true ]]; then
    reportWarning "Jack workaround enabled for ${RAM}GB of RAM"
    # RAM - 1 for overhead
    jack_workaround $(( ${RAM} - 1 ))
fi

# Sync the repo if requested
if [[ ${SYNC} = true ]]; then
    echoText "SYNCING LATEST SOURCES"
    repo sync --force-sync -j$( nproc --all )
fi

# Setup the build environment
echoText "SETTING UP BUILD ENVIRONMENT"
source build/envsetup.sh

# Arch support
if [[ $( command -v pacman ) ]]; then
    if [[ $( python -V | grep -i "Python 3." ) ]]; then
        reportWarning "Python 3 is detected, looking for Python 2 fallback..."

        if [[ $( command -v virtualenv2 ) ]]; then
            virtualenv2 ${HOME}/venv && source ${HOME}/venv/bin/activate

            ACTIVE_VENV=true
        else
            reportError "Python 2 not found! Install python2-virtualenv."
        fi
    fi
fi

# Prepare device
echoText "PREPARING $( echo ${DEVICE} | awk '{print toupper($0)}' )"
breakfast ${DEVICE}

# Clean up the out folder
echoText "CLEANING UP OUT FOLDER"
if [[ ${CLEAN} = false ]]; then
    make installclean
else
    make clobber
fi

# Start building the zip file
echoText "MAKING ZIP FILE"
NOW=$( date +"%Y-%m-%d-%S" )
if [[ ${LOG} = true ]]; then
    mkdir -p ${LOG_DIR}
    time make_command bacon | tee -a ${LOG_DIR}/du_${DEVICE}-${NOW}.log
else
    time make_command bacon
fi

# If the above compilation was successful, let's notate it
FILES=$( ls "${OUT_DIR}"/*.zip 2>/dev/null | wc -l )
if [[ ${FILES} != 0 ]]; then
    BUILD_RESULT_STRING="BUILD SUCCESSFUL"

    # If there is only one zip file in the OUT_DIR, we just need that file
    if [[ ${FILES} = 1 ]]; then
        ZIP_FILE=$( ls "${OUT_DIR}"/*.zip* )
    else
        # Otherwise, it will be the zip file that doesn't have ota in it
        ZIP_FILE=$( ls "${OUT_DIR}"/*.zip* | grep -m 1 -v ota )
    fi

    if [[ -n ${DEST_DIR} ]]; then
        # Copy new files from the OUT_DIR to DEST_DIR (for easy of access)
        echoText "MOVING FILES"

        # Make the DEST_DIR if it doesn't exist
        if [[ ! -d "${DEST_DIR}" ]]; then
            mkdir -p "${DEST_DIR}"
        fi

        # Move the zip file
        mv "${ZIP_FILE}"* "${DEST_DIR}"

        # Notate where the zip file is for end of script
        ZIP_LOCATION="${DEST_DIR}"/$( basename "${ZIP_FILE}" )
    else
        ZIP_LOCATION="${ZIP_FILE}"
    fi

# If the build failed, add a variable
else
   BUILD_RESULT_STRING="BUILD FAILED"
fi

# Stop tracking time
END=$(date +%s)

# If there is a venv active, deactivate it
if [[ ${ACTIVE_VENV} = true ]]; then
    deactivate && rm -rf ${HOME}/venv
fi

echoText "${BUILD_RESULT_STRING}!"

# If there is a zip, print some info about it
if [[ -n ${ZIP_LOCATION} ]]; then
    echo -e ${RED}"ZIP: $( ls "${ZIP_LOCATION}" )"
    echo -e "SIZE: $( du -h "${ZIP_LOCATION}" | awk '{print $1}' )"${RST}
fi

# Print the time the script ended, how long it took, and the log if present
echo -e ${RED}"TIME: $( TZ=MST date +%D\ %r | awk '{print toupper($0)}' )"
echo -e "DURATION: $( format_time ${END} ${START} )"${RST}
if [[ ${LOG} = true ]]; then
    echo -e ${RED}"BUILD LOG: ${LOG_DIR}/du_${DEVICE}-${NOW}.log"${RST}
fi

# Play audible alert that script has ended
echo -e "\a"
