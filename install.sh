#!/bin/bash

filelist=./file_list
CONFIGDIR=./config
USERHOME=/home/$USER

showtip() {
    echo -e "Usage: \t./install.sh backup"
    echo -e "\t./install.sh restore"
}

if [ "$1" != "backup" ]  && [ "$1" != "restore" ]; then
    showtip
    exit
fi

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
            # We treat file and folder in different way
            if [ ! -d "$CONFIGDIR/$filename" ]; then
                #Sanity check if path exist or not
                directoryname=`dirname $file_abs_path`
                if [ ! -d "$directoryname" ]; then
                    mkdir -p $directoryname
                fi
                tarfile=$file_abs_path
                srcfile=$CONFIGDIR/$filename
            else
                directoryname=`dirname $file_abs_path`
                mkdir -p $file_abs_path
                tarfile=$directoryname
                srcfile=$CONFIGDIR/$filename
            fi
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
