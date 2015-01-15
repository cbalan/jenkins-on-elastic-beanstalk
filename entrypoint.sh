#!/bin/bash -ex

rsync -av /var/jenkins_home_orig/ /var/jenkins_home/
/usr/local/bin/jenkins.sh