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
Plugin 'kien/ctrlp.vim'
Plugin 'powerline/powerline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'mileszs/ack.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'suan/vim-instant-markdown'

" All of your Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required

" ALE options
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
" Uncomment in case of same-directory import problems
" let g:ale_python_pylint_options = "--init-hook='import sys; sys.path.append(\".\")'"
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" Set flake8 executable in ALE according to active virtualenv.
let g:ale_python_flake8_executable = $VIRTUAL_ENV . '/bin/flake8'
" A trick in order to always use the active virtualenv's pylint (failed attempt)
"let g:ale_python_pylint_executable = $VIRTUAL_ENV . '/bin/pylint'
" Probably we can handle in the same way flake8 options within the ALE context.
let g:ale_python_pylint_options = '-d C0111, -d C0103, -d R0901, -d R0902, -d R0903, -d R0904,'

" CtrlP options
" Ignore certain files and dirs
" TODO: Ignore build folder also
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.git$',
  \ 'file': '\v\.(pyc|swp|zip)$',
  \ }

" NerdCommenter options
" Add spaces after comment delimiters (by default it's zero extra spaces which
" is fine for Python and leaves no extra space when uncommenting)
" let g:NERDSpaceDelims = 0

" Powerline options
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
" added the sys.path.append so that powerline import works in virtualenv 
" the three powerline import lines do not work in virtualenv otherwise
py3 << EOF
import os
import sys
venv = os.environ.get('VIRTUAL_ENV')
if venv is not None:
    packeges_path = os.path.join(venv, "lib/python2.7/site-packages/")
    sys.path.append(packeges_path)
    from powerline.vim import setup as powerline_setup
    powerline_setup()
    del powerline_setup
EOF

" python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" If Silver Searcher is available, use it as the search engine for ack plugin
" All the ag options can be used here, including -A2 -B2
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" Use Ack! instead of Ack in order not to jump to the first result automatically
cnoreabbrev Ack Ack!
" Map Ack search as <Leader> a
nnoremap <Leader>a :Ack!<Space>
" if set to 1, automagically preview files as you scroll throught the result list
let g:ackpreview = 0

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
    set colorcolumn=121
endif

" Well, YCM doesn't seem to work, so we can use the built-in completion
" Map basic completion from ^P to Tab - it's much more intuistic
inoremap <Tab> <C-P> 

" A place for code snippets.
ab ipdb import ipdb; ipdb.set_trace()
