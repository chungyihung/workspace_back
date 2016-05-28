#!/bin/bash
find . -name "*" |xargs grep -a "$1" --color 2>/dev/null
