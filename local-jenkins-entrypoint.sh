#!/bin/bash

rsync -av /var/jenkins_home_orig/ /var/jenkins_home/

# run jenkins as usual
/usr/local/bin/jenkins.sh

# copy over affected jobs. only config.xmls
rsync -av --include "/*" --include "*/config.xml" --exclude "*" $1/jobs/ $2/jobs/

#users
rsync -av $1/users/ $2/users/

#config
cp $1/config.xml $2/config.xml