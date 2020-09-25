# zshrc
ln -s ./.zshrc ~
curl -fsSL https://starship.rs/install.sh | bash

# vim
ln -s ./.vimrc ~

mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/indent
mkdir -p ~/.vim/colors

cp ./.vim_files/c.vim ~/.vim/indent/c.vim
cp ./.vim_files/python.vim ~/.vim/indent/python.vim

git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
