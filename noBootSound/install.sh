#!/bin/bash

# Settings
installationFolder="/Library/LogHook/"
loginHook="noBootSoundLoginHook"
logoutHook="noBootSoundLogoutHook"
logoutVolume="noBootSoundLogoutVolume"

# Get current folder
currentFolder="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create installation folder
mkdir -p "${installationFolder}"

# Create file where the mute state is stored
sudo printf "false" > "${installationFolder}${logoutVolume}"

# Copy scripts and make them executable
sudo cp "${currentFolder}/${loginHook}" "${installationFolder}"
sudo cp "${currentFolder}/${logoutHook}" "${installationFolder}"
sudo chmod +x "${installationFolder}${loginHook}"
sudo chmod +x "${installationFolder}${logoutHook}"

# Register hooks
defaults write com.apple.loginwindow LoginHook  "${installationFolder}${loginHook}"
defaults write com.apple.loginwindow LogoutHook "${installationFolder}${logoutHook}"
