call plug#begin(stdpath('data') . '/plugged')

" File navigation
Plug 'airblade/vim-rooter'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Quality of life
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'mg979/vim-visual-multi'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Languages
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'plasticboy/vim-markdown'
Plug 'calviken/vim-gdscript3'
Plug 'dart-lang/dart-vim-plugin'

" Colorschemes
Plug 'rainglow/vim'

call plug#end()

let mapleader = " "

runtime ./plug-config/coc.vim

syntax on
syntax enable

let g:rehash256 = 1

if (empty($TMUX))
    if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif

    if (has("termguicolors"))
        set termguicolors
    endif
endif

colorscheme bold-contrast
set background=dark

set cursorline
set t_Co=256
set noerrorbells
set guifont=Operator\ Mono\ Book:h12
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab
set scrolloff=10
set wrap
set smartcase
set nobackup
set undodir=~/.vim/undodir
set undofile
set noswapfile
set incsearch
set noshowmode
set nohlsearch
set hidden
set splitright
set splitbelow
set backspace=indent,eol,start
set mouse=a
set nu
set relativenumber
set updatetime=50
set shortmess+=c
set showmatch

" Do not allow for recordings
map q <Nop>

" Remap the navigation between splits
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <A-2> :vsplit<CR>

" Remap ctrl-backspace to delete the word
imap <C-bs> <C-w>

" Remap ctrl-z to undo
imap <C-z> <C-o>u
nmap <C-z> u

" Remap ctrl-s to save the current file
imap <C-s> <C-o>:w<CR>
nmap <C-s> :w<CR>

" FZF Settings
imap <C-p> <C-o>:GitFiles<CR>
nmap <C-p> :GitFiles<CR>

" Pasting
nnoremap <C-v> "+p

" NERDTree
imap <A-1> <C-o>:NERDTree<CR>
nmap <A-1> :NERDTreeToggle<CR><C-w>=

" Lightline stuff
let g:lightline = { 'component_function': {'filename': 'FilenameForLightline'} }

function! FilenameForLightline()
        return expand('%')
endfunction

" Neovide stuff
let g:neovide_cursor_animation_length=0.0

" Rust settings
let g:rustfmt_autosave = 1

" CoC Flutter
nmap <F2> :CocCommand flutter.dev.openDevLog<cr>
nmap <F5> :CocCommand flutter.run --flavor beta<cr>

" autocmd VimEnter * GuiPopupmenu 0

" Markdown
let g:vim_markdown_folding_disabled = 1
