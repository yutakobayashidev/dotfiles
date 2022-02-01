eval "$(starship init zsh)"
eval "$(gh completion -s zsh)"

. /opt/homebrew/opt/asdf/asdf.sh

# alias

alias ll='ls -l'
alias code="open -a 'Visual Studio Code'"
alias sim="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/"
alias y='yarn'
alias yi='yarn install'
alias ya='yarn add'
alias n='npm'
alias ni='npm install'

# export

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/Users/$USER/.npm-global/bin

# terminal

echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"
function chpwd() { echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}

# Github CLI (https://zenn.dev/torahack/articles/d6b760fd11bf3a)

prco () {
    gh pr list;
    echo "Type the number of PR to checkout: " && read number;
    gh pr checkout ${number};
}

prdiff () {
    gh pr list;
    echo "Type the number of PR to checkout: " && read number;
    gh pr diff ${number};
}

gcre() {
    git init && git add . && git status && git commit -m "First commit"
    echo "Type repository name: " && read name;
    echo "Type repository description: " && read description;
    gh repo create ${name} --description ${description}
    git remote add origin https://github.com/deatiger/${name}.git
    git checkout -b develop;
    git push -u origin develop;
}