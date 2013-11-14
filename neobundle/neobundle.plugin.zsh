function neobundle-init () {
  if [ ! -d ~/.vim/bundle/neobundle.vim/ ]
  then
    mkdir -p ~/.vim/bundle/neobundle.vim/
  fi

  if [ ! -d ~/.vim/bundle/neobundle.vim/.git/ ]
  then
    git clone http://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    echo "\n\tRead about vim configuration for neobundle at https://github.com/Shougo/neobundle.vim\n"
  fi
}

function neobundle () {
  neobundle-init
  vim -c "execute \"NeoBundleInstall\" | q | q"
}

function neobundle-update () {
  neobundle-init
  vim -c "execute \"NeoBundleInstall!\" | q | q"
}

function neobundle-clean () {
  neobundle-init
  vim -c "execute \"NeoBundleClean!\" | q | q"
}
