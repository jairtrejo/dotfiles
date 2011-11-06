"
" .vimrc
"
" Author: Jair Trejo <jair@jairtrejo.mx>
"

"
" Global configurations
"
" Basic stuff
set nocompatible
syntax on
filetype plugin on
set encoding=utf-8
set mouse=a
set number
set title
set nobackup
set noswapfile
" Save on focus lost
au FocusLost * :wa
" Wildmenu
set wildmode=longest:full
set wildmenu
set wildignore+=*.pyc
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc

" Colors
set t_Co=256
set background=dark
colorscheme Tomorrow-Night
set fillchars+=vert:│
" Font for gvim
set gfn =Monospace\ 12
" Indentation by filetype
if has("autocmd")
filetype indent on
endif
" Show matched parentheses
set showmatch
" Four space tabs
set et
set sw=4
set smarttab
" Status line
set laststatus=2        " A status line will be used to separate windows 
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P

" Case sensitive search, but ignores capitalization if whole search term uses the same case.
set ignorecase
set smartcase
" Incremental search
set incsearch
" highlight search ocurrences
set hlsearch
" De-highligt with Ctr+L
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Reselect text that was just pasted
map ,v V`]
" Mappings for jumping to the begginning/end of a line
noremap H ^
noremap L g_
" Easier use of tabs
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>
map <silent><A-Up> :tabnew<CR>
map <silent><A-Down> :tabclose<CR>
" Remap para easy-motion
let g:EasyMotion_leader_key = ','
" Scrolling
set scrolloff=3
" j,k moves between 'screen lines' not 'file lines'
noremap j gj
noremap k gk
noremap <Up> gk
noremap <Down> gj


" Command for editing over FTP
let g:netrw_ftp_cmd="ftp -p"
" NERDTree
map <F3> :NERDTreeToggle<CR>
" Tagbar
map <F4> :TagbarToggle<CR>
" Omnicompletion
inoremap <Nul> <C-x><C-o>
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

"
" PHP
"
" Syntax highlighting for SQL & HTML inside strings
let php_sql_query=1                                                                                        
let php_htmlInStrings=1

"
" Python
"
" Syntax highlighting
let python_highlight_all = 1
" Run current file
map <F5> :!python %<CR>

"
" Django
"
nnoremap _dt :set ft=htmldjango<CR>
nnoremap _pd :set ft=python.django<CR>
" Set filetype when editing typical django files
au BufNewFile,BufRead admin.py     setlocal filetype=python.django
au BufNewFile,BufRead urls.py      setlocal filetype=python.django
au BufNewFile,BufRead models.py    setlocal filetype=python.django
au BufNewFile,BufRead views.py     setlocal filetype=python.django
au BufNewFile,BufRead settings.py  setlocal filetype=python.django
au BufNewFile,BufRead forms.py     setlocal filetype=python.django

"
" LaTeX
"
" Doesn't try to break pasted lines, however long
autocmd BufRead *\.tex,*\.txt,*\.mkd setlocal formatoptions=l
" Breaking lines on breakat rather than the last char that fits on screen
autocmd BufRead *\.tex,*\.txt,*\.mkd setlocal lbr

"
" Markdown
" 
autocmd BufRead *\.mkd,*\.md set ft=mkd
autocmd BufRead *\.mkd,*\.md set ai formatoptions=tcroqn2 comments=n:&gt;

"
" Arduino
"
au BufNewFile,BufRead *.pde setf arduino

