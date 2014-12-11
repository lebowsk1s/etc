#!/bin/bash

# setting the vimrc in your home
if [ -f "$HOME/.vimrc" ]; then
    for ((i=0; i<10; ++i)) 
    do
        VIMRC_BAK=$HOME/.vimrc.bak.$i
        if [ ! -f $VIMRC_BAK ]; then
            break 
        fi
    done
    echo "The .vimrc file is exist, rename it to $VIMRC_BAK"
    mv $HOME/.vimrc $VIMRC_BAK
fi
echo "Set the .vimrc in your home"
cp .vimrc $HOME/.vimrc




#测试权限
if [ ! $(id -u) -ne 0 ]; then
    echo "Test root authority success ..."
else
    echo "Please run ${0} as root."
    exit 1
fi


