tap "ethereum/ethereum"
tap "qmk/qmk"
tap 'shopify/shopify'

brew "neofetch"
brew "wget"
brew "stow"
brew "jq"
brew "ghq"
brew "peco"
brew "asdf"
brew "coreutils"
brew "zsh-autosuggestions"
brew "zsh-syntax-highlighting"
brew "zplug"
brew "curl"
brew "git"
brew "gh"
brew "shopify-cli"
brew "awscli"
brew "starship"
brew "watchman"
brew "cocoapods"
brew "ffmpeg"
brew "shpotify"
brew "ethereum"
brew "yt-dlp"
brew "qmk"

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

    cask "google-japanese-ime"
    cask "brave-browser"
    cask "google-cloud-sdk"
    cask "gpg-suite"
    cask "qmk-toolbox"
    cask "alfred"
    cask "audacity"
    cask "akiflow"
    cask "MeetingBar"
    cask "jquake"
    cask "fl-studio"
    cask "musescore"
    cask "cleanmymac"
    cask "clip-studio-paint"
    cask "dropbox"
    cask "1password"
    cask "visual-studio-code"
    cask "intellij-idea"
    cask "pycharm"
    cask "android-studio"
    cask "bluestacks" if system '[ "$(uname -m)" = "x86_64" ]'
    cask "virtualbox" if system '[ "$(uname -m)" = "x86_64" ]'
    cask "alacritty"
    cask "tableplus"
    cask "wireshark"
    cask "nordvpn"
    cask "tunnelblick"
    cask "docker"
    cask "insomnia"
    cask "keybase"
    cask "blender" 
    cask "blockbench"
    cask "discord"
    cask "betterdiscord-installer"
    cask "slack"
    cask "signal"
    cask "deepl"
    cask "zoom"
    cask "spotify"
    cask "kindle"
    cask "obs"
    cask "elgato-stream-deck"
    cask "steam"
    cask "epic-games"
    cask "unity-hub"
    cask "nvidia-geforce-now"
    cask "minecraft"
    cask "adobe-creative-cloud"
    cask "ogdesign-eagle"
    cask "figma"
    cask "miro"
    cask "notion"
    
    if ENV.fetch('CI', 'false') == 'false'
        mas "Xcode", id: 497799835 
        mas "Runcat", id: 1429033973     
      end

    # Fonts
    cask "font-fira-code-nerd-font"
    cask "font-mplus"
    cask "adoptopenjdk/openjdk/adoptopenjdk8"
end