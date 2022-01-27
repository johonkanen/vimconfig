set nocompatible              " be iMproved, required
filetype off                  " required
"needed for ycm
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=$VIM\vim80\bundle\Vundle.vim "C:\Programs\Vim\vim80\bundle\Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('$VIM\bundle')
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
 
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Add file tree
Plugin 'scrooloose/nerdtree.git'
" syntax checking
Plugin 'vim-syntastic/syntastic.git'
"the ycm needs further configuration
Plugin 'Valloric/YouCompleteMe.git'
"track ultisnippets 
Plugin 'SirVer/ultisnips'
"since snippets are separate from engine, here are snippets
Plugin 'honza/vim-snippets'
"supertab, does something ?!?
Plugin 'ervandew/supertab'
"very nice tabulation funcitionality, needs to be learned first
Plugin 'godlygeek/tabular'
"git plugin
Plugin 'tpope/vim-fugitive'
" change root directory
Plugin 'airblade/vim-rooter'
" easy commenting
" Plugin 'tpope/vim-commentary'
Plugin 'tomtom/tcomment_vim'
" camel/snake case motions
Plugin 'bkad/CamelCaseMotion'

" extended vim motions
Plugin 'easymotion/vim-easymotion'
" fuzzy finder
" Plugin 'junegunn/fzf'
"
Plugin 'airblade/vim-gitgutter'
"status bar
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"vhdl vim package
"Plugin 'suoto/vim-hdl'
"multi monitor support
" Plugin 'codeape2/vim-multiple-monitors'
" Plugin 'Xuyuanp/nerdtree-git-plugin'
" vim intendation guides
Plugin 'nathanaelkane/vim-indent-guides'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
let g:pymode_python = 'python3'
"
"==== remap C-movement in insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
" switch between tabs 
map <C-p> :tabp<CR>
map <C-n> :tabn<CR>
" map <C-e> :!explorer .<CR>

map <F2> :!start explorer /select,%:p
"grep current file
map <F3> :execute "vimgrep /" . expand("<cword>") . "/%" <Bar> cw<CR>
"grep current folder with current file extension
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j *." . expand("%:e") <Bar> cw<CR>
"grep current folder recursively with current file extension
map <F5> :execute "vimgrep /" . expand("<cword>") . "/j **/*." . expand("%:e") <Bar> cw<CR>
" easymotion mappings, 
map <C-w> :vs /select,%p/
map <s-w> \\w
map <s-e> \\e
map <s-b> \\ge
map <c-b> \\ge

"remap ctrl+movement keys to switch between splits in normal mode
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"set <space> for folding code from tab
nnoremap <space> za
"remap Tab in normal mode to apply supertab
nnoremap <s-Tab> :Tab 

" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" map <silent> ge <Plug>CamelCaseMotion_ge
" sunmap w
" sunmap b
" sunmap e
" sunmap ge


" ==== NERDTREE
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '\.DS_Store', '\.un', '\.*\~', '\.vcd', '\.cf', '\.xml', '\.ngc', '\.ncd', '\.ngd', '\.ngm', '\.xrpt', '\.lst', '\.xpi', '\.twx', '\.ptwx', '\.pad', '\.bld', '\.bit', '\.bin', '\.bgn', '\.lso', '.git']
"
" let NERDTreeIgnore = ['\.sw*$']

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
let g:NERDTreeWinSize=50
" toggle nerdtree with C-t
map <C-t> :NERDTreeFind<CR>
au VimEnter *  NERDTree

" ==== Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" add vhdl 2008 support to ghdl and nonstandard vhdl libraries
let g:syntastic_vhdl_ghdl_args = "--ieee=synopsys --std=08"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" ==== snippets
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"map C-s to edit ultisnips
map <C-s> :UltiSnipsEdit<CR>
"map own snippets directory
let g:UltiSnipsSnippetDirectories = [$VIM.'/Snippets']

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-b>', '<Up>']
let g:ycm_semantic_triggers =  { 'c' : ['->', '.', '::', 're!gl'], 'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s'], 'vhdl' : ['pro', 'sig', ':', '.']}
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '$VIM/.ycm_extra_conf.py'
let g:ycm_always_populate_location_list = 1
let g:ycm_open_loclist_on_ycm_diags = 1

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<s-space>"
let g:UltiSnipsJumpForwardTrigger = "<s-space>"
let g:UltiSnipsJumpBackwardTrigger = "<C-space>"

let g:SuperTabDefaultCompletionType = '<C-n>'
" let g:gitgutter_git_executable = 'C:\Programs\Git\bin\git.exe'     
"set the appropriate colorscheme
:colorscheme torte
"set hybrid relative numbering 
:set rnu
:set nu
:set wrap!

:set guifont=courier_new:h10

":set softtabstop=4
":set shiftwidth=4
:set softtabstop=0 expandtab shiftwidth=4 smarttab

:set lines=42 columns=110

:set tabstop=4
:set softtabstop=4


":winpos 600 200
"open splits to the right and down of active split
":set splitright
:set splitbelow


source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
"behave mswin"
" function! Rg(...)
"   let l:output = system("rg --vimgrep ".join(a:000, " "))
"   let l:list = split(l:output, "\n")
"   let l:ql = []
"   for l:item in l:list
"     let sit = split(l:item, ":")
"     call add(l:ql,
"         \ {"filename": sit[0], "lnum": sit[1], "col": sit[2], "text": sit[3]})
"   endfor
"   call setqflist(l:ql, 'r')
"   echo 'Rg results: '.len(l:ql)
" endfunction
" command! -nargs=* Rg call Rg(<q-args>)
 source $VIM/vimfunctions.vim
