FROM java:openjdk-7

RUN apt-get update \
  && apt-get install -y openssh-server \
  && apt-get install -y supervisor

RUN echo "root:password" | chpasswd
RUN useradd jenkins
RUN echo "jenkins:jenkins" | chpasswd

RUN mkdir -p /home/jenkins
RUN chmod 777 /home/jenkins

RUN mkdir -p /var/run/sshd
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/supervisord
ADD supervisord.conf /etc/supervisord.conf

EXPOSE 22
CMD ["/usr/bin/supervisord"]
