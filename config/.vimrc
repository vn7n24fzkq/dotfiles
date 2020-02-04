"------------------------------------------------------------------------------------------
syntax on
filetype off                  " require
set nocompatible              " be iMproved, requiredd
set nu
set relativenumber
set t_Co=256
set background=dark " Setting dark mode
set expandtab
set tabstop=4
set shiftwidth=4
"set updatetime=400 " set update time
"------------------------------------------------------------------------------------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

if has('nvim')
    Plugin 'roxma/nvim-completion-manager'
    "Supress the annoying completion messages
    set shortmess+=c
    "When the <Enter> key is pressed while the popup menu is visible, it only hides the menu. Use this mapping to hide the menu and also start a new line.
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
    "Use <TAB> to select the popup menu:
    inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    " (Optional) Multi-entry selection UI.
    Plugin 'junegunn/fzf'

    let g:deoplete#enable_at_startup = 1

    " LanguageClient
    Plugin 'autozimu/LanguageClient-neovim', {
                \ 'branch': 'next',
                \ 'do': 'bash install.sh',
                \ }
    noremap <F8> :Cargo run<CR>

    " languageClient
    let g:LanguageClient_serverCommands = {
                \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
                \ 'dart':['dart_language_server'],
                \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
                \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
                \ 'python': ['/usr/local/bin/pyls'],
                \ }

    nnoremap <leader>lcs :LanguageClientStart<CR>
    noremap <silent> fj :call LanguageClient_textDocument_codeAction()<CR>
    noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
    noremap <silent> df :DartFmt<CR>
    noremap <silent> F :call LanguageClient_textDocument_formatting()<CR>
    noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
    noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
    noremap <silent> S :call LanguageClient_textDocument_documentSymbol()<CR>
    noremap <leader>m :call LanguageClient_contextMenu()<CR>

    "dart
    Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plugin 'dart-lang/dart-vim-plugin'
    Plugin 'thosakwe/vim-flutter'

    "rust
    Plugin 'rust-lang/rust.vim'
    Plugin 'racer-rust/vim-racer'
    Plugin 'prabirshrestha/async.vim'
    Plugin 'prabirshrestha/vim-lsp'

    "" Plugin 'prabirshrestha/asyncomplete.vim'
    ""    Plugin 'prabirshrestha/asyncomplete-lsp.vim'


    if executable('rls')
        au User lsp_setup call lsp#register_server({
                    \ 'name': 'rls',
                    \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
                    \ 'whitelist': ['rust'],
                    \ })
    endif 

    "rust
    set hidden
    let g:racer_cmd = "/home/user/.cargo/bin/racer"
    let g:racer_insert_paren = 1
    let g:racer_experimental_completer = 1
    let g:rustfmt_autosave = 1
    let g:rust_clip_command = 'xclip -selection clipboard'




else

    "YouCompleteMe
    Plugin 'Valloric/YouCompleteMe'
    let g:syntastic_java_checkers = []
    let g:EclimFileTypeValidate = 0
    "set completeopt-=preview
    let g:ycm_add_preview_to_completeopt = 1 
    let g:ycm_autoclose_preview_window_after_insertion = 1

endif
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

"indent line
Plugin 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"theme
Plugin 'lifepillar/vim-solarized8'

" delimitMate
Plugin 'Raimondi/delimitMate'

"markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

"nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'ryanoasis/vim-devicons'
nnoremap <silent> <C-k><C-n> :NERDTreeToggle<CR>
nnoremap <silent> <C-c> :close<CR>
nmap <leader>nf :NERDTreeFind<CR>
let g:NERDTreeWinSize=30
let NERDTreeMapOpenInTab='\r'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" tcomment 
Plugin 'tomtom/tcomment_vim'

" surround
Plugin 'tpope/vim-surround'

" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" gitgutter
Plugin 'airblade/vim-gitgutter'

" tagbar
Plugin 'majutsushi/tagbar'
Plugin 'ludovicchabant/vim-gutentags' 
nnoremap <silent> <C-K><C-T> :TagbarToggle<CR>

" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"hi Normal ctermbg=NONE        " Set no Alpha                                                                                                  
colorscheme solarized8
let g:airline_theme='solarized'
let g:solarized_termcolors=256
"let g:solarized_termtrans = 1   
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
"for use type enter to select  
inoremap <expr> <Enter> pumvisible() ? "<Esc>a" : "<Enter>" 

noremap "*p :r !cat /home/vn7/.crouton-clipboard/data.txt<CR>
noremap "*y :'<,'>w! /home/vn7/.crouton-clipboard/data.txt<CR>
