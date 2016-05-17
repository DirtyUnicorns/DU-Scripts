# DU Scripts #

### Build scripts ###

# To use the Nico-Build-Script

git clone this repo
https://github.com/DirtyUnicorns/DU-Scripts.git

Open up a terminal in a directory where you want to download it and copy/paste this

```bash
git clone git@github.com:DirtyUnicorns/DU-Scripts.git
```

Now with your file browser go into the DU-Scripts folder and copy the build_DU.sh file and paste it in your DU root source.

After doing that, you are ready to use the script simply by this way :

Open up a terminal or if you have the old terminal still open, in your DU root source and type this ```. build_DU.sh```

After, simply respond to what is displayed to compile the build.


# To use the Nathan-Build-Script

git clone this repo
https://github.com/DirtyUnicorns/DU-Scripts.git

cd/navigate into build-script and open Nathan-Build-Script.sh either with a text editor or in terminal using nano
and fill in the following areas

- SOURCEDIR
- OUTDIR
- DESTDIR

# SOURCEDIR: The directory that holds your DU repos (for example, /home/<username>/android/DU)
# OURDIR: The directory that holds the completed DU zip directly after compilation (automatically <sourcedirectory>/out/target/product/<device>, don't change this)
# DESTDIR: The directory that will hold your completed DU zip files for ease of access (for example, /home/<username>/completed_zips)

Only fill out these if you want a custom user@host in the kernel version
export KBUILD_BUILD_USER
export KBUILD_BUILD_HOST

Only fill this one out if you want something out than Dirty Deeds to show up as your build type
export DU_BUILD_TYPE
