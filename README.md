# Jenkins Slave Docker
  
  Docker images for different kinds of jenkins slave.

Images included:

- __venkatesh4ticketfly/jenkins-slave__: Simple jenkins slave that can be provisioned using ssh.
- __venkatesh4ticketfly/imagemagick-jenkins-slave__: Jenkins Slave with Imagemagick installed.

## Building the image

```sudo ./build.sh```

## Using the images

Jenkins master provisions the slaves using the [docker-plugin](https://wiki.jenkins-ci.org/display/JENKINS/Docker+Plugin)

More documentation incomming...
