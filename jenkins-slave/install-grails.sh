#!/bin/bash

GRAILS_VERSION=$1
echo "Installing Grails $GRAILS_VERSION"

cd /root
wget -O tmp.zip http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/grails-$GRAILS_VERSION.zip && unzip tmp.zip && rm tmp.zip
grails-$GRAILS_VERSION/bin/grails create-app project-$GRAILS_VERSION

cd /root/project-$GRAILS_VERSION

# fix for Grails 2.2.3, generated projects don't contain grailsw by default
if [ ! -e "grailsw" ]
then
	/root/grails-$GRAILS_VERSION/bin/grails wrapper
fi

# fix for Grails 2.2.3
cp $JAVA_HOME/../lib/tools.jar $JAVA_HOME/lib/ext/

# run grailsw to download grails and dependencies
sh grailsw war

mkdir -p /home/jenkins/.grails

rm -r /root/*$GRAILS_VERSION \
	&& cp -r /root/.grails/* /home/jenkins/.grails \
	&& rm -r /root/.grails/* \
	&& chown -R jenkins:jenkins /home/jenkins 