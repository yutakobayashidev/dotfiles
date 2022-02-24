export PATH=$PATH:$HOME/scripts
export PATH="$PATH:/opt/homebrew/bin/"
export ZPLUG_HOME=$(brew --prefix)/opt/zplug

eval "$(starship init zsh)"
eval "$(gh completion -s zsh)"

. /opt/homebrew/opt/asdf/asdf.sh

# alias

alias ls="colorls"
alias ll='colorls -l'
alias lscmd="ls ~/scripts"
alias code="open -a 'Visual Studio Code'"
alias sim="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/"
alias mccmd='java -jar -Xms4G -Xmx4G' 
alias vi="nvim"
alias y='yarn'
alias yi='yarn install'
alias ya='yarn add'
alias n='npm'
alias ni='npm install'
alias gitrm='rm -rf .git'
alias ghw='gh repo view -w $(ghq list | peco)'
alias vs='code $(ghq list -p | peco)'
alias pr='gh pr view --web'
alias ze="yarn zenn"
alias zep="yarn zenn preview"

# export

export GPG_TTY=$TTY

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="/opt/homebrew/sbin:$PATH"

export PATH=$PATH:$(yarn global bin)

# source

#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####

. $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
source $ZPLUG_HOME/init.zsh

# plugins

zplug "marzocchi/zsh-notify"
zplug "b4b4r07/enhancd", use:"init.sh"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit && compinit
fi

if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

# bookmarks
# https://threkk.medium.com/how-to-use-bookmarks-in-bash-zsh-6b8074e40774


if [ -d "$HOME/.bookmarks" ]; then
    export CDPATH=".:$HOME/.bookmarks:"
    alias goto="cd -P"
fi

function bookmark {
    local current_dir=$(pwd)
    ln -s $current_dir ~/.bookmarks/@$(basename $current_dir)
}

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

function mkcd() {
      if [[ -d $1 ]]; then
          echo "$1 already exists!"
          cd $1
      else
          mkdir -p $1 && cd $1
      fi
}

# https://qiita.com/sfuta/items/a72f7bd194a61353c9fe

# hook関数precmd実行
__call_precmds() {
  type precmd > /dev/null 2>&1 && precmd
  for __pre_func in $precmd_functions; do $__pre_func; done
}

#shift+upで親ディレクトリへ
__cd_up()   { builtin cd ..; echo "\r\n"; __call_precmds; zle reset-prompt }
zle -N __cd_up;   bindkey '^[[1;2A' __cd_up

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