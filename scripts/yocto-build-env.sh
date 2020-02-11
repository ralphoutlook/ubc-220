#!/bin/bash
apt-get install -y gawk wget git-core diffstat \
  unzip texinfo gcc-multilib \
  build-essential chrpath socat cpio \
  python python3 python3-pip python3-pexpect \
  xz-utils debianutils iputils-ping python3-git \
  python3-jinja2 libegl1-mesa libsdl1.2-dev \
  xterm

# Essentials: Packages needed to build an image on a headless system:
apt-get install -y gawk wget git-core \
  diffstat unzip texinfo gcc-multilib \
  build-essential chrpath socat cpio \
  python python3 python3-pip python3-pexpect \
  xz-utils debianutils iputils-ping \
  python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
  xterm

# Documentation: Packages needed if you are going to build out the Yocto Project documentation manuals:
apt-get install -y make xsltproc docbook-utils fop dblatex xmlto

