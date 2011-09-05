" Adapted from https://github.com/akitaonrails/vimfiles 

"necessary on some Linux distros for pathogen to properly load bundles
filetype off

let g:pathogen_disabled = []
"call add(g:pathogen_disabled, 'nerdtree')
"call add(g:pathogen_disabled, 'Command-T')
"call add(g:pathogen_disabled, 'dbext')
call add(g:pathogen_disabled, 'vimroom')
call add(g:pathogen_disabled, 'lusty')
call add(g:pathogen_disabled, 'rainbow-parentheses-bundle')
call add(g:pathogen_disabled, 'csapprox')
call add(g:pathogen_disabled, 'fakeclip')
call add(g:pathogen_disabled, 'javascript')
call add(g:pathogen_disabled, 'speeddating')
call add(g:pathogen_disabled, 'vimroom')
call add(g:pathogen_disabled, 'xmledit')

"load pathogen managed plugins
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"set number      "add line numbers

let mapleader=","

"disable visual bell
set visualbell t_vb=

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

au BufNewFile,BufRead *.java set shiftwidth=4 | set softtabstop=4

"load ftplugins and indent files
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
"nnoremap <silent> <C-f> :call FindInNERDTree()<CR> 

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"map to bufexplorer
nnoremap <leader>b :BufExplorer<cr>

"map to CommandT TextMate style finder
"nnoremap <leader>t :CommandT<CR

set bg=dark

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,*.class,.git "stuff to ignore when tab completing

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

" Deprecated, shift+r already does this
" Search and replace highlighted text
vnoremap <C-r> "hy:%s/\<<C-r>h\>//gc<left><left><left>

"Command-T configuration
let g:CommandTMaxHeight=10
let g:CommandTMatchWindowAtTop=0


set hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Control+Space to escape
map <C-Space> <Esc>
nmap <C-Space> <Esc>
vmap <C-Space> <Esc>
imap <C-Space> <Esc>
omap <C-Space> <Esc>
cmap <C-Space> <Esc>

" Ctrl-space does different things on different platforms, so we need to kill
" this behavior. See
" http://vim.1045645.n5.nabble.com/problem-mapping-Ctrl-Space-td1155234.html
" http://www.shallowsky.com/blog/linux/editors/vim-ctrl-space.html
imap <Nul> <Esc>
map <Nul> <Esc>
vmap <Nul> <Esc>
cmap <Nul> <Esc>
nmap <Nul> <Esc>

" old habit
imap <c-s> <Esc>:w<CR>
map <c-s> :w<CR>

set t_Co=256
colorscheme ir_dark

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
nmap du :wincmd w<cr>:normal u<cr>:wincmd w<cr>

set nowrap

let loaded_matchparen = 1

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
set cpoptions+=$
set virtualedit+=all

" don't warn about unsaved buffer
set hidden

" Pressing 'jk' simultaneously escapes
" http://mattsa.posterous.com/vim-arpeggio
" Fucking genius
" Could have been more aptly named vim-chord
call arpeggio#map('i', '', 0, 'jk', '<Esc>')
