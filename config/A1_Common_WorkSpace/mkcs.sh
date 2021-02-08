#!/bin/bash
rm -rf cscope.*
rm -rf tags

if [ "$#" == 0 ]; then
    echo 'Use case: mkcs.sh [androsys|kernel|efi|java|python|mk|default|]'
    exit
fi


if [ "$1" == "androsys" ]; then
    find "./external" -name "*.c" -o -name "*.h" -o -name "*.hpp" -o -name "*.cpp" -o -name "*.cc" >> cscope.files
    find "./system" -name "*.c" -o -name "*.h" -o -name "*.hpp" -o -name "*.cpp" -o -name "*.cc" >> cscope.files
    find "./bionic" -name "*.c" -o -name "*.h" -o -name "*.hpp" -o -name "*.cpp" -o -name "*.cc" >> cscope.files
    find "./development/" -name "*.c" -o -name "*.h" -o -name "*.hpp" -o -name "*.cpp" -o -name "*.cc" >> cscope.files
    find "./vendor/qcom/opensource/core-utils/" -name "*.c" -o -name "*.h" -o -name "*.hpp" -o -name "*.cpp" -o -name "*.cc" >> cscope.files
    cscope -R -b -k -q -i cscope.files
    ctags -R -L cscope.files --exclude=.git
elif [ "$1" == "efi" ]; then
    find . -name "*.c" -o -name "*.h" -o -name "*.hpp" -o -name "*.cpp" -o -name "*.dsc" -o -name "*.dec"-o -name "*.inf"  > cscope.files
    cscope -R -b -k -q -i cscope.files
    ctags -R -L cscope.files --exclude=.git
elif [ "$1" == "java" ]; then
    find . -iname "*.java" -o -iname "*.cpp" -o -iname "*.c" -o -iname "*.hpp" -o -iname "*.h" > cscope.files
    cscope -R -b -k -q -i cscope.files
    ctags -R -L cscope.files --exclude=.git
elif [ "$1" == "kernel" ]; then
    echo "Parsing source code in kernel mode..."
    find . -name "*.c" -o -name "*.h" -o -name "*.hpp" -o -name "*.cpp" \
        -o -name "*.dtsi" -o -name "*.dts" -o -iname "*.S" > cscope.files
    cscope -R -b -k -q -i cscope.files
    ctags -R -L cscope.files --exclude=.git
elif [ "$1" == "python" ]; then
    find . -iname "*.py" -o -iname "*.cpp" -o -iname "*.c" -o -iname "*.hpp" -o -iname "*.h" > cscope.files
    cscope -R -b -k -q -i cscope.files
    ctags -R -L cscope.files --exclude=.git
elif [ "$1" == "mk" ]; then
    find . -iname "*.py" -o -iname "*.cpp" -o -iname "*.c" -o -iname "*.hpp" -o -iname "*.h" -o -iname "*.mk" -o -iname "makefile" -o -iname "*.sh"> cscope.files
    cscope -R -b -k -q -i cscope.files
    ctags -R -L cscope.files --exclude=.git
elif [ "$1" == "default" ]; then
    find . -name "*.c" -o -name "*.h" -o -name "*.hpp" -o -name "*.cpp" > cscope.files
    cscope -R -b -k -q -i cscope.files
    ctags -R -L cscope.files --exclude=.git
fi

