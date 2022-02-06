tap "ethereum/ethereum"
tap "qmk/qmk"
tap 'shopify/shopify'

brew "asdf"
brew "awscli"
brew "cocoapods"
brew "coreutils"
brew "curl"
brew "ethereum"
brew "ffmpeg"
brew "git"
brew "gh"
brew "ghq"
brew "heroku/brew/heroku"
brew "ios-deploy"
brew "jq"
brew "khanhas/tap/spicetify-cli"
brew "neofetch"
brew "peco"
brew "qmk"
brew "stow"
brew "shopify-cli"
brew "starship"
brew "shpotify"
brew "tmux"
brew "terminal-notifier"
brew "wget"
brew "watchman"
brew "yt-dlp"
brew "zsh"
brew "zsh-autosuggestions"
brew "zsh-completions"
brew "zsh-syntax-highlighting"
brew "zplug"

if OS.mac? # mac only
    # taps
    tap "homebrew/cask"
    tap "homebrew/cask-fonts"
    tap "homebrew/cask-drivers"
    tap "koekeishiya/formulae"
    tap "yutakobayashidev/formulae"
    cask_args appdir: "/Applications"

    brew "mas"
    brew "yabai"
    brew "skhd"

    # Applications

    cask "1password"
    cask "alfred"
    cask "audacity"
    cask "akiflow"
    cask "android-studio"
    cask "adobe-creative-cloud"
    cask "adoptopenjdk/openjdk/adoptopenjdk8"
    cask "brave-browser"
    cask "bluestacks" if system '[ "$(uname -m)" = "x86_64" ]'
    cask "blender" 
    cask "blockbench"
    cask "betterdiscord-installer"
    cask "cleanmymac"
    cask "clip-studio-paint"
    cask "dropbox"
    cask "discord"
    cask "docker"
    cask "deepl"
    cask "elgato-stream-deck"
    cask "epic-games"
    cask "fl-studio"
    cask "figma"
    cask "google-japanese-ime"
    cask "google-cloud-sdk"
    cask "gpg-suite"
    cask "grammarly"
    cask "intellij-idea"
    cask "iterm2"
    cask "insomnia"
    cask "jquake"
    cask "keybase"
    cask "kindle"
    cask "local"
    cask "MeetingBar"
    cask "musescore"
    cask "minecraft"
    cask "miro"
    cask "nordvpn"
    cask "nvidia-geforce-now"
    cask "notion"
    cask "obs"
    cask "ogdesign-eagle"
    cask "pycharm"
    cask "qmk-toolbox"
    cask "slack"
    cask "signal"
    cask "spotify"
    cask "steam"
    cask "tor-browser"
    cask "tunnelblick"
    cask "tableplus"
    cask "unity-hub"
    cask "visual-studio-code"
    cask "virtualbox" if system '[ "$(uname -m)" = "x86_64" ]'
    cask "wireshark"
    cask "zoom"
    
    if ENV.fetch('CI', 'false') == 'false'
        mas "Xcode", id: 497799835 
        mas "TestFlight", id: 899247664 
        mas "Runcat", id: 1429033973     
      end

    # Fonts
    cask "font-fira-code-nerd-font"
    cask "font-hack-nerd-font"
    cask "font-mplus"
end