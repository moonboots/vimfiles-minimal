" Adapted from https://github.com/akitaonrails/vimfiles 

"necessary on some Linux distros for pathogen to properly load bundles
filetype off

runtime available-bundles/vim-unbundle/unbundle.vim

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"set number      "add line numbers

"let mapleader=","
let mapleader=" "

"disable visual bell
set visualbell t_vb=

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

au BufNewFile,BufRead *.java set shiftwidth=4 | set softtabstop=4

"load ftplugins and indent files
silent! nnoremap <silent> <Leader>p :NERDTreeToggle<CR>
"nnoremap <silent> <C-f> :call FindInNERDTree()<CR> 

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"map to bufexplorer
nnoremap <leader>b :BufExplorer<cr>

"map to CommandT TextMate style finder
"nnoremap <leader>t :CommandT<CR

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,*.class,.git,*.swp,*.log "stuff to ignore when tab completing
"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

" Deprecated, shift+r already does this
" Search and replace highlighted text
"vnoremap <C-r> "hy:%s/\<<C-r>h\>//gc<left><left><left>

"Command-T configuration
let g:CommandTMaxHeight=10
let g:CommandTMatchWindowAtTop=0


set hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Control+Space to escape
noremap <C-Space> <Esc>
nnoremap <C-Space> <Esc>
vnoremap <C-Space> <Esc>
inoremap <C-Space> <Esc>
onoremap <C-Space> <Esc>
cnoremap <C-Space> <Esc>

" Ctrl-space does different things on different platforms, so we need to kill
" this behavior. See
" http://vim.1045645.n5.nabble.com/problem-mapping-Ctrl-Space-td1155234.html
" http://www.shallowsky.com/blog/linux/editors/vim-ctrl-space.html
noremap <Nul> <Esc>
inoremap <Nul> <Esc>
vnoremap <Nul> <Esc>
cnoremap <Nul> <Esc>
nnoremap <Nul> <Esc>

" old habit
imap <c-s> <Esc>:w<CR>
map <c-s> :w<CR>

"set background=light
set t_Co=256
set bg=dark

set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme ir_dark.256
"colorscheme mustang

"turn on syntax highlighting
syntax on

"load ftplugins and indent files
filetype plugin indent on

" Settings for VimClojure
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1

" hacks for specific file types, TODO organize into bundles
autocmd FileType clojure,lisp :AutoCloseOff
autocmd FileType java set tabstop=4 shiftwidth=4 softtabstop=0 smarttab noexpandtab
au BufRead,BufNewFile *.sf set filetype=java

" in vimdiff, press du to undo
nnoremap du :wincmd w<cr>:normal u<cr>:wincmd w<cr>

set nowrap

"let loaded_matchparen = 1

"so ~/.vim/private/databases

let g:dbext_default_ORA_cmd_header           = 
                        \ "set pagesize 10000\n" .
                        \ "set linesize 32767\n" .
                        \ "set wrap off\n" .
                        \ "set sqlprompt \"\"\n" .
                        \ "set flush off\n" .
                        \ "set colsep \"  \"\n" .
                        \ "set tab off\n\n"
" testing out vimdiff shortcuts
"map <Up> [c
"map <Down> ]c
"map <Left> <C-w>h
"map <Right> <C-w>l
"map <Enter> diffput

" http://vim.wikia.com/wiki/Easy_edit_of_files_in_the_same_directory
cabbr <expr> %% expand('%:p:h')

" dbext connections
"let g:dbext_default_profile_mysql = 'type=MYSQL:user=jack:passwd=:dbname=heritage_health:host=ubuntu-server'

" http://vimeo.com/6329762
" dollar sign is change-word delimiter
"set cpoptions+=$
"set virtualedit+=all

" don't warn about unsaved buffer
set hidden

" Pressing 'jk' simultaneously escapes
" http://mattsa.posterous.com/vim-arpeggio
" Fucking genius
" Could have been more aptly named vim-chord
call arpeggio#map('i', '', 0, 'jk', '<Esc>')

"let g:tag_path = system('git rev-parse --show-toplevel') . '.git/tags'
"let g:ctrlp_map = '<alt-p>'

" Default conflicts with yank ring
noremap <silent> <leader>t :CtrlP<CR>
let g:ctrlp_working_path_mode = 0
"let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*' " MacOSX/Linux
"let g:ctrlp_mruf_exclude = '.*\.class'

"nmap ; :

autocmd FileType java set autoindent | set si | set shiftwidth=4 | set cinoptions+=j1
autocmd FileType scala set autoindent | set si | set shiftwidth=2 | set cinoptions+=j1

au BufRead,BufNewFile *.less setfiletype less

nnoremap <F9> :set paste!<BAR>:set paste?<CR>

"noremap <F6> :w <BAR> :silent execute "!tmux send-key -t resume:3.1 'xelatex -halt-on-error resume.tex' C-m" <BAR> redraw! <CR>
"call arpeggio#map('nv', '', 0, 'jl', ':w <BAR> :silent execute "!tmux send-key -t resume:3.1 \"xelatex -halt-on-error resume.tex\" C-m" <BAR> redraw! <CR>')

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

set rnu

" Light
"hi CursorLine ctermbg=221 cterm=none

hi CursorLine term=NONE cterm=NONE ctermbg=88

au InsertEnter * set cursorline
au InsertLeave * set nocursorline

set ignorecase
set smartcase

map <leader>v :tabedit $MYVIMRC<CR>
map <leader>s :source $MYVIMRC<CR>

" Lock working directory in this project so ctrlp always searches correct
" scope
autocmd BufNewFile,BufRead /home/jack/code/js/flashcards-complete/* cd /home/jack/code/js/flashcards-complete

nnoremap <silent> <leader>yr :YRShow<CR> 

" Show letter prefix for lusty juggler
let g:LustyJugglerShowKeys = 'a'
