#!/bin/bash

adb root && adb wait-for-device && adb remount
adb push $OUT/system/bin/vold /system/bin
