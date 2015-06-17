#!/bin/bash
set -e
set -x

mount -t tmpfs -o size="1024m" tmpfs /home/jenkins/.grails
