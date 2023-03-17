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
        cd `echo $image`
        echo "image "$image
        last_time=$(stat -c %Y name)
        formart_last_date=$(date '+%Y-%m-%d' -d @$last_time)
        echo "last modify date "$formart_last_date
        if [ "$formart_last_date" != "$current_date" ]; then
            echo "$image pushed, skip..."
            cd ..
            continue
        fi
        echo "building $image"
        docker buildx build --push --platform linux/amd64,linux/arm64 -t acmestack/`cat name`:`cat tag` .
        cd ..
    fi
done