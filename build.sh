#!/bin/bash

VERSION=1.0

cwd=`pwd`

cd $cwd/jenkins-slave

sudo docker build -t venkatesh4ticketfly/jenkins-slave:$VERSION .

docker tag venkatesh4ticketfly/jenkins-slave:$VERSION venkatesh4ticketfly/jenkins-slave:latest

cd $cwd/imagemagick-jenkins-slave

sudo docker build -t venkatesh4ticketfly/imagemagick-jenkins-slave:$VERSION .

docker tag venkatesh4ticketfly/imagemagick-jenkins-slave:$VERSION venkatesh4ticketfly/imagemagick-jenkins-slave:latest
