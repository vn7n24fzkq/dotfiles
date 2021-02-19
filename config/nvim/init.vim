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
"Plugin 'roxma/nvim-completion-manager'
set shortmess+=c
"When the <Enter> key is pressed while the popup menu is visible, it only hides the menu. Use this mapping to hide the menu and also start a new line.
let mapleader= "\<Space>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
"Use <TAB> to select the popup menu:
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <silent> <leader>h :call Hover()<CR>
function! Hover()
        :call CocAction('doHover')
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>t <Plug>(coc-type-definition)
nmap <silent> <leader>i <Plug>(coc-implementation)
nmap <silent> <leader>r <Plug>(coc-references)

xmap <silent> <leader>ca  <Plug>(coc-codeaction-selected)
vmap <silent> <leader>ca  <Plug>(coc-codeaction-selected)
nmap <silent> <leader>ca  <Plug>(coc-codeaction)
nmap <silent> <leader>cf  <Plug>(coc-fix-current)

nmap <silent> <leader>F  :call CocAction('format')<CR>

nmap <silent> <leader>R <Plug>(coc-rename)

xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" conflict with <C-i>
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)
nnoremap <silent> <leader>E  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>o  :<C-u>CocList extensions<cr>
nnoremap <silent> <leader>C  :<C-u>CocList commands<cr>
nnoremap <silent> <leader>S  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>P  :<C-u>CocListResume<CR>
nmap <silent> <leader>ek <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ej <Plug>(coc-diagnostic-next)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" (Optional) Multi-entry selection UI.
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

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
" Plugin 'SirVer/ultisnips'
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
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'

nmap <silent> <C-k><C-n> :CocCommand explorer<CR>
let g:coc_explorer_global_presets = {
\   '.vim': {
\      'root-uri': '~/.config/nvim/init.vim',
\   },
\   'floating': {
\      'position': 'floating',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\   },
\   'floatingLeftside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'floatingRightside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

" Use preset argument to open it
nmap <space>ed :CocCommand explorer --preset .vim<CR>
nmap <space>ef :CocCommand explorer --preset floating<CR>

" List all presets
nmap <space>el :CocList explPresets
" explorer
Plugin 'ryanoasis/vim-devicons'

"nerdtree
" Plugin 'scrooloose/nerdtree'
" Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plugin 'Xuyuanp/nerdtree-git-plugin'
" nnoremap <silent> <C-k><C-n> :NERDTreeToggle<CR>
" nnoremap <silent> <C-c> :close<CR>
" nmap <leader>nf :NERDTreeFind<CR>
" let NERDTreeShowBookmarks=1
" let g:NERDTreeWinSize=30
" git wrapper 
Plugin 'tpope/vim-fugitive'

"ctrlP
Plugin 'ctrlpvim/ctrlp.vim'
nmap <Leader>p :CtrlP<CR>
nmap <Leader>b :CtrlPBuffer<CR>

"eazy motion
Plugin 'easymotion/vim-easymotion'
" <Leader>f{char} to move to {char}
map  <Leader>ef <Plug>(easymotion-bd-f)
nmap <Leader>ef <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>ew <Plug>(easymotion-bd-w)
nmap <Leader>ew <Plug>(easymotion-overwin-w)

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
" Plugin 'ludovicchabant/vim-gutentags' 
nnoremap <silent> <C-K><C-T> :TagbarToggle<CR>
"lightline 
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
Plugin 'itchyny/lightline.vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

" git-messager
Plugin 'rhysd/git-messenger.vim'

"ack
Plugin 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
command Todo Ack! 'TODO|FIXME|CHANGED|BUG|HACK'
command Debug Ack! 'NOTE|INFO|IDEA'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" coc install extensions
call coc#add_extension('coc-snippets',
            \'coc-tabnine',
            \'coc-prettier',
            \'coc-eslint',
            \'coc-highlight',
            \'coc-python',
            \'coc-flutter')

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
