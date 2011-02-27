" Adapted from https://github.com/akitaonrails/vimfiles 

"necessary on some Linux distros for pathogen to properly load bundles
filetype off

"load pathogen managed plugins
call pathogen#runtime_append_all_bundles()

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

set number      "add line numbers

let mapleader=","

"disable visual bell
set visualbell t_vb=

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :call FindInNERDTree()<CR> 

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
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"Command-T configuration
let g:CommandTMaxHeight=10
let g:CommandTMatchWindowAtTop=0


set hlsearch
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" to make highlighting feel more intuitive
set selection=exclusive

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
