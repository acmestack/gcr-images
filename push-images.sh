#!/bin/sh
docker buildx ls
docker buildx create --name imagesbuilder --use

cd images
pwd=`pwd`
images=`ls $dir`
for image in $images
do
    if [ -d $image ]
    then
        cd `echo $image`
        echo "building $image"
        docker buildx build --push --platform linux/amd64,linux/arm64 -t acmestack/`cat name`:`cat tag` .
        cd ..
    fi
done