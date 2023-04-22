set shell=/bin/sh
"---------------------------
" syntax on
" filetype on                  " require
filetype plugin indent on   " Allow auto-indenting depending on file type
set nocompatible              " be iMproved, required
set nu
set relativenumber
set t_Co=256
set background=dark " Setting dark mode
set expandtab
set tabstop=4
set shiftwidth=4
"set spelllang=en,cjk
"set spellsuggest=best,9
"set spell " enable spell check (may need to download language package)
set clipboard=unnamedplus " Enables the clipboard between Vim/Neovim and other applications.
set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
set cursorline " Highlights the current line in the editor
set hidden " Hide unused buffers
set autoindent " Indent a new line
set inccommand=split " Show replacements in a split screen
set mouse=a " Allow to use the mouse in the editor
set number " Shows the line numbers
set splitbelow splitright " Change the split screen behavior
set title " Show file title
set wildmenu " Show a more advance menu
set cc=80 " Show at 80 column a border for good code style
set ttyfast " Speed up scrolling in Vim
set shortmess+=c " To hide "user defined completion" message
let mapleader= "\<Space>"
if has('termguicolors')
    set termguicolors
endif
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
"===========================
" catppuccin: color scheme
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
"===========================
" tree-sitter: highlight syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"===========================
"Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
"===========================
" ctrlP
Plug 'ctrlpvim/ctrlp.vim'
nmap <Leader>p :CtrlP<CR>
nmap <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|tmp$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
"===========================
" tcomment: comment tool 
Plug 'numToStr/Comment.nvim'
"===========================
" multiple cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"===========================
" git wrapper 
Plug 'tpope/vim-fugitive'
"===========================
" AI pair programmer 
Plug 'github/copilot.vim'
"===========================
" gitgutter
Plug 'airblade/vim-gitgutter'
"===========================
" tagbar
Plug 'liuchengxu/vista.vim'
" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_fzf_preview =  ['right:50%']
let g:vista_blink =  [1,100]
let g:vista_echo_cursor_strategy ='floating_win'
let g:vista_sidebar_width = 40
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ 'python': 'coc',
  \ 'go': 'coc',
  \ 'javascript': 'coc',
  \ 'typescript': 'coc',
  \ 'rust': 'coc',
  \ }

nnoremap <silent> <C-K><C-T> :Vista!!<CR>
"===========================
" lightline: neovim status bar
Plug 'itchyny/lightline.vim'
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
let g:lightline = {
      \ 'colorscheme': 'catppuccin',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }
"===========================
" ack
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
command Todo Ack! 'TODO|FIXME|CHANGED|BUG|HACK'
command Debug Ack! 'NOTE|INFO|IDEA'
"===========================
" Surround.vim is all about "surroundings": parentheses, brackets, quotes,
" XML tags, and more. The plugin provides mappings to easily delete, change
" and add such surroundings in pairs.
Plug 'tpope/vim-surround'
"===========================
Plug 'Yggdroot/indentLine'
let g:indentLine_color_term = 256
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"===========================
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'antoinemadec/coc-fzf'
"===========================
call plug#end()

"---------------------------
" setup catppuccin theme
let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha
colorscheme catppuccin

lua << EOF
require("catppuccin").setup()
EOF
"---------------------------
" setup treesitter
lua << EOF
require("nvim-treesitter.configs").setup({
    ensure_installed = { "rust", "go", "typescript" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    }
  }
)
EOF
"---------------------------
" used by coc-snippets
Plug 'honza/vim-snippets'
"---------------------------
" setup comment nvim
lua require('Comment').setup()
"---------------------------
" setup coc
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
"Use <TAB> to select the popup menu:
inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-K>"
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
nmap <silent> <leader>f  <Plug>(coc-fix-current)

nmap <silent> <leader>F  :call CocAction('format')<CR>

nmap <silent> <leader>R <Plug>(coc-rename)

xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" conflict with <C-i>
nnoremap <silent> <leader>E  :<C-u>CocFzfList diagnostics<cr>
nnoremap <silent> <leader>o  :<C-u>CocFzfList extensions<cr>
nnoremap <silent> <leader>C  :<C-u>CocFzfList commands<cr>
nnoremap <silent> <leader>S  :<C-u>CocFzfList outline<cr>
nnoremap <silent> <leader>s  :<C-u>CocFzfList -I symbols<cr>
" Resume latest coc list.
nnoremap <silent> <leader>P  :<C-u>CocFzfListResume<CR>
nmap <silent> <leader>ek <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ej <Plug>(coc-diagnostic-next)

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <s-Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
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
nmap <leader>ed :CocCommand explorer --preset .vim<CR>
nmap <leader>ef :CocCommand explorer --preset floating<CR>

" List all presets
nmap <leader>el :CocFzfList explPresets
" coc install extensions
call coc#add_extension('coc-snippets',
            \'coc-rust-analyzer',
            \'coc-explorer',
            \'coc-tabnine',
            \'coc-prettier',
            \'coc-eslint',
            \'coc-highlight',
            \'coc-pyright',
            \'coc-go',
            \'coc-tsserver',
            \'coc-spell-checker')
let g:NERDCreateDefaultMappings = 0
nmap <leader>cc <plug>NERDCommenterComment
nmap <leader>c<space> <plug>NERDCommenterToggle
nmap <leader>cb <plug>NERDCommenterSexy
