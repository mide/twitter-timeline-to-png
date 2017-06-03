#!/bin/bash

mkdir -p output/

# Open a fake X server session and run cutycapt to snapshot the Twitter account.
xvfb-run --server-args="-screen 0, 1280x1200x24" cutycapt --url=https://mobile.twitter.com/${TWITTER_USERNAME} --out=twitter-timeline.png

# Format the image.
convert twitter-timeline.png -flatten -trim +repage twitter-timeline.png
convert twitter-timeline.png -gravity North -crop 100%x20 twitter-timeline.png

# Move it into output, will be deployed into S3.
mv twitter-timeline.png output/twitter-timeline.png
