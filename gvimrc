" No audible bell
set vb

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

set guifont=Meslo\ LG\ S\ for\ Powerline:h14

let g:molokai_original = 0
colorscheme molokai

" Local config
if filereadable($HOME . "/.gvimrc.local")
  source ~/.gvimrc.local
endif
