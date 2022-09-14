#!/bin/bash

#Dynamic Docker images which docker images should be imported should be defined in a seperate file
#Also the should be defined a git pull, add the new docker images to a values yaml
#the helm charts shoul load the images to pulled from the values yaml
datetime=$(date +%d%m%y)
echo ${datetime}
#docker pull bitnami/prometheus
docker images | grep bitnami > test.txt
image=$(awk 'NR == 2 {print $3}' test.txt); echo $image
name=$(awk 'NR == 1 {print $1}' test.txt); echo $name

#echo '------------------------------------- VAT ------------------'
#echo $name
#docker images
#echo '---------------------------- CAT ---------------------------'
tag="docker tag $name test.artifactory.com:v"
echo $tag
echo '---------------------------- CAT ---------------------------'
tag+=${datetime}
#docker images
echo ${tag}
$tag
docker images
docker image rm $image -f 
#echo '--------------' $image
docker images
