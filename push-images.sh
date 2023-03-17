#!/bin/sh
docker buildx ls
docker buildx create --name imagesbuilder --use
current_date=$(date '+%Y-%m-%d')

cd images
pwd=`pwd`
images=`ls $dir`
for image in $images
do
    if [ -d $image ]
    then
        echo "🦁-----"
        cd `echo $image`
        policy="skip"
        if [ -f "policy" ]; then
            policy=`cat policy`
        fi
        echo "processing image $image with policy $policy."
        if [ "$policy" = "skip" ]; then
            image_check_url="https://hub.docker.com/v2/namespaces/acmestack/repositories/$(cat nametag | sed -e "s/:/\/tags\//g" nametag)"
            image_check_status=$(curl --head $image_check_url --header 'application/json' -o /dev/null -s -w %{http_code})
            echo "$image -> `cat nametag` check status $image_check_status."
            if [ "$image_check_status" = "200" ] || [ "$image_check_status" = "403" ] ; then
                echo "$image -> `cat nametag` pushed, skip..."
                cd ..
                continue
            fi
        fi
        echo "building $image => `cat nametag`..."
        docker buildx build --push --platform linux/amd64,linux/arm64 -t acmestack/`cat nametag` .
        echo "done."
        cd ..
    fi
done