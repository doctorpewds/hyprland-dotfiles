#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#101d2f/g' \
         -e 's/rgb(100%,100%,100%)/#d3dae3/g' \
    -e 's/rgb(50%,0%,0%)/#15273d/g' \
     -e 's/rgb(0%,50%,0%)/#93cee9/g' \
 -e 's/rgb(0%,50.196078%,0%)/#93cee9/g' \
     -e 's/rgb(50%,0%,50%)/#152334/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#152334/g' \
     -e 's/rgb(0%,0%,50%)/#d3dae3/g' \
	"$@"