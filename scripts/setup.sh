#!/bin/bash

if ! command -v brew &> /dev/null
then
    echo "Homebrew could not be found"
    echo "Do you wish to install it ?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; break;;
            No ) exit;;
        esac
    done
else
    echo "Homebrew already installed"
fi

PIP_COMMAND=pip
if ! command -v pip3 &> /dev/null
then
    if ! command -v pip &> /dev/null
    then
        echo "Neither pip nor pip3 were found. At least one is required, leaving."
        exit
    else
        PIP_COMMAND=pip
    fi
else
    PIP_COMMAND=pip3
fi
echo "Using $PIP_COMMAND for python package installs"

if ! command -v ansible &> /dev/null
then
    echo "Ansible is not installed, installing"
    $PIP_COMMAND install ansible
else
    echo "Ansible already installed"
fi

echo "✅ Setup is finished !"
