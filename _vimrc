" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'		" let Vundle manage Vundle, required

"---------------=== Languages support ===-------------
" --- Python ---
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1
Plugin 'vim-scripts/indentpython.vim'  " autoindent
Plugin 'vim-syntastic/syntastic'       " check your syntax on each save
"Plugin 'nvie/vim-flake8'               " pip install flake8   mb usless with syntastic
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'psf/black'                     " pip install black




"for win NEED ADD C:\Users\rfv\Appdata\Local\Programs\Python\Python38\Lib\site-packages to python.path


"+++++++++++ just theme +++++++++++++++++++++++++
Plugin 'jnurmine/Zenburn'        "
Plugin 'altercation/vim-colors-solarized'

"---------=== project navigation ===-------------
Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
Plugin 'Xuyuanp/nerdtree-git-plugin'    " work in git directory
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'   	    	" Lean & mean status/tabline for vim
Plugin 'kien/ctrlp.vim'      	        " supersearch

"+++++++++++ programming +++++++++++++++++++++++++
Plugin 'tpope/vim-fugitive'          	" Git commands
"Plugin 'rosenfeld/conque-term'      	" Consoles as buffers

"new for me
"Plugin 'majutsushi/tagbar'          	" Class/module browser
"Plugin 'fisadev/FixedTaskList.vim'  	" Pending tasks list
"Plugin 'tpope/vim-surround'	   	" Parentheses, brackets, quotes, XML tags, and more
"--------------=== Snippets support ===---------------
"Plugin 'garbas/vim-snipmate'		" Snippets manager
"Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
"Plugin 'tomtom/tlib_vim'		" dependencies #2
"Plugin 'honza/vim-snippets'		" snippets repo
"---------------=== Languages support ===-------------

" --- Python ---
"Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)

"Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
"Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim

"NOT WORK
"Bundle 'Valloric/YouCompleteMe'		
"Plugin 'davidhalter/jedi-vim' 		" Jedi-vim autocomplete plugin


" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red


au BufRead,BufNewFile *.py,*pyw set tabstop=4
au BufRead,BufNewFile *.py,*pyw set softtabstop=4
au BufRead,BufNewFile *.py,*pyw set autoindent

au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let python_highlight_all=1
syntax on

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set nu
set encoding=utf-8


set langmenu=en_US
let $LANG = 'en_US'


" GUI? устаналиваем тему и размер окна
  set lines=50 columns=125

" настройки Vim-Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

let $PYTHONHOME='C:\Users\rfv\AppData\Local\Programs\Python\Python38\python.exe'
"g = 'C:\Users\rfv\AppData\Local\Programs\Python\Python38\python.exe'

"=====================================================
" User hotkeys
"=====================================================
" NerdTree настройки
" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>
"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$'] 
autocmd vimenter * :NERDTreeToggle C:\Users\rfv\Desktop\Python\online-8-fedor-redechkin\exercises "Set working directory

" ConqueTerm
" запуск интерпретатора на F5
"работает
nnoremap <F5> ::w!<CR>:!python %<CR>
"nnoremap <F5> :!python %<CR>

"nnoremap <F5> :ConqueTermSplit python<CR>
"не работает
"nnoremap <F6> :exe "ConqueTermSplit python " . expand("%")
"nmap <F6> :execute 'ConqueTermSplit python '.expand('%:p')<CR>
"nnoremap <F6> :execute 'ConqueTermSplit python '.expand('%:p')<CR>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0


autocmd BufWritePre *.py execute ':Black'
nnoremap <F9> :Black<CR>
"nnoremap <F6> :!pytest expand(%:p:h:) . "tests\test_task_17_1.py"
nnoremap <F6> :!pytest<CR>

autocmd BufEnter * silent! lcd %:p:h "Set working directory to the current file

tab sball
set switchbuf=useopen


"autocmd BufWritePost *.py call flake8#Flake8()
"let g:flake8_show_quickfix=0  " don't show window


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" }    " To disable all style messages