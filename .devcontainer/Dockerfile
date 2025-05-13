# Dockerfile
FROM mcr.microsoft.com/devcontainers/base:debian

# Install dependencies and build Neovim
RUN apt-get update && \
    apt-get install -y git cmake && \
    git clone https://github.com/neovim/neovim.git /tmp/neovim && \
    cd /tmp/neovim && \
    make CMAKE_BUILD_TYPE=RelWithDebInfo && \
    make install && \
    rm -rf /tmp/neovim

# Optionally, switch shell to zsh if needed
RUN apt-get install -y zsh && \
    chsh -s /usr/bin/zsh