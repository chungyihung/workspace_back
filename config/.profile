# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
    for direct in $(ls -d $HOME/bin/*/)
    do
        if [ -d "$direct" ] && [ "$direct" != "." ] && [ "$direct" != ".." ]; then
            PATH="$direct:$PATH"
        fi
    done
fi

#Select Corresponding JAVA_HOME for make Android Target
#export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_45
#export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-amd64
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/bin
#export JAVA_HOME=/usr/lib/jvm/jdk1.7.0_67

export CLASSPATH=.:$JAVA_HOME/lib

# Renew the PATH variable
PATH=$JAVA_HOME/bin:$PATH

export TERM="xterm-256color"

#PATH=/usr/lib/x86_64-linux-gnu:$PATH
