#!/bin/sh

touch ~/repo_log.log

CR='\033[0;31m'
CG='\033[0;32m'
CY='\033[0;33m'
CB='\033[0;34m'
CM='\033[0;35m'
CRT='\033[0m'

clear

ban()
{
    echo ""
    echo -e $CY
    echo -e "******************************"
    echo -e "* Welcome to DU build script *"
    echo -e "******************************"
    echo -e $CRT
    echo ""
}

nthreads()
{
    echo -e -n $CM"Enter numbers of tasks used to compile, enter 'all' to use all threads: "$CRT
    read ncore
    if [ "$(echo $ncore | grep "^[ [:digit:] ]*$")" ] || [ "$ncore" = "all" ]; then
        clear
    else
        echo "Wrong selection !"
        nthreads
    fi
} 

ban
echo -e -n $CB"Do you want to perform a repo sync (y/n) ? : "$CRT
read rsync 
clear

ban
echo -e $CG"Choose the clean level:"$CRT
select cbuild in "make clobber" "make installclean" "no clean"; do
    case $cbuild in
        "make clobber"|"make installclean"|"no clean") break;;
        *) echo "Wrong selection !"
    esac
done
clear

ban
echo -e -n $CM"Do you want to build DU now (y/n) ? : "$CRT
read bnow
clear

if [ "$rsync" = "y" ] || [ "$rsync" = "Y" ]; then
    echo ""
    echo -e $CY
    echo -e "***************************"
    echo -e "*"$CRT $CB"Syncing repositeries..."$CRT $CY"*"
    echo -e "***************************"
    echo -e $CRT
    echo ""
    repo sync 2>~/repo_log.log
fi

testrs()
{
    grep "error:" ~/repo_log.log >/dev/null
} 

case $cbuild in
    "make clobber")
        echo ""
        echo -e $CY
        echo -e "**************************"
        echo -e "*"$CRT $CG"Cleaning OUT folder..."$CRT $CY"*"
        echo -e "**************************"
        echo -e $CRT
        echo ""
        make clobber;;
    "make installclean")
        echo ""
        echo -e $CY
        echo -e "**************************"
        echo -e "*"$CRT $CG"Cleaning OUT folder..."$CRT $CY"*"
        echo -e "**************************"
        echo -e $CRT
        echo ""
        make installclean;;
    "no clean")
        testrs
        if [ $? == 1 -a \( "$bnow" = "y" -o "$bnow" = "Y" \) ]; then
            echo ""
            echo -e $CY
            echo -e "**********************"
            echo -e "*"$CRT $CG"Nothing cleaned..."$CRT $CY"*"
            echo -e "**********************"
            echo -e $CRT
            echo ""
       fi
esac

testrs
if [ $? == 0 -a \( "$rsync" = "y" -o "$rsync" = "Y" \) ]; then
    echo ""
    echo -e $CY
    echo -e "*****************************"
    echo -e "*"$CRT $CR"WARNING repo sync error !"$CRT $CY"*"
    echo -e "*****************************"
    echo -e $CRT
    echo ""
    cat ~/repo_log.log
elif [ "$bnow" = "y" ] || [ "$bnow" = "Y" ]; then
    . build/envsetup.sh >/dev/null
    lunch
    nthreads
    echo ""
    echo -e $CY
    echo -e "**********************************"
    echo -e "*"$CRT $CM"Building DU for your device..."$CRT $CY"*" 
    echo -e "**********************************"
    echo -e $CRT
    echo ""
    if [ "$ncore" = "all" ]; then
        time mka bacon
    else
        time make -j$ncore
    fi
fi

rm ~/repo_log.log
cd ~/