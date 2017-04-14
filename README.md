# my-vim-ide
My personal VIM as IDE  

## Initialize  
### Install VIM Plug mgr
cd ~/.vim/autoload  
wget https://github.com/junegunn/vim-plug/raw/master/plug.vim  

cd ~/  
cat .vimrc  

" .vimrc configuration  
call plug#begin('~/.vim/')  
Plug 'https://github.com/eda53/my-vim-ide.git'  
call plug#end()  

### Plug Update
:PlutInstall  

### Merge vimrc
[ -f ~/.vimrc ] && rm ~/.vimrc  
ln -sf ~/.vim/my-vim-ide/.vimrc ~  

Update plug again with above command.  

## Usage
### Motion
h, j, k, l  
C-h, C-j, C-k, C-l  
gg  
:123  
%, [[, ]]  
0, $, w, f(  

### Edit
:e ~/.vimrc  
:vs, :sp, :vnew, :read !ls -l  
;a
gf

### Show
:se nolist, :se nu  
zM, zR, zo, zc  
:vert resize +20  

### Help
:Help VCDiff  
M

### auto-complete
std::map<int string> mytestmap;  
mytestmap.  

vector<int> specialvector;  
specialvector.  

C-j  

### compile
:MM  

### cscope
updatecs.sh ../lib ../svn_externals  
C-\  g  
C-\  s  
C-\  c  

## cpp_tags
done  

