FROM java:6b35-jdk

# ENTRYPOINT ["gvm-exec.sh"]

# gvm requires curl and unzip
RUN apt-get update && \
    apt-get install -yqq --no-install-recommends curl unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install gvm
RUN curl -s get.gvmtool.net | bash
ADD gvm.config /.gvm/etc/config
ADD bin/ /usr/local/bin/

RUN gvm install grails 2.2.3
