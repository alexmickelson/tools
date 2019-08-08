#!/bin/bash

#make sure this file runs every time you start bash (on startup)
grep -qxF '$HOME/tools/bashSetup.sh' $HOME/.bashrc || echo '$HOME/tools/bashSetup.sh' >> $HOME/.bashrc

#set up aliases
grep -qxF 'alias commit="$HOME/tools/scripts/commit.sh"' $HOME/.bashrc || echo 'alias commit="$HOME/tools/scripts/commit.sh"' >> $HOME/.bashrc
grep -qxF 'alias deploy="git pull; docker-compose down; docker-compose up -d; lazydocker"' $HOME/.bashrc || echo 'alias deploy="git pull; docker-compose down; docker-compose up -d; lazydocker"' >> $HOME/.bashrc

#cp ~/tools/config/.vimrc ~/
#remember git username and password for 1 hr (WARNING: stored in plaintext for that hour)
git config --global credential.helper 'cache --timeout=3600'

#adjust path to include snaps (only if /snap/bin/ exists)
[ -d "/snap/bin/" ] && echo "$PATH"|grep -q "/snap/bin" && export PATH=$PATH:/snap/bin/

#make sure git-prompt is installed 
[ -d "$HOME/.bash-git-prompt" ] || git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
grep -qxF 'if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then' $HOME/.bashrc || echo '
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
    GIT_PROMPT_THEME=Single_line_Ubuntu
fi
' >> $HOME/.bashrcS

#install lazydocker if not installed
command -v curl > /dev/null || echo "Install curl to install lazydocker"
command -v lazydocker > /dev/null || $HOME/tools/installLazyDocker.sh

command -v lazydocker > /dev/null && mkdir -p $HOME/.config/jesseduffield/lazydocker/
command -v lazydocker > /dev/null && cp $HOME/tools/config/lazydockerconfig.yml $HOME/.config/jesseduffield/lazydocker/config.yml



