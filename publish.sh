#!/bin/bash

#serve cv and open default browser 
cd "$(dirname "$0")"

#kill previous instances of jekyll serve
killall ruby
killall Google\ Chrome

jekyll serve & sleep 2 && open "http://localhost:4000"
