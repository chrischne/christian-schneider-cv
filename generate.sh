#!/bin/bash

#serve cv and open default browser 
cd "$(dirname "$0")"

rm christian_schneider_cv.pdf

jekyll build && sleep 3 && prince _site/index.html -o christian_schneider_cv.pdf && sleep 3 && open christian_schneider_cv.pdf
