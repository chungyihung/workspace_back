#!/bin/bash
# http://stackoverflow.com/questions/1323696/why-does-find-name-txt-xargs-du-hc-give-multiple-totals
find . -name "$1" -exec echo -n -e {}"\0" \; | du -hc --files0-from=-
