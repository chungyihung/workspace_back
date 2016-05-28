#!/bin/bash
adb logcat -c && adb logcat |tee $1
