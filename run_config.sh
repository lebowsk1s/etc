#!/bin/bash

#test 
# setting the vimrc in your home
echo "Set the .vimrc in your home"
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
cp -v .vimrc $HOME/.vimrc

# setting the bash aliases in your home
echo "Set the .bash_aliases in your home"
if [ -f "$HOME/.bash_aliases" ]; then
    for ((i=0; i<10; ++i))
    do
        ALIASES_BAK=$HOME/.bash_aliases.bak.$i
        if [ ! -f $ALIASES_BAK ]; then
            break
        fi
    done
    echo "The .bash_aliases file is exist, rename it to $ALIASES_BAK"
    mv $HOME/.bash_aliases $ALIASES_BAK
fi
cp -v .bash_aliases $HOME/.bash_aliases
. .bash_aliases

# set the tmux config file, if the tmux command is exist
type tmux >/dev/null 2>&1
if [ $? == 0 ]; then
    echo "Set the tmux config file in your home"
    cp -v .tmux.conf $HOME/.tmux.conf
else
    echo "You don't have tmux, needn't to set it"
fi

# set the proxychains config file, if the proxychains command is exist
type proxychains >/dev/null 2>&1
if [ $? == 0 ]; then
    echo "Set the proxychains config file in your /etc"
    sudo cp -v proxychains.conf /etc/proxychains.conf
    echo "Set the sshproxy.sh in your /usr/local/bin"
    sudo cp -v sshproxy.sh /usr/local/bin/sshproxy.sh
else
    echo "You don't have proxychains, needn't to set it"
fi

#测试权限
if [ ! $(id -u) -ne 0 ]; then
    echo "Test root authority success ..."
else
    echo "Please run ${0} as root."
    exit 1
fi


