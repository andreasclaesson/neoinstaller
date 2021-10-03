#!/bin/bash

######################################################
#                                                    #
#                   NeoInstaller                     #
#                                                    #
#               VenixDev | 27-09-2021                #
#                                                    #
######################################################

output(){
    echo -e '\e[36m'$1'\e[0m';
}

warning(){
    echo -e '\e[31m'$1'\e[0m';
}

if [[ $EUID -ne 0 ]]; then
  echo "# To avoid any possible errors, this script needs to be run with sudo/root."
  exit 1
fi

installer() {
    sleep 2s
    cd /etc/update-motd.d || exit || warning "The MOTD directory does not seems to exist on your machine! Are you sure you're on Ubuntu 18.04 or over?"
    rm 00-header 10-help-text 50-landscape-sysinfo 50-motd-news 90-updates-available 91-release-upgrade 92-unattended-upgrades 97-overlayroot
    echo "# Successfully removed default text. Installing NeoFetch..."
    sleep 2s
    apt install neofetch -y
    sudo bash -c $'echo "neofetch" >> /etc/profile.d/mymotd.sh && chmod +x /etc/profile.d/mymotd.sh'
    warning "Successfully installed NeoFetch on your machine and put it as your MOTD."
}

sleep 1s
installer
