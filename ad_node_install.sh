#!/bin/sh
INSTALL_DIR="$HOME"
NODE_VERSION=v5.3.0
NODE_DIRNAME=node-$NODE_VERSION-linux-x64

cd $INSTALL_DIR
wget --no-check-certificates https://nodejs.org/dist/$NODE_VERSION/$NODE_DIRNAME.tar.gz
tar -xzf $NODE_DIRNAME.tar.gz
rm $NODE_DIRNAME.tar.gz

echo "export PATH=\$PATH:$INSTALL_DIR/$NODE_DIRNAME/bin" >> $HOME/.bashrc

# Fix profile for capistrano access to npm
echo "if [ "\$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
" >> $HOME/.profile