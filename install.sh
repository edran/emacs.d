#!/bin/bash

sudo apt-get build-dep emacs24
cur http://ftp.heanet.ie/mirrors/gnu/emacs/emacs-24.3.tar.gz | tar xvf
cd emacs-24.3
./configure
make
sudo make install
