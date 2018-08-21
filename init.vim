" dein.vim plugin directory.
let s:dein_dir = expand('~/.config/nvim/dein')

if &compatible
    set nocompatible
endif

" dein.vim
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim download.
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" dein.vim configure
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " Plugins toml files
    let g:rc_dir      = expand('~/.config/nvim/dein/rc')
    let s:toml        = g:rc_dir . '/dein.toml'
    let s:lazy_toml   = g:rc_dir . '/dein_lazy.toml'

    " Load and cache toml files.
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " Configure terminate.
    call dein#end()
    call dein#save_state()
endif

" dein new install.
if dein#check_install()
    call dein#install()
endif

" python_host
let g:python_host_prog = '/home/sy4may0/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/sy4may0/.pyenv/versions/neovim3/bin/python'

" Omni key as tab
function InsertTabWeapper()
    if pumvisible()
        return "\<C-n>"
    endif

    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k\|<\|/'
        return "\<Tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
        return "\<C-n>"
    else
        return "\<C-x>\<C-o>"
    endif
endfunction

inoremap <tab> <C-r>=InsertTabWeapper()<CR>

" Clipboard copy
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <ESC>[200~ XTermPasteBegin("")
endif

" Settings
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

" Insert escape change
inoremap <silent> jj <ESC>

" Returned line j and k
nnoremap j gj
nnoremap k gk

" Search
set ignorecase
set smartcase
nnoremap <silent> CC :<C-u>set nohlsearch!<CR>

" Denite.vim configure
nnoremap <silent> <Leader>f :<C-u>Denite file -highlight-mode-insert=Search<CR>
nnoremap <silent> <Leader>a :<C-u>Denite file_rec -mode=normal -highlight-mode-insert=Search<CR>
nnoremap <silent> <Leader>g :<C-u>Denite file_rec -mode=normal grep<CR>
nnoremap <silent> <Leader>c :<C-u>Denite file_mru -mode=normal -highlight-mode-insert=Search<CR>
nnoremap <silent> <Leader>b :<C-u>Denite buffer -highlight-mode-insert=Search<CR>
nnoremap <silent> <Leader>o :<C-u>Denite outline -mode=normal -highlight-mode-insert=Search<CR>
nnoremap <silent> <Leader>y :<C-u>Denite neoyank -mode=normal -highlight-mode-insert=Search<CR>

call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', 'q', '<denite:quit>', 'noremap')

call denite#custom#map('normal', 'vs', '<denite:do_action:vsplit>', 'noremap')
call denite#custom#map('normal', 's', '<denite:do_action:split>', 'noremap')
call denite#custom#map('normal', 't', '<denite:do_action:tabopen>', 'noremap')
call denite#custom#map('normal', 'p', '<denite:do_action:append>', 'noremap')

" deoplate
let g:deoplate#enable_at_startup = 1

" Tab change config
nnoremap gr gT
nnoremap WH <C-w>h
nnoremap WJ <C-w>j
nnoremap WK <C-w>k
nnoremap WL <C-w>l

" Winresizer configure
nnoremap <silent> <C-e> :WinResizerStartResize<CR>

" TweetVim
let g:tweetvim_display_source = 1
let g:tweetvim_include_rts = 1
let g:tweetvim_open_buffer_cmd = 'split!'

nnoremap <silent> TWT :<C-u>TweetVimCommandSay<CR>
nnoremap <silent> STL :<C-u>TweetVimHomeTimeline<CR>


" open-browser.vim
let g:netrw_nogx = 1
nnoremap gx <Plug>(openbrowser-smart-search)

" NERDTree
nnoremap <silent> NT :<C-u>NERDTree<CR>

" jedi-vim
autocmd FileType python setlocal completeopt-=preview


" previm
nnoremap <silent> <C-p> :PrevimOpen<CR>
let g:previm_open_cmd = 'firefox'

