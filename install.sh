#!/bin/bash

# Close any open System Preferences panes
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Prevent computer from sleeping
sudo caffeinate &

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Configure: system
source system.sh

# Configure: io
source io.sh

# Configure: coreApps
source coreApps.sh

# Configure: apps   ##### this one dos not belong here... #######################################################################
source coreApps.sh



# create work folder    ##### this one dos not belong here... #######################################################################
if [ ! -d ~/${workFolder} ]; then
  mkdir -p ~/${workFolder};
fi

# Stop Caffeinate (allow computer to sleep)
killall caffeinate

# Suggest restart
echo "Done. Note that some of these changes require a logout/restart to take effect."
