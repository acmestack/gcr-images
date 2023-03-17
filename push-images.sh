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
        echo "-----"
        cd `echo $image`
        echo "processing image "$image
        echo "🦁"
        exist=$(curl --head https://hub.docker.com/v2/namespaces/acmestack/repositories/`cat name`/tags/`cat tag` --header 'application/json' -o /dev/null -s -w %{http_code})
        if [ "$exist" = "200" || "$exist" = "403"  ]; then
            echo "$image pushed, skip..."
            cd ..
            continue
        fi
        echo "building $image for status $exist"
        docker buildx build --push --platform linux/amd64,linux/arm64 -t acmestack/`cat name`:`cat tag` .
        cd ..
    fi
done