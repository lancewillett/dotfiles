set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set nowrap
set ruler
syntax enable
filetype indent on
set number

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" solarized options
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
set gfn=Monaco:h12
set background=dark
