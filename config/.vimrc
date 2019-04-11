"------------------------------------------------------------------------------------------
syntax enable
syntax on
filetype off                  " require
set nocompatible              " be iMproved, requiredd
set nu
set t_Co=256
set background=dark " Setting dark mode
set expandtab
set tabstop=4
set shiftwidth=4

"set updatetime=400 " set update time
"------------------------------------------------------------------------------------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"theme
Plugin 'nightsense/stellarized' 

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" delimitMate
Plugin 'Raimondi/delimitMate'

"markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

"rust
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif 

"nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

"tagbar
"Plugin 'majutsushi/tagbar

"YoucompleteMe
Plugin 'Valloric/YouCompleteMe'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" tcomment 
Plugin 'tomtom/tcomment_vim'

"surround
Plugin 'tpope/vim-surround'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

"gitgutter
Plugin 'airblade/vim-gitgutter'

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

colorscheme stellarized
hi Normal ctermbg=NONE        " Set no Alpha                                                                                                  
let g:airline_theme='stellarized_dark'
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

"tagbar
nmap <F8> :RustRun<CR>

"YouCompleteMe
let  g:syntastic_java_checkers = []
let g:EclimFileTypeValidate = 0
"set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 1 
let g:ycm_autoclose_preview_window_after_insertion = 1
"for use type enter to select  
inoremap <expr> <Enter> pumvisible() ? "<Esc>a" : "<Enter>" 

"rust
set hidden
"let g:racer_cmd = '/home/vn7/.cargo/bin/racer'
"let g:racer_experimental_completer = 1
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'xclip -selection clipboard'
nnoremap "*p :r !cat /home/vn7/.crouton-clipboard/data.txt<CR>
vnoremap "*y :'<,'>w! /home/vn7/.crouton-clipboard/data.txt<CR>
