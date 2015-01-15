#!/bin/bash -ex

# build jenkins-on-elastic-beanstalk
docker build -t jenkins-on-elastic-beanstalk ./

# run
docker run -it \
    -v $(pwd):/code \
    -p 8080:8080 \
    --entrypoint='/code/local-jenkins-entrypoint.sh' \
    jenkins-on-elastic-beanstalk /var/jenkins_home /code/jenkins_home