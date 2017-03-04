# my-vim-ide
My personal VIM as IDE  

## Initialize  
cd ~/.vim/autoload  
wget https://github.com/junegunn/vim-plug/raw/master/plug.vim  

cd ~/  
cat .vimrc  

" .vimrc configuration  
call plug#begin('~/.vim/')  
Plug 'https://github.com/eda53/my-vim-ide.git'  
call plug#end()  

## Plug Update
:PlutInstall  

## Merge vimrc

