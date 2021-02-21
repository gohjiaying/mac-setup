#!/bin/sh

#Install Homebrew
if ! command -v brew >/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Install Python
if ! command -v python3 >/dev/null; then
    echo "Installing Python 3..."
    brew install python3
    echo 'export PATH="/usr/local/opt/python/libexec/bin:$PATH"' >>~/.zshrc
else
    pip install --upgrade pip
    echo "Python 3 Installed and pip upgraded"
fi

#Install AWS CLI
if ! command -v aws >/dev/null; then
    echo "Installing AWS ClI..."
    curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
    sudo installer -pkg AWSCLIV2.pkg -target /
else
    echo "AWS CLI Installed"
fi

# Install Node and NPM
if ! command -v node >/dev/null; then
    echo "Installing Node..."
    brew install node
else
    echo "Node Installed"
fi

# Install awsp
if ! command npm list -g | grep awsp >/dev/null; then
    echo "Installing AWSP..."
    npm install -g awsp
    echo 'alias awsp="source _awsp"' >>~/.zshrc
else
    echo "AWSP Installed"
fi


# Install pip
if ! command -v pip >/dev/null; then
    echo "Installing pip.."
    curl -O https://bootstrap.pypa.io/get-pip.py
    python3 get-pip.py --user
    echo "Pip installed"
else
    echo "Pip Installed"
fi

# Install git code commit helper
if ! command pip list | grep git-remote-codecommit >/dev/null; then
    echo "Installing Code commit helper..."
    pip install git-remote-codecommit
    echo "Code Commit Helper Installed!"
else
    echo "Code Commit Helper Installed"
fi


# Install Rust (DevOps CloudFormation Guard)
if ! command -v rustc >/dev/null; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
    echo "RustUp Installed"
fi

# Install Git Flow
if ! command git flow version >/dev/null; then
    echo "Installing Git Flow..."
    brew install git-flow
    echo "Git Flow Installed"
else
    echo "Git Flow Installed"
fi

