#!/bin/sh

#Install Homebrew
if ! command -v brew >/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'export PATH="/opt/homebrew/bin:$PATH"' >>~/.zshrc
    source ~/.zshrc
    # Homebrew gathers anonymous aggregated user behavior analytics and reports these to Google Analytics. It is recommended that you choose to opt out
    # See https://github.com/Homebrew/brew/blob/master/docs/Analytics.md for the detail.
    brew analytics off 
fi

# Make sure we’re using the latest Homebrew.
brew update

# Install Python
if ! command -v python3 >/dev/null; then
    echo "Installing Python 3..."
    brew install python3
    echo 'export PATH="/usr/local/opt/python/libexec/bin:$PATH"' >>~/.zshrc
    source ~/.zshrc
else
    echo "Python 3 Installed"
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
    sudo npm install -g awsp
    #echo 'alias awsp="source _awsp"' >>~/.zshrc
else
    echo "AWSP Installed"
fi


# Install pip
if ! command -v pip3 >/dev/null; then
    echo "Installing pip.."
    curl -O https://bootstrap.pypa.io/get-pip.py
    python3 get-pip.py --user
    echo "Pip3 installed"
else
    echo "Pip3 Installed"
fi

# Install git code commit helper
if ! command pip3 list | grep git-remote-codecommit >/dev/null; then
    echo "Installing Code commit helper..."
    pip3 install git-remote-codecommit
    echo "Code Commit Helper Installed"
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

# Install AWS CDK
if ! command -v cdk >/dev/null; then
    echo "Installing CDK"
    brew install aws-cdk
    echo "CDK Installation completed"
else
    echo "CDK Installed"
fi

# Install Boto3
if ! command pip3 list | grep boto3 >/dev/null; then
    echo "Installing Boto3..."
    pip3 install boto3
else
    echo "Boto3 Installed"
fi

# Install jq
if ! command -v jq >/dev/null; then
    echo "Installing Jq..."
    brew install jq
else
    echo "Jq Installed"
fi

# Install eksctl
if ! command -v eksctl >/dev/null; then
    echo "Installing eksctl..."
    brew install weaveworks/tap/eksctl
else
    echo "eks ctl installed"
fi