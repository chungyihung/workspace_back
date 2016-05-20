#!/bin/bash

filelist=./file_list
CONFIGDIR=./config
USERHOME=/home/$USER

showtip() {
    echo -e "Usage: \t./install.sh backup"
    echo -e "\t./install.sh restore"
}

while read myline; do
    if [ "${myline:0:1}" != "#" ]; then
        filename=`basename $myline`
        if [ "${myline:0:2}" == "~/" ]; then
            file_abs_path=$USERHOME/${myline:2}
        else
            file_abs_path=$myline
        fi

        if [ "$1" == "backup" ]; then
            srcfile=$file_abs_path
            tarfile=$CONFIGDIR/$filename
        elif [ "$1" == "restore" ]; then
            tarfile=$file_abs_path
            srcfile=$CONFIGDIR/$filename
        else
            showtip
            exit
        fi

        echo srcfile = $srcfile
        echo tarfile = $tarfile
        rsync -avP $srcfile $tarfile
        md5sum $srcfile $tarfile
    fi
done < $filelist
