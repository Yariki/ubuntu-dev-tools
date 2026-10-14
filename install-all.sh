#!/usr/bin/env bash

. ./src/core.sh

# languages
. ./src/languages/java.sh
. ./src/languages/python.sh
. ./src/languages/javascript.sh

# db
. ./src/db/postgresql.sh
. ./src/db/mysql.sh

# tools
. ./src/tools/docker.sh

# extra
. ./src/extra/uicustomization.sh

# aliases
. ./src/aliases/generic.sh
. ./src/aliases/apt.sh
. ./src/aliases/docker.sh

echo 'Updating and Cleaning Unnecessary Packages'
sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get full-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'
clear
