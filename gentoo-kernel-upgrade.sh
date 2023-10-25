#!/bin/bash

# Script for automated installation of currently selected Gentoo Linux kernel

echo "Swithing to root user"
su

echo "Switching to kernel sources"
cd /usr/src/linux

echo "Copying previous kernel config"
cp ../linux-$(uname -r | sed "s/-x86_64//")/.config .

echo "Running olddefconfig"
make olddefconfig

echo "Preparing modules"
make modules_prepare -j$(($(nproc) + 2))

echo "Building kernel"
make -j$(($(nproc) + 2))

echo "Installing modules"
make modules_install

echo "Installing kernel"
make install

echo "Rebuilding system module packages"
emerge @module-rebuild

echo "Updating GRUB"
grub-mkconfig -o /boot/grub/grub.cfg

