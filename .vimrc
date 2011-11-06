" Modo no compatible con vi
set nocompatible
"Coloreado de sintaxis
syntax on

"Cargar plugins de ftplugin
filetype plugin on

" Paleta de colores para fondo oscuro (si usas fondo claro colocar light en lugar de dark)
" set background=dark
set t_Co=256
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
colorscheme Tomorrow-Night

" Indentacion segun el tipo de archivo detectado
if has("autocmd")
filetype indent on
endif

" Mostrar paréntesis que se emparejan
set showmatch

" Tabulador de 4 espacios
set et
set sw=4
set smarttab

" Mappings para ir al principio y al final de la línea
noremap H ^
noremap L g_

let python_highlight_all = 1

" Autocompleción
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Syntax highlighting de SQL y HTML en cadenas PHP
let php_sql_query=1                                                                                        
let php_htmlInStrings=1

inoremap <Nul> <C-x><C-o>

"Remaps para las pestañas
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>
map <silent><A-Up> :tabnew<CR>
map <silent><A-Down> :tabclose<CR>

"Status line
set laststatus=2        " A status line will be used to separate windows 
                        " 'laststatus' = 2  -> always a status line
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P

" comando para edición remota:
let g:netrw_ftp_cmd="ftp -p"

" highlight ocurrences
set hlsearch

" deseleccionar con Ctr+L
nnoremap <silent> <C-l> :nohl<CR><C-l>

" usar el mouse
set mouse=a

" cosillas para editar en LaTeX
autocmd BufRead *\.tex,*\.txt,*\.mkd setlocal formatoptions=l
autocmd BufRead *\.tex,*\.txt,*\.mkd setlocal lbr
autocmd BufRead *\.tex,*\.txt,*\.mkd map j gj
autocmd BufRead *\.tex,*\.txt,*\.mkd map k gk
autocmd BufRead *\.tex,*\.txt,*\.mkd map <Up> gk
autocmd BufRead *\.tex,*\.txt,*\.mkd map <Down> gj

autocmd BufRead *\.mkd set ft=mkd
autocmd BufRead *\.mkd set ai formatoptions=tcroqn2 comments=n:&gt;

" Números de línea
set number

" Ragtag
let g:ragtag_global_maps = 1
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Arduino
au BufNewFile,BufRead *.pde setf arduino

" Save on focus lost
au FocusLost * :wa

" Reselect text that was just pasted
map ,v V`]

" Búsqueda ignorando capitalización si el patrón está en minúsculas. 
set ignorecase
set smartcase

" Búsqueda incremental.
set incsearch

" El nombre del archivo es el título de la consola.
set title

" Odio estar borrando .swp's cuando se va la luz
set nobackup
set noswapfile

" Modo 'pegado' para pegar con formato original.
set pastetoggle=<F2>

" Prender y apagar NERDTree
map <F3> :NERDTreeToggle<CR>

" ctags
" Prender y apagar con F4
" map <F4> :TlistUpdate<CR>:TlistToggle<CR>
" let Tlist_GainFocus_On_ToggleOpen=1
" let Tlist_Use_SingleClick=1
" let Tlist_Show_One_File=1
"
map <F4> :TagbarToggle<CR>

map <F5> :!python %<CR>

" Fuente para gvim
set gfn =Monospace\ 12

" Remap para easy-motion
let g:EasyMotion_leader_key = ','

" Django
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

nnoremap _dt :set ft=htmldjango<CR>
nnoremap _pd :set ft=python.django<CR>

au BufNewFile,BufRead admin.py     setlocal filetype=python.django
au BufNewFile,BufRead urls.py      setlocal filetype=python.django
au BufNewFile,BufRead models.py    setlocal filetype=python.django
au BufNewFile,BufRead views.py     setlocal filetype=python.django
au BufNewFile,BufRead settings.py  setlocal filetype=python.django
au BufNewFile,BufRead forms.py     setlocal filetype=python.django
