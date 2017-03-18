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
Plug 'https://github.com/vim-scripts/OmniCppComplete.git'  
Plug 'https://github.com/lifepillar/vim-mucomplete.git'  
Plug 'https://github.com/juneedahamed/vc.vim.git'  
Plug 'https://github.com/vim-scripts/a.vim.git'  
Plug 'https://github.com/WolfgangMehner/c-support.git', { 'do' : '../my-vim-ide/hijack-temp.sh' }  
call plug#end()  

## Plug Update
:PlutInstall  

## Merge vimrc
[ -f ~/.vimrc ] && rm ~/.vimrc  
ln -sf ~/.vim/my-vim-ide/.vimrc ~  

## cpp_tags
todo  

