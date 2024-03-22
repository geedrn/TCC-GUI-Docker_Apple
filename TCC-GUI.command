#!/bin/sh

# Updating the database
echo "Open Docker app"
open /Applications/Docker.app

Sleep 5

# echo the message
echo "Go to Google Chrome and start the analysis"
echo "Make sure you close this window once you finish the analysis"

# Open Google Chrome and open localhost:8787
open -a "Safari" "http://localhost:8787"

docker run \
  --rm -e DISABLE_AUTH=true \
  -p 8787:8787 \
  sayaka0710/tcc

exit