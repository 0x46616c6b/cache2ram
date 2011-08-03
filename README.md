# cache2ram

Small script which creates a ramdisk and create some symbolic links from ~/Library/Caches directories on it. So you can place your Cache directory for example from Firefox or Chrome on this very fast disk.

## Installation 

- Clone the repository
- copy the script in a directory you want (for ex. /usr/local/bin) or let them in your local repo
- enable the script with Mac OS X LoginHook:
	
    sudo defaults write com.apple.loginwindow LoginHook /usr/local/bin/cache2ram

- Thats it! Ensure you have enough memory for the ramdisk or decrease the size in the script.