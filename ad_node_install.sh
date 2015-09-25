#!/bin/sh
TMP_DIR="/tmp/${USER}_node"
PREFIX_DIR="$HOME/local"
NODE_VERSION=v0.10.20
NPM_VERSION=2.14.6

mkdir -p $PREFIX_DIR
mkdir -p $TMP_DIR

# INSTALL NODE.JS
cd $TMP_DIR && git clone https://github.com/joyent/node.git .
git checkout $NODE_VERSION
./configure --prefix=$PREFIX_DIR
make
make install

# INSTALL/UPGRADE NPM
$PREFIX_DIR/bin/npm install -g npm@$NPM_VERSION

echo "export PATH=\$PATH:$PREFIX_DIR/bin" >> $HOME/.bashrc

# Fix profile for capistrano access to npm
echo "if [ "\$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
" >> $HOME/.profile

source ~/.bashrc

# cleanup
cd $PREFIX_DIR
rm -r $TMP_DIR
