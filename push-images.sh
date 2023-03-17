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
        echo "🦁"
        policy="skip"
        if [ -f "policy" ]; then
            policy=`cat policy`
        fi
        echo "processing image $image with policy $policy."
        if [ "$policy" = "skip" ]; then
            exist=$(curl --head https://hub.docker.com/v2/namespaces/acmestack/repositories/`cat name`/tags/`cat tag` --header 'application/json' -o /dev/null -s -w %{http_code})
            echo "$image -> `cat name`:`cat tag` push status $exist"
            if [ "$exist" = "200" ] || [ "$exist" = "403" ] ; then
                echo "$image -> `cat name`:`cat tag` pushed, skip..."
                cd ..
                continue
            fi
        fi
        
        echo "building $image => `cat name`:`cat tag`"
        docker buildx build --push --platform linux/amd64,linux/arm64 -t acmestack/`cat name`:`cat tag` .
        cd ..
    fi
done