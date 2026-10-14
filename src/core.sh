#!/usr/bin/env bash

echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"Luke Morales\""
read git_config_user_name

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"lukemorales@live.com\""
read git_config_user_email

echo "Installing core development libraries (a lot of stuff :P)..."
apt-get update && apt-get upgrade
apt-get install -y  make \
                    build-essential \
                    software-properties-common \
                    linux-headers-$(uname -r) \
                    linux-image-extra-$(uname -r) \
                    linux-image-extra-virtual \
                    libssl-dev \
                    libffi-dev \
                    zlib1g-dev \
                    libbz2-dev \
                    libreadline-dev \
                    libsqlite3-dev \
                    llvm \
                    libncurses5-dev \
                    libncursesw5-dev \
                    unixodbc \
                    unixodbc-dev \
                    libaio1 \
                    freetds-bin \
                    freetds-dev \
                    tdsodbc \
                    alien \
                    apt-transport-https \
                    ca-certificates \
                    git \
                    virtualbox \
                    virtualbox-ext-pack \
                    virtualbox-guest-additions-iso \
                    virtualbox-guest-dkms \
                    virtualbox-guest-source \
                    virtualbox-guest-utils \
                    virtualbox-guest-x11 \
                    automake \
                    autoconf \
                    pkg-config \
                    libgtk-3-dev \
                    libtiff5-dev \
                    libjpeg8-dev \
                    zlib1g-dev \
                    libfreetype6-dev \
                    liblcms2-dev \
                    libwebp-dev \
                    tcl8.6-dev \
                    tk8.6-dev \
                    python-tk \
                    python-dev \
                    vim \
                    curl \
                    nano \
                    members \
                    exfat-utils \
                    exfat-fuse \
                    unrar \
                    mcelog \
                    net-tools
                    
echo "Setting up your git global user name and email"
git config --global user.name "$git_config_user_name"
git config --global user.email $git_config_user_email

echo 'Generating a SSH Key'
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo 'Installing VSCode'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update && sudo apt-get install code -y


# enable syntax highlighting for all the available languages
find /usr/share/nano/ -iname "*.nanorc" -exec echo include {} \; >> ~/.nanorc

echo "A lot of libraries have been installed for you :)"
