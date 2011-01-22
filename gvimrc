colorscheme ir_dark
set guifont=Inconsolata\ Medium\ 8

"if has("gui_win32") || has("gui_win32s")
"	set guifont=Consolas:h12
"	set enc=utf-8
"endif

"hide scrollbars
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left scroll bar
set guioptions-=m  "remove menu bar

" Disable screen flashing
" http://vim.wikia.com/wiki/Disable_beeping
set noerrorbells
set visualbell
set t_vb=
