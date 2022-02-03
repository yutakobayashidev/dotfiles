# dotfiles

[![GitHub](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/yutakobayashidev/dotfiles/blob/main/LICENSE)
![macos](https://github.com/yutakobayashidev/dotfiles/workflows/macos/badge.svg)

dotfiles for macOS

## Installation

1. Sign in to App store manually
2. Run install

```sh
curl -o - https://raw.githubusercontent.com/yutakobayashidev/dotfiles/main/packages/cli/scripts/dotfiles | sh
```

3. Restart macOS


## Manual operations

### IME

1. add google-japanese-ime to input sources

### Yabai and skhd

1. Execute the following command.

```sh
brew services start --all
```

2. Then allow accessibility permissions on Security & Privacy inside System Preferences.app

### Visual Studio Code 

1. Login and sync with your Github account. 

## Inspired

- [JunichiSugiura/dotfiles: 💻 macOS dotfiles managed with GNU stow + Homebrew Bundle](https://github.com/JunichiSugiura/dotfiles)
- [ulwlu/dotfiles: My configurations and scripts containing MacOS full-auto-setup script](https://github.com/ulwlu/dotfiles)
- [valbeat/dotfiles: My dotfiles](https://github.com/valbeat/dotfiles)
- [rtakasuke/.dotfiles: my dotfiles](https://github.com/rtakasuke/.dotfiles)
- [reireias/dotfiles: configuration for vim, bash, zsh, etc...](https://github.com/reireias/dotfiles)
- [keyamin/dotfiles](https://github.com/keyamin/dotfiles)
- [kuzukawa/dotfiles](https://github.com/kuzukawa/dotfiles)