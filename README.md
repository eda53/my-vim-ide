# my-vim-ide
My personal VIM as IDE

cd ~/.vim/autoload
wget https://github.com/junegunn/vim-plug/raw/master/plug.vim

cd ~/
cat .vimrc


call plug#begin('~/.vim/plugin')
Plug 'https://github.com/eda53/my-vim-ide.git'
call plug#end()
