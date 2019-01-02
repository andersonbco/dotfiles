execute pathogen#infect()
syntax on
filetype plugin indent on

let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore', '.gitignore']
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

set number
set tabstop=2
set autoindent
set noshowmode

:inoremap jj <Esc>
