"------------------------------------------------------------------------------------------
" syntax on
" filetype on                  " require
set nocompatible              " be iMproved, requiredd
set nu
set relativenumber
set t_Co=256
set background=dark " Setting dark mode
set expandtab
set tabstop=4
set shiftwidth=4
set title
"set updatetime=400 " set update time
"------------------------------------------------------------------------------------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'roxma/nvim-completion-manager'
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
set completeopt-=preview
" let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }
Plugin 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }
let g:LanguageClient_serverCommands = {
            \ 'kotlin': ["~/kotlin-language-server/kotlin-language-server/server/build/install/server/bin/kotlin-language-server"],
            \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
            \ 'dart':['dart_language_server'],
            \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
            \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
            \ 'python': ['/usr/local/bin/pyls'],
            \}
noremap <silent> <space>lcs :LanguageClientStart<CR>
noremap <silent> <space>ca :call LanguageClient_textDocument_codeAction()<CR>
noremap <silent> <space>h :call LanguageClient_textDocument_hover()<CR>
noremap <silent> <space>df :DartFmt<CR>
noremap <silent> <space>f :call LanguageClient_textDocument_formatting()<CR>
noremap <silent> <space>d :call LanguageClient_textDocument_definition()<CR>
noremap <silent> <space>r :call LanguageClient_textDocument_rename()<CR>
noremap <silent> <space>s :call LanguageClient_textDocument_documentSymbol()<CR>
noremap <silent> <space>m :call LanguageClient_contextMenu()<CR>
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

"dart
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'thosakwe/vim-flutter'
"rust
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'timonv/vim-cargo'

if executable('rls')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'rls',
                \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
                \ 'whitelist': ['rust'],
                \ })
endif
"kotlin
autocmd BufReadPost *.kt setlocal filetype=kotlin
Plugin 'udalov/kotlin-vim'

"rust
set hidden
let g:racer_cmd = "/home/user/.cargo/bin/racer"
let g:racer_insert_paren = 1
let g:racer_experimental_completer = 1
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'xclip -selection clipboard'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

"indent line
Plugin 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"theme
Plugin 'lifepillar/vim-solarized8'
Plugin 'morhetz/gruvbox'

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
nnoremap <silent> <space>b :Bookmark<CR>
nnoremap <silent> <C-k><C-n> :NERDTreeToggle<CR>
nnoremap <silent> <C-c> :close<CR>
nmap <leader>nf :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let g:NERDTreeWinSize=30
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

"ctrlP
Plugin 'ctrlpvim/ctrlp.vim'

"eazy motion
Plugin 'easymotion/vim-easymotion'
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" tcomment 
Plugin 'tomtom/tcomment_vim'
Plugin 'terryma/vim-multiple-cursors'
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
colorscheme gruvbox 
let g:airline_theme='gruvbox'
let g:solarized_termcolors=256
"let g:solarized_termtrans = 1   
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
"for use type enter to select  
inoremap <expr> <Enter> pumvisible() ? "<Esc>a" : "<Enter>" 

