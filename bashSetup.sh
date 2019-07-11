#!/bin/bash

#make sure this file runs every time you start bash (on startup)
grep -qxF '~/tools/bashSetup.sh' ~/.bashrc || echo '~/tools/bashSetup.sh' >> ~/.bashrc

cp ~/tools/config/.vimrc ~/
#remember git username and password for 1 hr (WARNING: stored in plaintext for that hour)
git config --global credential.helper 'cache --timeout=3600'

#adjust path to include snaps (only if /snap/bin/ exists)
[ -d "/snap/bin/" ] && export PATH=$PATH:/snap/bin/

#install lazydocker if not installed
command -v curl > /dev/null || echo "Install curl to install lazydocker"
command -v lazydocker > /dev/null || ~/tools/installLazyDocker.sh

command -v lazydocker > /dev/null && cp ~/tools/config/lazydockerconfig.yml ~/.config/jesseduffield/lazydocker/config.yml



