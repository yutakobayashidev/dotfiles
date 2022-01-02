alias ll='ls -l'
alias code="open -a 'Visual Studio Code'"

eval "$(starship init zsh)"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

. /opt/homebrew/opt/asdf/asdf.sh