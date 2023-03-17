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
        skip_image="true"
        for item in `ls $dir`
        do
            formart_last_date=$(git log -1 --format="%at" $item | xargs -I{} date -d @{} +%Y-%m-%d)
            echo "$image/$item last modify date $formart_last_date"
            if [ "$formart_last_date" = "$current_date" ]; then
                skip_image="false"
                break
            fi                
        done
        if [ "$skip_image" = "true" ]; then
            echo "$image pushed, skip..."
            cd ..
            continue
        fi
        echo "building $image"
        docker buildx build --push --platform linux/amd64,linux/arm64 -t acmestack/`cat name`:`cat tag` .
        cd ..
    fi
done