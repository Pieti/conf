#!/usr/bin/env bash

set -e

REMOTE="git@github.com:Pieti/conf.git"
LOCAL="$HOME/.cfg"

function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

cd $HOME
echo ".cfg" >> .gitignore
git clone --bare $REMOTE $LOCAL
config checkout
if [ $? == 0] ; then
  echo "Checked out config."
else
  echo "Backing up pre-existing dot files."
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi
config config --local status.showUntrackedFiles no
