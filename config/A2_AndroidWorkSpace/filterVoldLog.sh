#!/bin/bash

find . -name "$1" |xargs grep -iE "vold|commandlisten|DirectVol|MicroSD|USBdisk|NetlinkEvent|mount|unmount" | tee filter.${1}
