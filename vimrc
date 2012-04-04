" Adapted from https://github.com/akitaonrails/vimfiles 

filetype on

runtime available-bundles/vim-unbundle/unbundle.vim

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

let mapleader=" "

"disable visual bell
set visualbell t_vb=

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab

au BufRead,BufNewFile *.md set filetype=markdown

"load ftplugins and indent files
silent! nnoremap <silent> <Leader>p :NERDTreeToggle<CR>

set hlsearch
"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"map to bufexplorer
nnoremap <leader>b :BufExplorer<cr>

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,*.class,.git,*.swp,*.log "stuff to ignore when tab completing
set wildignore+=*/node_modules/*,*.jar,*.class

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

" Deprecated, shift+r already does this
" Search and replace highlighted text
"vnoremap <C-r> "hy:%s/\<<C-r>h\>//gc<left><left><left>

"Command-T configuration
let g:CommandTMaxHeight=10
let g:CommandTMatchWindowAtTop=0

"set background=light
set t_Co=256
set bg=dark

set background=dark
colorscheme ir_dark.256

"turn on syntax highlighting
syntax on

"load ftplugins and indent files
filetype plugin indent on

"autocmd FileType clojure,lisp :AutoCloseOff
" smart frog
au BufRead,BufNewFile *.sf set filetype=java

" in vimdiff, press du to undo
nnoremap du :wincmd w<cr>:normal u<cr>:wincmd w<cr>

set nowrap

" http://vim.wikia.com/wiki/Easy_edit_of_files_in_the_same_directory
cabbr <expr> %% expand('%:p:h')

" don't warn about unsaved buffer
set hidden

" Default conflicts with yank ring
noremap <silent> <leader>t :CtrlP<CR>
let g:ctrlp_working_path_mode = 0

autocmd FileType scala set autoindent | set si | set shiftwidth=2 | set cinoptions+=j1

au BufRead,BufNewFile *.rl setfiletype ragel

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

hi CursorLine term=NONE cterm=NONE ctermbg=88

au InsertEnter * set cursorline
au InsertLeave * set nocursorline

set ignorecase
set smartcase

nnoremap <leader>s :source $MYVIMRC<CR>
nnoremap <leader>e :vsplit $MYVIMRC<cr>

" ultisnips
noremap <Leader>u :UltiSnipsEdit<CR>
let g:UltiSnipsSnippetsDir="~/.vim/myultisnips"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSpli="vertical"
let g:UltiSnipsSnippetDirectories=["myultisnips"]

" Leaving this on causes "no such mapping" exceptions
let g:UltiSnipsRemoveSelectModeMappings = 0

" vim commentary
autocmd FileType snippets set commentstring=#\ %s
autocmd FileType nginx set commentstring=#\ %s | set smartindent
autocmd FileType mustache set commentstring={{!\ %s\ }}
autocmd FileType less set commentstring=//\ %s
autocmd FileType tex set commentstring=%\ %s
autocmd FileType erlang set commentstring=%%\ %s
autocmd FileType lua set commentstring=--\ %s
autocmd FileType lisp set commentstring=;\ %s
autocmd FileType xdefaults set commentstring=!\ %s

" Show letter prefix for lusty juggler
let g:LustyJugglerShowKeys = 'a'

au BufRead,BufNewFile */nginx/conf/* set ft=nginx | set smartindent
au BufRead,BufNewFile *.handlebars set ft=mustache
au BufRead,BufNewFile *.lua set ft=lua
au BufRead,BufNewFile *.do set ft=sh
au BufRead,BufNewFile *.less set ft=less
set ts=2

let g:ackprg="ack -H --type-add less=.less --nocolor --nogroup --column --ignore-dir=node_modules --ignore-dir=dist --ignore-dir=google-code-prettify --ignore-dir=r.js"

autocmd BufNewFile,BufRead /home/jack/code/programmer-typing/* source /home/jack/code/programmer-typing/project-vimrc

let Grep_Default_Options = '-I'
let Grep_Skip_Dirs = '.git' 

let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" inoremap {<CR> {<CR>}<Esc>O
nnoremap <Leader>j ddkP
nnoremap <Leader>k ddp

set noesckeys

" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=2
set nofoldenable
