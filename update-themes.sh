#!/bin/bash
# Copyright (C) 2015 DirtyUnicorns
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

WORKING_DIR=/home/mazda/du

function delete_useless () {
  declare -a array=($@)
  for i in `seq 0 $(( ${#array[@]} - 1 ))`
  do
    rm -rf "${array[i]}"
  done
}

function process_all () {
  declare -a array=($@)
  for i in `seq 0 $(( ${#array[@]} - 1 ))`
  do
    echo "Removing unneeded items in ${array[i]}"
    if [[ ${array[i]} == frameworks* ]]; then
      cd $WORKING_DIR/${array[i]}
      echo $WORKING_DIR/${array[i]}
    else
      cd $WORKING_DIR/packages/apps
    fi
    if [ -d ${array[i]} ]; then
      cd ${array[i]}
      delete_useless ${common[@]}
      cd res
      delete_useless ${res[@]}
      cd values
      delete_useless ${values[@]}
    else
      echo "${array[i]]} package not found"
    fi
    cd $WORKING_DIR
  done
}

function copy_all () {
  declare -a array=($@)
  for i in `seq 0 $(( ${#array[@]} - 1 ))`
  do
    cd $WORKING_DIR/packages/apps
    cp -r ${array[i]} $WORKING_DIR/DU-Scripts/themes-resources/packages/apps/
  done
}

declare -a root=('DU-Scripts' 'abi' 'bionic' 'art' 'bootable' 'build' 'dalvik' 'development' 'device' 'external' 'frameworks' 'hardware' 'kernel' 'libcore' 'libnativehelper' 'manifest' 'ndk' 'out' 'packages' 'pdk' 'prebuilts'
                 'sdk' 'system' 'tools' 'vendor')

declare -a frameworks=('api' 'cmds' 'data' 'docs' 'drm' 'graphics' 'include' 'keystore' 'libs' 'location' 'media' 'native' 'nfc-extras' 'obex' 'opengl' 'policy' 'rs' 'samples' 'sax' 'security-bridge' 'services' 'telecomm'
                       'telephony' 'test-runner' 'tests' 'tools' 'wifi')

declare -a common=('common.mk' '.classpath' '.git' '.gitignore' '.idea' '.project' 'assets' 'build.gradle' 'src' 'tests' 'Android.mk' 'CleanSpec.mk' 'lint.xml' 'MODULE_LICENSE_APACHE2' 'NOTICE' 'preloaded-classes'
                   'proguard.cfg' 'proguard.flags' 'proguard-test.flags' 'wrap_alpha.py' 'tools' 'tests' 'extensions_src' 'mkprojectfile' 'project.properties' 'hero.png' 'LICENSE' 'README.md' 'script' 'jni' 'res_p' 'sounds'
                   'src_pd' 'src_pd_gcam' 'tests_camera' 'version.mk' 'COPYING' 'ReadMe.md' 'WallpaperPicker' 'protos' 'util' 'fill_screens.py' 'print_db.py' 'update_gallery_files.py' 'update_system_wallpaper_cropper.py'
                   'cyanoden-dsp' 'emailcommon' 'transition' 'TestCommon' 'provider_src' 'gallerycommon' 'jni_jpegstream' 'apptests' 'libs' 'info_lookup' 'src_plugin' 'perf-tests' 'app-perf-tests' 'src-N' 'src-pre-N' 'build-app.gradle' 'build-library.gradle' 'local.properties' 'gradlew.bat' 'gradlew' 'gradle' 'build.gradle' '.idea' 'settings.gradle' 'gradle.properties' 'proguard-rules.pro' 'v' '*.jar' 'build' 'ForceProguard.mk' 'proguard-release.flags' 'Readme.md')

declare -a packages=('StatementService' 'BackupRestoreConfirmation' 'CaptivePortalLogin' 'DefaultContainerService' 'ExternalStorageProvider' 'FakeOemFeatures' 'FusedLocation' 'InputDevices' 'Keyguard' 'PrintSpooler' 'SettingsProvider'
                     'SharedStorageBackup' 'Shell' 'VpnDialogs' 'WAPPushManager' 'WAPPushManager' 'WallpaperCropper' 'services' 'WallpaperBackup' 'PrintRecommendationService' 'Osu' 'MtpDocumentsProvider' 'ExtShared' 'ExtServices' 'CtsShim')

declare -a res=('Android.mk' 'AndroidManifest.xml' 'MODULE_LICENSE_APACHE2' 'NOTICE' 'lint.xml' 'assets' 'menu*' 'values-*' 'xml*' 'interpolator' 'raw*' 'anim*' 'animator' 'transition' 'MakeJavaSymbols.sed' 'tests' 'src' 'build.gradle' 'proguard.flags' 'setting' 'gradlew' 'gradlew.bat')

declare -a values=('all_search_engines.xml' 'appmsg_colors.xml' 'arrays.xml' 'attrs_manifest.xml' 'bookmarks_icons.xml' 'bools.xml' 'config.xml' 'defaults.xml' 'donottranslate.xml' 'donottranslate_config.xml'
                   'aliases.xml' 'crop_colors.xml' 'dslv_attrs.xml' 'animation_constants.xml' 'donottranslate-cldr.xml' 'donottranslate-maps.xml' 'donottranslate-names.xml' 'donottranslate_material.xml'
                   'donottranslate-search_engines.xml' 'du_arrays.xml' 'du_strings.xml' 'du_symbols.xml' 'fractions.xml' 'ids.xml' 'integers.xml' 'internal.xml' 'keys.xml' 'lland_config.xml' 'lland_strings.xml' 'plurals.xml'
                   'public.xml' 'strings.xml' 'symbols.xml' 'vpi_attrs.xml' 'vpi_defaults.xml' 'cm_arrays.xml' 'cm_plurals.xml' 'cm_strings.xml' 'custom_strings.xml' 'custom_arrays.xml' 'vpi__defaults.xml' 'vpi__attrs.xml'
                   'nontranslatables.xml' 'accountprovider.xml' 'constants.xml' 'codeaurora_strings.xml' 'filtershow_ids.xml' 'filtershow_strings.xml' 'filtershow_values.xml' 'filtershow_values_attrs.xml')

declare -a core=('java' 'jni' 'tests' 'src')

declare -a theme_packages=('Calculator' 'Calendar' 'CalendarWidget' 'Camera2' 'Contacts' 'ContactsCommon' 'DUI' 'DU-Tweaks' 'DeskClock' 'Dialer' 'Gallery2'
                           'Launcher3' 'Messaging' 'OmniSwitch' 'PhoneCommon' 'Settings' 'Stk')

declare -a extra=('java' '.idea' 'gradle' '.gitignore' 'build.gradle' 'gradlew' 'gradlew.bat' 'local.properties' 'proguard-rules.pro' 'proguard.flags')

cd $WORKING_DIR
echo "Removing files so we can clean sync"
delete_useless ${root[@]}
cd .repo
rm -rf local_manifests
cd ..
echo "Repo Syncing........."
repo sync --force-sync >> /dev/null
if [ $? -eq 0 ]; then
  echo "Repo Sync success"
else
  echo "Repo Sync failure"
  exit 1
fi
echo "Cloning Theme Resources repo"
git clone https://github.com/DirtyUnicorns/DU-Scripts.git
echo "Removing unneeded files"
cd frameworks/base
delete_useless ${frameworks[@]}
cd packages
delete_useless ${packages[@]}
cd SystemUI
delete_useless ${common[@]}
rm -rf docs
cd res
delete_useless ${res[@]}
cd values
delete_useless ${values[@]}
cd ../../../SettingsLib
delete_useless ${common[@]}
cd res
delete_useless ${res[@]}
cd values
delete_useless ${values[@]}
cd ../../../DocumentsUI
delete_useless ${common[@]}
cd res
delete_useless ${res[@]}
cd values
delete_useless ${values[@]}
cd ../../../EasterEgg
delete_useless ${common[@]}
cd res
delete_useless ${res[@]}
cd values
delete_useless ${values[@]}
cd ../../../../core
delete_useless ${core[@]}
cd res
delete_useless ${res[@]}
cd res
delete_useless ${res[@]}
cd values
delete_useless ${values[@]}
rm -rf  $WORKING_DIR/DU-Scripts/themes-resources/frameworks
cd $WORKING_DIR
cd packages/apps/DU-Updater
delete_useless ${common[@]}
cd $WORKING_DIR/packages/apps/DU-Updater/app/src/main
delete_useless ${extra[@]}
cd $WORKING_DIR/packages/apps/DU-Updater/app/
delete_useless ${extra[@]}
cd $WORKING_DIR
process_all ${theme_packages[@]}
echo "Cleaning target folders"
rm -rf DU-Scripts/themes-resources/packages
mkdir DU-Scripts/themes-resources/packages
mkdir DU-Scripts/themes-resources/packages/apps
mkdir DU-Scripts/themes-resources/frameworks
echo "Copying all files to $WORKING_DIR/DU-Scripts/themes-resources"
cp -r $WORKING_DIR/packages/apps/DU-Updater $WORKING_DIR/DU-Scripts/themes-resources/packages/apps/
copy_all ${theme_packages[@]}
cp -r $WORKING_DIR/frameworks/base/core $WORKING_DIR/frameworks/base/packages $WORKING_DIR/DU-Scripts/themes-resources/frameworks
cd /home/mazda/du/DU-Scripts/themes-resources
cd $WORKING_DIR/DU-Scripts/themes-resources/packages/apps/Dialer/InCallUI
delete_useless ${res[@]}
cd $WORKING_DIR/DU-Scripts/themes-resources
