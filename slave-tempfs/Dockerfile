FROM tfly-jenkins/base-jenkins-slave

RUN mkdir -p /home/jenkins/.grails
RUN chmod 777 /home/jenkins/.grails

ADD run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh

CMD ["/tmp/run.sh"]
