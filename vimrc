set wildignore=assets/**,app/assets/images/**,log/**,tmp/**,public/assets/**,public/course-data/**,public/system/**,public/api/v1/system/**,data/**,.DS_Store
let g:CommandTMaxFiles=80085
let g:buffergator_suppress_keymaps=1
set foldmethod=indent
set foldlevel=1

set nocompatible
colorscheme desert 
colorscheme darkspectrum

set autoindent
set ruler
set tabstop=2
set ignorecase
set number
set nobackup
set noswapfile
set clipboard=unnamed

filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

syntax on
filetype plugin indent on
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set hlsearch


let otl_map_tabs = 1
let otl_install_menu=1
let no_otl_maps=0
let no_otl_insert_maps=0

let mapleader=','

nnoremap ; :
noremap <leader>t :CommandT<CR>  
noremap <leader>sd :NERDTree<CR>
noremap <leader>sf :Sex<CR>
nmap <silent> ,/ :let @/=""<CR>

map <CA-Left> <C-w><Left>
map <CA-Right> <C-w><Right>
map <CA-Up> <C-w><Up>
map <CA-Down> <C-w><Down>

nnoremap <leader>wr <Plug>VimroomToggle

noremap <Leader>vm :RVmodel <CR>
noremap <Leader>vc :RVcontroller <CR> 
noremap <Leader>vv :RVview <CR>
noremap <Leader>vu :RVunittest <CR>
noremap <Leader>vM :RVmigration <CR>
noremap <Leader>vs :RVspec <CR>
noremap <Leader>rf :Rfind 
nnoremap <silent> <Leader>b :BuffergatorOpen<CR>
nnoremap <silent> <Leader>B :BuffergatorClose<CR>
nnoremap <silent> <Leader>tt :BuffergatorTabsOpen<CR>
nnoremap <silent> <Leader>TT :BuffergatorTabsClose<CR>

noremap <Leader>term :ConqueTerm zsh <CR>

" Strip trailing whitespace (,ss)
function! StripWhiteSpace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhiteSpace ()<CR>
au BufWrite *.rb,*.coffee :call StripWhiteSpace()
