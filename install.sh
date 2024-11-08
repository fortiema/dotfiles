#!/bin/sh

echo "Setting up your Mac. This will take a while..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  echo "Installing Oh-My-ZSH..."
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
  ZSH_CUSTOM_PLUGINS="$HOME/.oh-my-zsh/custom/plugins"
  mkdir -p $ZSH_CUSTOM_PLUGINS
  echo "Step Complete!"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  echo "Step Complete!"
fi

echo "Installing zshrc..."
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
source ~/.zshrc
echo "Step Complete!"

echo "Installing starship..."
mkdir -p ~/.config
ln -s $HOME/.dotfiles/starship.toml $HOME/.config/starship.toml
echo "Step Complete!"

echo "Running Homebrew"
# Update Homebrew recipes
brew update
# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file $DOTFILES/Brewfile
echo "Step Complete!"

echo "Installing nvm..."
git clone https://github.com/lukechilds/zsh-nvm $ZSH_CUSTOM_PLUGINS/zsh-nvm
nvm ls
echo "Step Complete!"

echo "Setting up default dev python..."
LATEST_PYTHON="3.12"
env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install $LATEST_PYTHON
pyenv global $LATEST_PYTHON
python -m pip install --upgrade pip
pipx ensurepath
pipx install poetry
mkdir -p $ZSH_CUSTOM_PLUGINS/poetry
poetry completions zsh > $ZSH_CUSTOM_PLUGINS/poetry/_poetry
echo "Step Complete!"

# Mackup not working in Sonoma, will break your setup
# ref.: https://github.com/lra/mackup?tab=readme-ov-file#warning
# echo "Installing Mackup..."
# ln -s $DOTFILES/.mackup.cfg $HOME/.mackup.cfg
# echo "Step Complete!"

# if [ ! -f "$DOTFILES/.macos" ]; then
#     echo "Seting macOS system preferences. Shell will reload at the end..."
#     source $DOTFILES/.macos
# fi

echo "All Done! Reboot for changes to take effect and enjoy your new system :)"
