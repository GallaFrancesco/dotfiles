set autoindent
set shell=bash
set incsearch
"set tabstop=2
set encoding=utf-8
set nocompatible              " be iMproved, required
set showcmd
set ruler
"filetype off                   " required
"set t_Co=256

syntax on
filetype indent plugin on
"colorscheme candycode
"colorscheme Vivid_Black
"set termguicolors
"set t_ut=
set background=dark
hi Normal ctermbg=none
hi NonText ctermbg=none
hi Comment ctermfg=darkblue

:command T :tabNext
:command TT :tabprevious
"inoremap kk <Esc>
"inoremap jj <Esc>
:noremap <Space>dd [{
:noremap <Space>dn ]}
:noremap AA GA
:noremap <S-Down> = ddjP
:noremap <S-Up> = ddkP
:command WQ wq
:command Wq wq
:command W w
:command Q q

" movement mappings for COLEMAK
"
" up
:noremap U k
" left
:noremap N h
" down
:noremap E j
" right
:noremap I l
" page down
:noremap L <C-b>
" page up
:noremap Y <C-f>
" matching bracket
:noremap B %

" permit switching buffer without saving
set hidden
" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
"set expandtab
set nu
" capitalize automatically after 93 chars
set tw=80

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'maralla/completor.vim'
Plugin 'shougo/deoplete.nvim'
Plugin 'zchee/deoplete-clang'
Plugin 'junegunn/limelight.vim'
Plugin 'clojure-vim/async-clj-omni'
"Plugin 'landaire/deoplete-d'
"Plugin 'idanarye/vim-dutyl'
Plugin 'ncm2/ncm2'
Plugin 'ncm2/ncm2-d'
Plugin 'roxma/nvim-yarp'
Plugin 'zchee/deoplete-jedi'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar' " requires 'emerge ctags'
Plugin 'gregsexton/gitv'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kovisoft/slimv'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'ervandew/supertab'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'jreybert/vimagit'
Plugin 'vim-airline/vim-airline'
Plugin 'markonm/traces.vim'

"Plugin 'SirVer/ultisnips'

"Plugin 'honza/vim-snippets'
Plugin 'tmux-plugins/vim-tmux'
"Plugin 'omnisharp/omnisharp-vim'
"Plugin 'junegunn/fzf'

"Plugin 'gko/vim-coloresque'

"Plugin 'FredKSchott/CoVim'
"Plugin 'vim-scripts/ClosePairs'

"Plugin 'rdnetto/YCM-Generator'
call vundle#end()            " required
filetype plugin on    " required

"to disable preview mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set runtimepath^=~/.vim/bundle/autoclose/autoclose.vim
set completeopt-=preview
let mapleader=" "
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let g:ycm_server_python_interpreter = '/usr/bin/python3'
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1

" Toggle tagbar on F8
" NOTE: tagbar requires ctags (emerge ctags)
"
nmap <F8> :TagbarToggle<CR><C-w>w
let NERDTreeQuitOnOpen=1

" Toggle limelight 
nmap <F7> :Limelight<CR>
nmap <F9> :Limelight!<CR>
" completer settings
let g:completor_python_binary = '/usr/bin/python'
let g:completor_clang_binary = '/usr/bin/clang'

"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

" mappings for arrow keys in urxvt insert mode
imap <ESC>oA <ESC>ki
imap <ESC>oB <ESC>ji
imap <ESC>oC <ESC>li
imap <ESC>oD <ESC>hi


" lisp autoindent completion
au BufNewFile,BufRead,BufReadPost *.rkt,*.rktl,*.rktd set filetype=schem
autocmd filetype lisp,scheme,art setlocal equalprg=/home/francesco/.vim/scmindent.rkt
" java completion
autocmd FileType java setlocal omnifunc=javacomplete#Complete
"let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'


" for vim-fireplace dinamic evaluation of Clojure code
map <leader>e :Eval<CR>

" This is a very minimal example that shows how to compile and run a
" single Java test file from you Vim session
" A quick explaination:
"    map: map statements tell Vim to associated certain key strokes with
"         actions.
"    <leader>jc (leader is usually just a comma, but you can
"         define it as you like) now maps to command :!javac %<CR>
"    :!javac %<CR>
"         '!' gets you into the system command line,
"         'javac' is the standard Java compiler,
"         '%' is the current filename (Test.java)
"         ':r' gets the filename without the extension (in the second line)
"         '<CR>' tells Vim to go ahead and enter the command (carriage return)
map <leader>jjc :!javac %<CR>
map <leader>jjj :!java %:r

nnoremap <f3> :bdelete!<cr>
" Unittest in D
function! DTest()
    new
    :terminal dub test
    ":wincmd w
endfunction

autocmd FileType d nnoremap <f2> :call DTest()<cr>
" D requires dcd config
"
" dcd server start (dutyl)
"autocmd filetype d :DUDCDstartServer
"autocmd filetype d :TagbarToggle
"let g:dutyl_stdImportPaths=['/usr/include/dlang/dmd']
"call dutyl#register#tool('dcd-client','/usr/bin/dcd-client')
"call dutyl#register#tool('dcd-server','/usr/bin/dcd-server')
"let g:deoplete#sources#d#dcd_client_binary = '/usr/bin/dcd-client'
"let g:deoplete#sources#d#dcd_server_binary = '/usr/bin/dcd-server'
"let g:deoplete#sources#d#dcd_server_autostart = 1
" enable ncm2 for all buffers and set completeopt
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone

map <leader>ddc :!dmd %<CR>
map <leader>ddd :!./%:r

" cycle through buffer
nnoremap , :bnext<CR>
nnoremap ; :

" fold code block
map <leader>b zfa{<CR>
" NERDtree config
nnoremap <leader>f :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Limelight colors
" Color name (:help cterm-colors) or ANSI code
"let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" allow repeating command on each selected line
vnoremap . :normal .<CR>

" hide tmux window when opening nvim and open it back when exiting it
"autocmd VimEnter,VimLeave * silent !tmux set status
"
"
"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_symbols_ascii = 1
let g:airline_section_b = '%{fugitive#head()}'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z ="%3l/%L:%2v"
let g:airline_section_error = ''
let g:airline_section_warning = ''
