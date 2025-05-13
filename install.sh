#!/bin/bash
# install.sh: Install tmux and load tmux.conf into ~/.tmux.conf

# Function to install tmux if not available.
install_tmux() {
  echo "tmux not found. Installing tmux..."
  if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update && sudo apt-get install -y tmux
  elif command -v brew >/dev/null 2>&1; then
    brew install tmux
  else
    echo "Error: Could not detect apt-get or brew. Please install tmux manually."
    exit 1
  fi
}

# Check if tmux is installed.
if ! command -v tmux >/dev/null 2>&1; then
  install_tmux
else
  echo "tmux is already installed."
fi

# Backup existing tmux configuration if it exists.
if [ -f "$HOME/.tmux.conf" ]; then
  echo "Backing up your existing ~/.tmux.conf to ~/.tmux.conf.bak"
  cp "$HOME/.tmux.conf" "$HOME/.tmux.conf.bak"
fi

# Copy the local tmux.conf to the user's home directory.
# Assuming tmux.conf is in the same directory as install.sh.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Copying tmux.conf from $SCRIPT_DIR to ~/.tmux.conf"
cp "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf"

# Install Starship prompt
echo "Installing Starship prompt..."
curl -sS https://starship.rs/install.sh | sh -s -- -y

echo "Installation complete. You can now start tmux and your configuration will be loaded."
