"
" .vimrc
"
" Author: Jair Trejo <jair@jairtrejo.mx>
"

"
" Preamble
"
" Pathogen
call pathogen#infect()
" Not compatible with vi, cause it's 2012
set nocompatible
" Syntax coloring
syntax on
" Filetype specific plugins
filetype plugin on
" Indentation by filetype
filetype indent on

"
" Basic configuration
"
" Default encoding
set encoding=utf-8
" Mouse support
set mouse=a
" Backspace support
set backspace=indent,eol,start
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
" Force 256 colors
set t_Co=256
" I like dark backgrounds.
set background=dark
" My prefered colorschema
colorscheme solarized
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
" Command for editing over FTP.
let g:netrw_ftp_cmd="ftp -p"

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
" Wildmenu
"
set wildmode=list:full
set wildmenu
set wildignore+=*.pyc
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.png,*.gif

"
" Status line
"
" Show status line
set laststatus=2
" Powerline with fancy symbols.
let g:Powerline_symbols = 'fancy'

"
" Remaps
"
" Reselect text that was just pasted
map ,v V`]
" Select (charwise) the contents of the current line, excluding indentation.
nnoremap vv ^vg_
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
" Change case with Ctrl + U.
nnoremap <C-u> gUiw
inoremap <C-u> <esc>gUiwea
" Easier use of tabs.
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>
map <silent><A-Up> :tabnew<CR>
map <silent><A-Down> :tabclose<CR>
" Remap para easy-motion.
let g:EasyMotion_leader_key = ','
" NERDTree.
map <F3> :NERDTreeToggle<CR>
" Tagbar.
map <F4> :TagbarToggle<CR>
" Yankring
map <F6> :YRShow<CR>
" CtrlP
let g:ctrlp_map = '<leader>t'

"
" Omnicompletion.
"
inoremap <Nul> <C-x><C-o>
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

"
" Filetype specific
"

" PHP
" Syntax highlighting for SQL & HTML inside PHP strings.
let php_sql_query=1
let php_htmlInStrings=1

" Python
" Syntax highlighting
let python_highlight_all = 1
" Run current file through python interpreter.
map <F5> :!python %<CR>

" Django
" Commands for quickly setting django type.
nnoremap _dt :set ft=htmldjango<CR>
nnoremap _pd :set ft=python.django<CR>
" Set filetype when editing typical django files
au BufNewFile,BufRead admin.py     setlocal filetype=python.django
au BufNewFile,BufRead urls.py      setlocal filetype=python.django
au BufNewFile,BufRead models.py    setlocal filetype=python.django
au BufNewFile,BufRead views.py     setlocal filetype=python.django
au BufNewFile,BufRead settings.py  setlocal filetype=python.django
au BufNewFile,BufRead forms.py     setlocal filetype=python.django

" LaTeX
" For LaTeX files, doesn't try to break pasted lines, however long.
autocmd BufRead *\.tex,*\.txt,*\.mkd setlocal formatoptions=l
" For LaTeX files, breaks lines on breakat rather than
" the last char that fits on screen.
autocmd BufRead *\.tex,*\.txt,*\.mkd setlocal lbr

" Markdown
" Automatic > section continuations for Markdown.
autocmd BufRead *\.mkd,*\.md set ai formatoptions=tcroqn2 comments=n:&gt;

" Arduino
" Set filetype to arduino for pde files.
au BufNewFile,BufRead *.pde setf arduino

" Vagrant
" Set Vagrantfile's filetype to Ruby.
augroup ft_vagrant
    au!
    au BufRead,BufNewFile Vagrantfile set ft=ruby
augroup END

" GVim
" Font for gvim.
set guifont=Monaco\ for\ Powerline\ 11
" Removes unwanted interface elements from gvim.
set guioptions-=T
set guioptions-=m
set guioptions-=F

" Removes horrible ^ characters from the status line of active buffers.
set fillchars+=stl:\ ,stlnc:\ 

