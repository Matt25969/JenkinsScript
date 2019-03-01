#!/usr/bin/env bash
sudo apt update
sudo apt install -y openjdk-8-jdk
sudo apt install -y maven

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update
sudo apt install -y jenkins

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

