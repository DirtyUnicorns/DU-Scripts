#!/bin/bash
USER="$(logname)"

cd ~/du
sleep 2
rm -rf Theme-Resources abi bionic art bootable build dalvik development device external frameworks hardware kernel libcore libnativehelper manifest ndk out packages pdk prebuilts sdk system tools vendor
sleep 2
cd .repo
rm -rf local_manifests
sleep 2
cd  ..
repo sync -j32
sleep 2
git clone https://github.com/DirtyUnicorns/Theme-Resources.git
sleep 2
cd frameworks/base
sleep 2
rm -rf api cmds data docs drm graphics include keystore libs location media native nfc-extras obex opengl policy rs samples sax security-bridge services telecomm telephony test-runner tests tools wifi Android.mk CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE preloaded-classes
sleep 2
cd packages
sleep 2
rm -rf BackupRestoreConfirmation CaptivePortalLogin DefaultContainerService ExternalStorageProvider FakeOemFeatures FusedLocation InputDevices Keyguard PrintSpooler SettingsProvider SharedStorageBackup Shell VpnDialogs WAPPushManager WallpaperCropper services
sleep 2
cd SystemUI
sleep 2
rm -rf src tests Android.mk AndroidManifest.xml MODULE_LICENSE_APACHE2 NOTICE lint.xml proguard.flags proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf menu* values-* xml* interpolator anim animator transition
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml config.xml defaults.xml donottranslate.xml du_arrays.xml du_strings.xml ids.xml internal.xml keys.xml lland_config.xml lland_strings.xml strings.xml
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd DocumentsUI
sleep 2
rm -rf src tests Android.mk AndroidManifest.xml wrap_alpha.py proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf menu* values-* xml* anim interpolator animator transition
sleep 2
cd values
sleep 2
rm -rf du_strings.xml strings.xml
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd core
sleep 2
rm -rf java jni tests
sleep 2
cd res
sleep 2
rm -rf assets Android.mk AndroidManifest.xml MODULE_LICENSE_APACHE2 MakeJavaSymbols.sed NOTICE lint.xml proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf raw* values-* xml* menu* interpolator anim animator transition
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml attrs_manifest.xml bools.xml config.xml donottranslate-cldr.xml donottranslate-maps.xml donottranslate-names.xml donottranslate.xml donottranslate_material.xml du_arrays.xml du_strings.xml du_symbols.xml ids.xml integers.xml public.xml strings.xml symbols.xml
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd Theme-Resources
sleep 2
cd frameworks
sleep 2
git rm -rf core packages
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd frameworks
sleep 2
cd base
sleep 2
mkdir /home/mazda/du/Theme-Resources/frameworks
sleep 2
mv core packages /home/mazda/du/Theme-Resources/frameworks
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd packages
sleep 2
cd apps
sleep 2
cd Apollo
sleep 2
rm -rf assets src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags .git proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu*
sleep 2
cd values
sleep 2
rm -rf appmsg_colors.xml arrays.xml attrs.xml config.xml donottranslate.xml fractions.xml plurals.xml strings.xml vpi__attrs.xml vpi__defaults.xml
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd Apollo
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd Browser
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd Calculator
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd Calendar
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd CalendarWidget
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd Camera2
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd Contacts
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ContactsCommon
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd DSPManager
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd DU-About
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd DU-Tweaks
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd DU-Updater
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd DeskClock
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd Dialer
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd Email
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd Gallery2
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd InCallUI
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd Launcher3
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd LockClock
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd Mms
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd OmniSwitch
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd PhoneCommon
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd Settings
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd Stk
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ThemeChooser
sleep 2
rm -rf assets .idea libs build.gradle .gitignore src .classpath .gitignore .project Android.mk AndroidManifest.xml proguard.cfg proguard.flags tools tests assets CleanSpec.mk MODULE_LICENSE_APACHE2 NOTICE extensions_src mkprojectfile project.properties hero.png LICENSE README.md script jni res_p sounds src_pd src_pd_gcam tests_camera proguard-project.txt version.mk COPYING Readme.md WallpaperPicker protos util fill_screens.py print_db.py update_gallery_files.py update_system_wallpaper_cropper.py cyanogen-dsp lint.xml emailcommon .git anim interpolator animator transition TestCommon provider_src gallerycommon jni_jpegstream apptests proguard-test.flags
sleep 2
cd res
sleep 2
rm -rf xml* values-* menu* raw* interpolator anim animator 
sleep 2
cd values
sleep 2
rm -rf arrays.xml attrs.xml cm_arrays.xml cm_plurals.xml cm_strings.xml config.xml integers.xml strings.xml all_search_engines.xml bookmarks_icons.xml bools.xml donottranslate-search_engines.xml ids.xml integers.xml strings.xml du_strings.xml du_arrays.xml donottranslate_config.xml aliases.xml donottranslate.xml crop_colors.xml dslv_attrs.xml animation_constants.xml custom_strings.xml custom_arrays.xml vpi__defaults.xml vpi__attrs.xml nontranslatables.xml accountprovider.xml bool.xml donottranslate_strings.xml constants.xml codeaurora_strings.xml filtershow_ids.xml filtershow_strings.xml filtershow_values.xml filtershow_values_attrs.xml array.xml 
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd Theme-Resources
git rm -rf packages
sleep 2
mkdir /home/mazda/du/Theme-Resources/packages
sleep 2
cd packages
sleep 2
mkdir /home/mazda/du/Theme-Resources/packages/apps
sleep 2
cd ..
sleep 2
cd ..
sleep 2
cd packages
sleep 2
cd apps
sleep 2
mv Apollo Browser Calculator Calendar CalendarWidget Camera2 Contacts ContactsCommon DSPManager DU-About DU-Tweaks DU-Updater DeskClock Dialer Email Gallery2 InCallUI Launcher3 LockClock Mms OmniSwitch PhoneCommon Settings Stk ThemeChooser /home/mazda/du/Theme-Resources/packages/apps

