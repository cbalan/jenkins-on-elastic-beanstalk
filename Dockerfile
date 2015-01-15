FROM jenkins:1.585

# run with root to workaround jenkins user not being able to write in jenkins_home
USER root

# plugins
RUN mkdir -p /tmp/WEB-INF/plugins
RUN curl -L http://updates.jenkins-ci.org/latest/git.hpi -o /tmp/WEB-INF/plugins/git.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/scm-api.hpi -o /tmp/WEB-INF/plugins/scm-api.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/git-client.hpi -o /tmp/WEB-INF/plugins/git-client.hpi

RUN curl -L http://updates.jenkins-ci.org/latest/parameterized-trigger.hpi -o /tmp/WEB-INF/plugins/parameterized-trigger.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/jquery.hpi -o /tmp/WEB-INF/plugins/jquery.hpi

RUN curl -L http://updates.jenkins-ci.org/latest/groovy-postbuild.hpi -o /tmp/WEB-INF/plugins/groovy-postbuild.hpi
RUN curl -L http://updates.jenkins-ci.org/latest/script-security.hpi -o /tmp/WEB-INF/plugins/script-security.hpi

# add downloaded plugins to jenkins.war
RUN cd /tmp; zip --grow /usr/share/jenkins/jenkins.war WEB-INF/plugins/*; cd -

EXPOSE 8080

COPY jenkins_home /var/jenkins_home_orig
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
