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
  makepkg -sic --noconfirm

  cd ~/ 
  rm -rf ~/paru/
fi

paru -Syu

if ! command -v ansible-playbook &> /dev/null; then
  echo ""
  echo "->->->->->->->->->->->> Installing Ansible <<-<-<-<-<-<-<-<-<-<-<-"
  echo ""

  paru -S ansible --noconfirm
  ansible-galaxy collection install kewlfft.aur
fi

echo ""
echo "->->->->->->->->->->->> Running Ansible <<-<-<-<-<-<-<-<-<-<-<-"
echo ""

ansible-playbook ~/.bootstrap/setup.yml --ask-become-pass

read -r -p "Install Nvidia Drivers? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    ansible-playbook ~/.bootstrap/nvidia.yml --ask-become-pass
fi


echo ""
echo "->->->->->->->->->->->> Ansible Finished <<-<-<-<-<-<-<-<-<-<-<-"
echo ""

sudo userdel -r aur_builder
