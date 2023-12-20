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
  echo ""
  echo "->->->->->->->->->->->> Installing paru <<-<-<-<-<-<-<-<-<-<-<-"
  echo ""

  cd ~/
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si

  cd ~/ 
  rm -rf ~/paru/
fi

paru -Syu

if ! command -v ansible-playbook &> /dev/null; then
  echo ""
  echo "->->->->->->->->->->->> Installing Ansible <<-<-<-<-<-<-<-<-<-<-<-"
  echo ""

  paru -S ansible
  ansible-galaxy collection install kewlfft.aur
fi

echo ""
echo "->->->->->->->->->->->> Running Ansible <<-<-<-<-<-<-<-<-<-<-<-"
echo ""

ansible-playbook ~/.bootstrap/setup.yml --ask-become-pass

echo ""
echo "->->->->->->->->->->->> Ansible Finished <<-<-<-<-<-<-<-<-<-<-<-"
echo ""

if ! command -v hyprctl &> /dev/null; then
  cd ~/
  git clone https://github.com/JaKooLit/Arch-Hyprland.git 
  cd ~/Arch-Hyprland/
  chmod +x install.sh
  ./install.sh
  
  cd ~/ 
  rm -rf ~/Arch-Hyprland/
fi
