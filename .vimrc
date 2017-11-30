set nocompatible		" required
filetype off			" required


" General text editing options
set nu				" show line numbers
set autoread
" smart indentation: http://stackoverflow.com/a/1878983/3623609
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
" show info on pressed leader key
set showcmd


" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'vimwiki/vimwiki'

" All of your Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required


syntax enable
set laststatus=2

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

" IncSearch settings
set incsearch
set hlsearch
" Map hiding last search highlight to ESC
nnoremap <CR> :noh<CR><CR>

" Search down into subfolders using regular, build-in Vim file search
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .


" KEY REMAP

" Disable arrow keys 
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Disable Del and Backspace
inoremap <BS> <Nop>
inoremap <Del> <Nop>

" Map semicolon to colon
nnoremap ; :

" Navigate easier between split tabs
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Set more natural way for new splits
set splitbelow
set splitright

" Vertical line at column 80
highlight ColorColumn ctermbg=8
if exists('&colorcolumn')
    set colorcolumn=80
endif

" A place for code snippets.
ab ipdb import ipdb; ipdb.set_trace()
ab blank blank=True, null=True
