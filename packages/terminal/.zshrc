# Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
export PATH=$PATH:$HOME/scripts

export GPG_TTY=$(tty)

# Homebrew, asdf-vm

if [ -f "/opt/homebrew/bin/brew"  ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# alias

alias cat="bat"
alias g="git"
alias gundo="git reset --soft HEAD^"
alias lscmd="ls ~/scripts"
alias mccmd='java -jar -Xms4G -Xmx4G'
alias sim="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/"
alias vi="nvim"
alias y='yarn'
alias yi='yarn install'
alias ya='yarn add'
alias n='npm'
alias ni='npm install'
alias pn="pnpm"
alias p="pnpm"
alias gitrm='rm -rf .git'
alias ghw='gh repo view -w $(ghq list | peco)'
alias vs='code $(ghq list -p | peco)'
alias pr='gh pr view --web'
alias ze="npx zenn"
alias zep="npx zenn preview"
alias ll='ls -l'

eval "$(starship init zsh)"
eval "$(mise activate zsh)"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH="$HOME/.local/share/mise/shims:$PATH"

export PNPM_HOME="/Users/yuta/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export ZPLUG_HOME=$(brew --prefix)/opt/zplug
export BUN_INSTALL=$HOME/.bun
export PATH=$BUN_INSTALL/bin:$PATH
export SIMPLE_GIT_HOOKS_RC="$HOME/.simple-git-hooks.rc"

# source

. $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
source $ZPLUG_HOME/init.zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit && compinit
fi

# zplug plugins

zplug "marzocchi/zsh-notify"
zplug "b4b4r07/enhancd", use:"init.sh"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

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

__call_precmds() {
  type precmd > /dev/null 2>&1 && precmd
  for __pre_func in $precmd_functions; do $__pre_func; done
}

#shift+upで親ディレクトリへ
__cd_up()   { builtin cd ..; echo "\r\n"; __call_precmds; zle reset-prompt }
zle -N __cd_up;   bindkey '^[[1;2A' __cd_up

# terminal title

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

# bun completions
[ -s "/Users/yuta/.bun/_bun" ] && source "/Users/yuta/.bun/_bun"


# Load Angular CLI autocompletion.
source <(ng completion script)


# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"