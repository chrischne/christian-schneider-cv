#!/bin/bash

#serve cv and open default browser 
cd "$(dirname "$0")"

rm cv.pdf

jekyll build && sleep 1 && prince _site/index.html -o cv_christian_schneider.pdf  && sleep 2 && killall Terminal
