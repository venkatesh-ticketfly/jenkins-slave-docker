FROM java:openjdk-7

ENV JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64/jre"

RUN apt-get update \
  && apt-get install -y openssh-server \
  && apt-get install -y supervisor \
  && rm -rf /var/lib/apt/lists/*

RUN echo "root:password" | chpasswd
RUN useradd jenkins
RUN echo "jenkins:jenkins" | chpasswd

RUN mkdir -p /home/jenkins && chmod 777 /home/jenkins

RUN mkdir -p /var/run/sshd \
	&& sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd \
	&& mkdir -p /var/run/supervisord
ADD supervisord.conf /etc/supervisord.conf

ADD install-grails.sh /root

WORKDIR /root
RUN chmod +x install-grails.sh
RUN ./install-grails.sh 2.3.11
RUN ./install-grails.sh 2.4.4
RUN ./install-grails.sh 2.2.3

WORKDIR /
EXPOSE 22
CMD ["/usr/bin/supervisord"]
