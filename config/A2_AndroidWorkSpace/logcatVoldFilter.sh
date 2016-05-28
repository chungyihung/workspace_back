#!/bin/bash

cat $1 |grep -iE "vold|volume|MicroSD|usbdisk|directvolume"
