#!/bin/bash

OS="$(cat /etc/os-release | grep ID)"

if [[ $OS == *"arch"* ]]; then
  echo ""
  echo "->->->->->->->->->->->> Arch Linux <<-<-<-<-<-<-<-<-<-<-<-"
  echo ""
else
  exit
fi

if ! command -v paru &> /dev/null; then
  cd ~/
  sudo pacman -S --needed base-devel
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si

  cd ~/ 
  rm -rf ~/paru/
fi

paru -Syu

if ! command -v ansible-playbook &> /dev/null; then
  paru -S ansible
fi


