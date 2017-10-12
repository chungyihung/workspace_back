#!/bin/bash
rm -rf cscope.*
rm -rf tags

if [ "$1" == "androsys" ]; then
    find "./external" -name "*.c" -o -name "*.h" -o -name "*.hpp" -o -name "*.cpp" >> cscope.files
    find "./system" -name "*.c" -o -name "*.h" -o -name "*.hpp" -o -name "*.cpp" >> cscope.files
    cscope -R -b -k -q -i cscope.files
    ctags -R -L cscope.files --exclude=.git
elif [ "$1" == "efi" ]; then
    find . -name "*.c" -o -name "*.h" -o -name "*.hpp" -o -name "*.cpp" -o -name "*.dsc" -o -name "*.dec"-o -name "*.inf"  > cscope.files
    cscope -R -b -k -q -i cscope.files
    ctags -R -L cscope.files --exclude=.git
elif [ "$1" == "java" ]; then
    find . -iname "*.java" -o -iname "*.cpp" -o -iname "*.c" -o -name > cscope.files
    cscope -R -b -k -q -i cscope.files
    ctags -R -L cscope.files --exclude=.git
else
    find . -name "*.c" -o -name "*.h" -o -name "*.hpp" -o -name "*.cpp" > cscope.files
    cscope -R -b -k -q -i cscope.files
    ctags -R -L cscope.files --exclude=.git
fi

