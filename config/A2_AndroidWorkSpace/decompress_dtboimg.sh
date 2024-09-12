#!/bin/bash
INPUT_DTBO_IMG=$1
OUT_PREFIX=$2


mkdtimg dump $INPUT_DTBO_IMG -b $OUT_PREFIX

for file in $OUT_PREFIX.*; do
    dtc -I dtb -O dts -o ${file}.dts $file
done
