# Jenkins on AWS elastic beanstalk
Versionable Jenkins setup, deployable on AWS elastic beanstalk

## Prerequisites
 * Create AWS elastic beanstalk environment: single web server, docker
 * Local docker installed

## Add/modify jobs flow
 * Start local jenkins

        ./local-jenkins-start.sh

 * Browser open http://<docker host ip>:8080/
 * Modify jobs/configuration/users
 * Once done go back to console and hit Ctrl+C
 * After jenkins stop, modified files are automatically copied to jenkins_home
 * Add new jobs to git, if required

        git add jenkins_home

 * Commit and push changes

        git commit ...

 * Package elastic beanstalk app

        package.sh

 * Deploy application on elastic beanstalk. Via aws console or awscli.

        aws s3 cp target/jenkins-<version>.zip s3://<bucket>/<path>

        aws elasticbeanstalk create-application-version \
            --application-name <application> \
            --version-label <version> \
            --source-bundle S3Bucket=<bucket>,S3Key=<path>

        aws elasticbeanstalk update-environment \
            --environment-name <environment> \
            --version-label <version>
