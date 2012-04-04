" Adapted from https://github.com/akitaonrails/vimfiles 

filetype on

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
" set autoindent

au BufRead,BufNewFile *.md set filetype=markdown

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
set wildignore+=*/node_modules/*,*.jar,*.class
"set wildignore+=*/node_modules/*,*.jar,*.class,*/dist-dev/*.js
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
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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
"let vimclojure#HighlightBuiltins=1
"let vimclojure#HighlightContrib=1
"let vimclojure#DynamicHighlighting=1
"let vimclojure#ParenRainbow=1

" hacks for specific file types, TODO organize into bundles
"autocmd FileType clojure,lisp :AutoCloseOff
" smart frog
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

" http://vim.wikia.com/wiki/Easy_edit_of_files_in_the_same_directory
cabbr <expr> %% expand('%:p:h')

" don't warn about unsaved buffer
set hidden

" Pressing 'jk' simultaneously escapes
" http://mattsa.posterous.com/vim-arpeggio
" call arpeggio#map('ivn', '', 0, 'jk', '<Esc>')

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

"noremap <leader>v :tabedit $MYVIMRC<CR>
nnoremap <leader>s :source $MYVIMRC<CR>
nnoremap <leader>e :vsplit $MYVIMRC<cr>

" Lock working directory in this project so ctrlp always searches correct
" scope
autocmd BufNewFile,BufRead /home/jack/code/js/flashcards-complete/* cd /home/jack/code/js/flashcards-complete

nnoremap <silent> <leader>yr :YRShow<CR> 
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

"let vimclojure#NailgunClient = '/home/jack/code3/vimclojure/client/ng'
"let vimclojure#WantNailgun = 0
"let vimclojure#HighlightBuiltins=1
"let vimclojure#HighlightContrib=1
"let vimclojure#DynamicHighlighting=1
"let vimclojure#ParenRainbow=1
"let vimclojure#SplitPos = "right"

au BufRead,BufNewFile */nginx/conf/* set ft=nginx | set smartindent
au BufRead,BufNewFile *.handlebars set ft=mustache
au BufRead,BufNewFile *.lua set ft=lua
au BufRead,BufNewFile *.do set ft=sh
au BufRead,BufNewFile *.less set ft=less
set ts=2

"let g:ackprg="ack --color --ignore-dir=node_modules"
let g:ackprg="ack -H --type-add less=.less --nocolor --nogroup --column --ignore-dir=node_modules --ignore-dir=dist --ignore-dir=google-code-prettify --ignore-dir=r.js"

let Grep_Default_Options = '-I'
let Grep_Skip_Dirs = '.git' 

" let javascript_fold=1
" function! JavaScriptFold() 
"     setl foldmethod=syntax
"     setl foldlevelstart=1
"     syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

"     function! FoldText()
"         return substitute(getline(v:foldstart), '{.*', '{...}', '')
"     endfunction
"     setl foldtext=FoldText()
" endfunction
" au FileType javascript call JavaScriptFold()
" au FileType javascript setl fen
" set foldmethod=syntax
" set foldlevelstart=1
" let javaScript_fold=1 
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" inoremap {<CR> {<CR>}<Esc>O
nnoremap <Leader>j ddkP
nnoremap <Leader>k ddp

" change cursor color depending on content
" colors from http://mkaz.com/solog/system/xterm-colors.html
" hack for tmux from https://gist.github.com/1195581
" reset is not working, will leave cursor colored
" let insert_color = 'firebrick'
" let regular_color = 'chartreuse3'
" if exists('$TMUX')
"   let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]12;".insert_color."\x7\<Esc>\\"
"   let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]12;".regular_color."\x7\<Esc>\\"
" else
"   let &t_SI = "\<Esc>]12;".insert_color."\x7"
"   let &t_EI = "\<Esc>]12;".regular_color."\x7"
"   " autocmd VimLeave * silent !echo -ne "\033]00m" 
" endif

set noesckeys

" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=2
set nofoldenable
