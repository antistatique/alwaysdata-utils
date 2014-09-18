#!/bin/sh

echo "# ruby setup" >> ~/.bashrc
echo "export GEM_PATH=~/gems/" >> ~/.bashrc
echo "export GEM_HOME=\$GEM_PATH" >> ~/.bashrc
echo "export PATH=~/gems/bin:\$PATH" >> ~/.bashrc

mkdir ~/gems/

source ~/.bashrc

gem install sass
