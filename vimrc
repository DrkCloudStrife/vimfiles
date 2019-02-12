set wildignore=*/app/assets/images/*,*/log/*,*/tmp/*,*/public/assets/*,*/public/course-data/*,*/public/system/*,*/public/api/v1/system/*,*/data/course-data/*,*/data/shared/*,.DS_Store
set wildignore+=*.png,*.jpg,*.gif,*.jpeg
let g:CommandTMaxFiles=80085
let g:buffergator_suppress_keymaps=1
let g:ack_default_options = " -s -H --nocolor --nogroup --column --ignore-dir=data --ignore-dir=log --ignore-dir=tmp"
set foldmethod=indent
set foldlevel=1

set nocompatible
set nowrap
set guifont=Anonymous\ Pro:h18
colorscheme darkZ

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
nnoremap <silent> <Leader>bt :BuffergatorTabsOpen<CR>
nnoremap <silent> <Leader>BT :BuffergatorTabsClose<CR>

" Strip trailing whitespace (,ss)
function! StripWhiteSpace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhiteSpace ()<CR>
au BufWrite *.rb,*.coffee,*.scss :call StripWhiteSpace()

" Pretty XML
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" Pretty JSON
function! DoPrettyJSON()
  silent %!python2.7 -m json.tool
endfunction
command! PrettyJSON call DoPrettyJSON()

" Pretty CSS
command! PrettyCSS :%s/[{;}]/&\r/g|norm! =gg
