#!/bin/bash

IN_PREFIX=$1
OUTPUT_DTBO_IMG=$2

for file in $IN_PREFIX.*.dts; do
    dtc -I dts -O dtb -o ${file%.dts}.modtmp.dtb $file
done

mkdtimg create $OUTPUT_DTBO_IMG $IN_PREFIX.*.modtmp.dtb
