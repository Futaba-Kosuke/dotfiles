# zshrc
ln -s $(pwd)/.zshrc ~
curl -fsSL https://starship.rs/install.sh | sh

# vim
ln -s $(pwd)/.vimrc ~

mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/indent
mkdir -p ~/.vim/colors

cp $(pwd)/.vim_files/c.vim ~/.vim/indent/c.vim
cp $(pwd)/.vim_files/python.vim ~/.vim/indent/python.vim

git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
