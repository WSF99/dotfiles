#!/bin/bash

# Install essential packages
echo "Installing essential packages..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y zsh curl git python3 python3-pip python3-venv eza kitty btop htop zstd tmux

# Change default shell to ZSH
echo "Changing default shell to ZSH..."
chsh -s $(which zsh)

# Configure the terminal
echo "Configuring terminal emulator..."
sudo update-alternatives --config x-terminal-emulator

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Rust
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Pokemon Colorscripts
echo "Installing Pokemon Colorscripts..."
git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git
cd pokemon-colorscripts
sudo ./pokemon-colorscripts/install.sh
rm -rf pokemon-colorscripts

# Install EZA
echo "Installing EZA..."
git clone https://github.com/z-shell/zsh-eza ${HOME}/.oh-my-zsh/custom/plugins/

# Install FastFetch
echo "Installing FastFetch..."
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo apt update
sudo apt install fastfetch

# Install Nerd Fonts
echo "Installing JetBrainsMono Nerd Font..."
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ${HOME}/.local/share/fonts
rm JetBrainsMono.zip
fc-cache -fv

# Clone ZSH plugins (zsh-syntax-highlighting and zsh-autosuggestions)
echo "Cloning ZSH plugins..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Symlink configuration files
echo "Setting up configuration files..."
ln -sf ${HOME}/dotfiles/.zshrc ${HOME}/.zshrc
ln -sf ${HOME}/dotfiles/.config/btop ${HOME}/.config/btop
ln -sf ${HOME}/dotfiles/.config/kitty ${HOME}/.config/kitty
ln -sf ${HOME}/dotfiles/.config/fastfetch ${HOME}/.config/fastfetch

echo "Installing Node v22.13.1..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install 22

# Final message
echo "Setup complete! Please restart your terminal or run 'source ~/.zshrc' to apply the changes."
