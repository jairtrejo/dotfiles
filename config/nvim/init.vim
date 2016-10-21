" Plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-vinegar'
Plug 'benmills/vimux'
Plug 'mileszs/ack.vim'
Plug 'neomake/neomake'
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'rschmukler/pangloss-vim-indent'
Plug 'mxw/vim-jsx'
Plug 'gavocanov/vim-js-indent'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'mhartington/oceanic-next'
Plug 'cohama/lexima.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'michaeljsmith/vim-indent-object'
Plug 'b4winckler/vim-objc'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/django.vim'
call plug#end()

"
" Basic configuration
"
" Default encoding
set encoding=utf-8
" Window title changes to the file I'm editing
set title
" No backups are stored (I save all the time).
set nobackup
" No swap files are written, they tend to litter my projects
set noswapfile
" Relative line numbers (LN is displayed on the status bar)
set relativenumber
" Change to absolute line numbers when vim loses focus.
:au FocusLost * :set number
:au FocusGained * :set relativenumber
" Extraneous whitespace is displayed with special chars.
set list
set listchars=tab:▸\ ,trail:.,eol:\ ,nbsp:.
" Highlight column 80.
set cc=80
" Show a nice 'enter' char on wrapping lines.
set showbreak=↪
" Save on focus lost
au FocusLost * :wa
" Nice vsplit separator
set fillchars+=vert:│
" Show matched parentheses
set showmatch
" Four space tabs
set et
set sw=4
set smarttab
" Line Return
" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END
" Scrolling
set scrolloff=3
" Status line always visible
set laststatus=2
" Mouse support
set mouse=a
" Color scheme
set background=dark
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
if (has("termguicolors"))
    set termguicolors
endif

"
" Wildmenu
"
set wildmode=list:full
set wildmenu
set wildignore+=*.pyc
set wildignore+=migrations
set wildignore+=env,virtualenv
set wildignore+=htmlcov
set wildignore+=node_modules,bower_components,build
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.png,*.gif
set wildignore+=TwitterKit.framework,TwitterCore.framework

"
" Search
"
" Sane regexes
nnoremap / /\v
vnoremap / /\v
" Case sensitive search, but ignores capitalization if whole search
" term uses the same case.
set ignorecase
set smartcase
" Incremental search
set incsearch
" Keep search matches in the middle of the window and pulse the line
" when moving to them.
nnoremap n nzzzv
nnoremap N Nzzzv
" highlight search ocurrences
set hlsearch
" De-highligt with Ctr+L
nnoremap <silent> <C-l> :nohl<CR><C-l>

"
" Remaps
"
" Leader key remap
let mapleader = ";"
" Reselect text that was just pasted
map ,v V`]
" Mappings for jumping to the begginning/end of a line
noremap H ^
noremap L g_
" D deletes to the end of the line.
nnoremap D d$
" j,k moves between 'screen lines' not 'file lines'.
noremap j gj
noremap k gk
noremap <Up> gk
noremap <Down> gj
" Easier use of tabs.
map <silent><Right> :tabnext<CR>
map <silent><Left> :tabprevious<CR>
map <silent><Up> :tabnew<CR>
map <silent><Down> :tabclose<CR>
" Disentangle the screen connundrum (stolen from Steve Losh):
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>
" Remapping of ` and ' for easy '.
nnoremap ' `
nnoremap ` '
" Quickfix and location list navigation
map ]l :lnext<CR>
map [l :lprev<CR>
map ]q :cnext<CR>
map [q :cprev<CR>

"
" Plugin specific
"
" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <leader>a :Ack<space>
" fzf
nnoremap <leader>t :FZF<enter>
" Mapping for vimux
nnoremap <leader>p :VimuxPromptCommand<CR>
nnoremap <leader><leader> :VimuxRunLastCommand<CR>
" Neomake
autocmd! BufWritePost * Neomake
autocmd! VimLeave *.js  !eslint_d stop
let g:neomake_javascript_enabled_makers = ['eslint_d']
let g:neomake_jsx_enabled_makers = ['eslint_d']
" vim-jsx
let g:jsx_ext_required = 0
" airline
let g:airline_powerline_fonts = 1

"
" Misc
"
" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END
" Trailing whitespace only shown when not in insert mode so I don't go insane.
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:.
    au InsertLeave * :set listchars+=trail:.
augroup END
