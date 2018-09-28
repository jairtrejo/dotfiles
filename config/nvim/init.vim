" Plugins
call plug#begin('~/.vim/plugged')
Plug 'b4winckler/vim-objc'
Plug 'benmills/vimux'
Plug 'cakebaker/scss-syntax.vim'
Plug 'cohama/lexima.vim'
Plug 'derekwyatt/vim-scala'
Plug 'gavocanov/vim-js-indent'
Plug 'jimmyhchan/dustjs.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'mhartington/oceanic-next'
Plug 'michaeljsmith/vim-indent-object'
Plug 'motus/pig.vim'
Plug 'mxw/vim-jsx'
Plug 'neomake/neomake'
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'rschmukler/pangloss-vim-indent'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/django.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'mhinz/vim-grepper'
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
if (has("termguicolors"))
    set termguicolors
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
endif
set background=dark
colorscheme deep-space
let g:airline_theme='deep_space'

"
" Wildmenu
"
set wildmode=list:full
set wildmenu
set wildignore+=*.pyc
set wildignore+=migrations
set wildignore+=env,virtualenv
set wildignore+=htmlcov
set wildignore+=node_modules,bower_components,build,public,payments-frontend/public
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.png,*.gif
set wildignore+=TwitterKit.framework,TwitterCore.framework
set wildignore+=.idea

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
" Language specific
"
" JavaScript
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd FileType javascript.jsx,javascript setlocal formatprg=prettier\ --stdin\ --parser\ babylon

"
" Plugin specific
"
" Grepper
nnoremap <leader>aa :GrepperRg<space>
nnoremap <leader>as :GrepperRg<space>-g<space>'*.css'<space>-g<space>'*.scss'<space>-g<space>'*.less'<space>
nnoremap <leader>aj :GrepperRg<space>-tjs<space>
nnoremap <leader>ap :GrepperRg<space>-tscala<space>-tpy<space>-tjava<space>
nnoremap <leader>at :GrepperRg<space>-g<space>'*.tl'<space>-g<space>'*.jsp'<space>

" fzf
nnoremap <leader>t :FZF<enter>
let $FZF_DEFAULT_COMMAND= 'rg --files --follow'

" Mapping for vimux
nnoremap <leader>p :VimuxPromptCommand<CR>
nnoremap <leader><leader> :VimuxRunLastCommand<CR>
" Neomake
autocmd! BufWritePost * Neomake
autocmd! VimLeave *.js  !eslint_d stop
let g:neomake_javascript_enabled_makers = ['eslint_d']
let g:neomake_jsx_enabled_makers = ['eslint_d']
let g:neomake_error_sign = {'texthl': 'Error', 'text': '✕ '}

set autoread
au User NeomakeFinished checktime
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
