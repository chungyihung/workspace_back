#!/bin/bash

find . -name "$1" |xargs grep "$2" --color 2>/dev/null
