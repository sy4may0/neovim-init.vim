" Install dein.vim
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/dein')
  call dein#begin('~/.config/nvim/dein')

  call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  "Plugins.
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/denite.nvim')

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

colorscheme molokai
syntax on

set formatoptions=tcroq 

set fenc=utf-8
set nobackup
set noswapfile
set autoread
set wrap

set number
set cursorline
set cursorcolumn
set virtualedit=onemore
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest

set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

let mapleader = "\<Space>"
nmap <Leader>w [window]
nmap <Leader>d [denite]

" Insert escape change
inoremap <silent> jj <ESC>


nnoremap [window]h <C-w>h
nnoremap [window]j <C-w>j
nnoremap [window]k <C-w>k
nnoremap [window]l <C-w>l

nnoremap <silent> [denite]f :<C-u>Denite file<CR>
nnoremap <silent> [denite]a :<C-u>Denite file/rec<CR>
nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>
autocmd FileType denite call s:denite_my_settings()

function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> hs
  \ denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> vs
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> t
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
