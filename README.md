# DU Scripts #

### How to use the build_DU script ###

First, clone the DU-Scripts repository :

Open up a terminal in a directory where you want to download it and copy/paste this

```bash
git clone git@github.com:DirtyUnicorns/DU-Scripts.git
```

Now with your file browser go into the DU-Scripts folder and copy the build_DU.sh file and paste it in your DU root source.

After doing that, you are ready to use the script simply by this way :

Open up a terminal or if you have the old terminal still open, in your DU root source and type this ```. build_DU.sh```

After, simply respond to what is displayed to compile the build.


#### Tip ####

If you want to launch the script from anywhere :

Add the path of your root source at the end of the .bashrc file (e.g.) :

```bash
export PATH=${PATH}:~/Android/DU

```
Add the path of your root source in the build_DU.sh file below "#!/bin/sh" line (e.g.) :

```bash
#!/bin/sh

cd ~/Android/DU
```
