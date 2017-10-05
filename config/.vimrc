" ============================================================================================"
" Joseph98 Vim Backup

" ------------------------------- Initialize Vundle---------------------------------------
set nocompatible              " Should be the first of vimrc
filetype off                  " required

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundle.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" =============== Scrolling ===============
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
" =============== Searching ===============
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" -------------------------syntastic--------------------------------
let g:syntastic_check_on_open = 0
let g:syntastic_c_check_header = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_no_include_search = 1
" -----------------------------YCM-----------------------------------
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'gitcommit' : 1,
      \}
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" -----------------------------CSCOPE Setting ------------------------------------

" ----------------------------- UltiSnips ------------------------------------
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-d>"

" -----------------------------General Settings-------------------------------------
set encoding=utf-8
set langmenu=zh_TW.UTF-8
language message zh_TW.UTF-8
set nocompatible		"
set bs=2				"
set mouse=nv			" 設定滑鼠在all mode (a) 都可使用
" -----------------------------Tab Setting------------------------------------------

set expandtab
set tabstop=4			" 設定<Tab>鍵的定位位址
set softtabstop=4		"
set shiftwidth=4		"
set smarttab			" 根據內文決定tab鍵的定位位址
set tags=~/.vim/stdtags,tags,.tags,../tags;		"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" -------------------------- Display Setting --------------------------------------
set history=50			" 紀錄歷史指令的數量
set ruler               " 顯示當前游標位置的底線
set autoread            " 當外部更新時自動讀取
"set nu					" 開啟顯示行數
"set bg=dark				" 設定黑色背景下的文字樣式
set t_Co=256

let g:kolor_italic=1
let g:kolor_bold=1
let g:kolor_underlined=0
let g:kolor_alternative_matchparen=0
colorscheme kolor     "candy

" -----------------------------Coding Settings-------------------------------------
syntax on				" 設定highlight
set cursorline			" 當前游標底線
set foldmethod=indent	" 設定摺疊模式
set foldnestmax=5		" 最高摺疊幾層
set foldlevel=5			"
"設置OmniCppComplete(暫時)
set nocp

" -------------------------High light unwanted spaces in end of line---------------
highlight ExtraWhitespace ctermbg=darkred guibg=darkcyan
autocmd BufEnter * if &ft != 'help' | match ExtraWhitespace /\s\+$/ | endif
autocmd BufEnter * if &ft == 'help' | match none /\s\+$/ | endif

" -------------------------Restore Cursor to last editing position ----------------
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
" -----------------------------Plugin Settings-------------------------------------
filetype on
filetype indent on		" 開啟 filetype-specific indent
filetype plugin on 		" 開啟 filetype-specific pligins

" -----------------------------Plugin Settings-------------------------------------
set fileencodings=utf8,big5,gbk,latin1
set fileencoding=big5
let g:NERDTreeDirArrows=1

"==================================================================================
"                               Hotkey Mapping
"==================================================================================

"map <silent> <F12> :Tlist<CR>				" 將鍵盤F12設定為快速切換Taglist菜單
"nnoremap <silent> <F9> :NERDTreeToggle<CR>	" 切換NERD 目錄

map <C-L> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
map <F9>  :GitGutterToggle<CR>
" -----------------------------Trinity---------------------------------------------
" Open and close all the three plugins on the same time
nmap <F8>  :TrinityToggleAll<CR>

" Open and close the Source Explorer separately
nmap <F5>  :TrinityToggleSourceExplorer<CR>

" Open and close the Taglist separately
nmap <F6> :TrinityToggleTagList<CR>

" Open and close the NERD Tree separately
nmap <F7> :TrinityToggleNERDTree<CR>

" -----------------------------Tab Navigation Mapping---------------------------------------------
nnoremap <C-j>   :tabprevious<CR>
nnoremap <C-k>   :tabnext<CR>
map <C-n> <Esc>:tabnew<CR>
"map <C-PageUp> <Esc>:tabprev<CR>
"map <C-PageDown> <Esc>:tabnext<CR>
"nnoremap <C-n>     :tabnew<CR>
"inoremap <C-k> <Esc>:tabprevious<CR>i
"inoremap <C-j>   <Esc>:tabnext<CR>i
"inoremap <C-t>     <Esc>:tabnew<CR>

" -----------------------------Leader Key Mapping---------------------------------------------
map <leader><TAB> :set expandtab!<CR>
map <leader>n :set number!<CR>
map <leader>m :marks<CR>
set pastetoggle=<leader>p
"map <C-u> :set fileencoding=utf8
"map <C-b> :set fileencoding=big5
" ============================================================================================"
" -- map 說明
"     map j GG 		" 會使得j 映射成GG
"     map Q j		" 會將Q映射到GG，因為Q 映射到j，j映射到GG
"     nnoremap W 	" W映射到j，但不會映射到GG
"     <silent>		" 使指令執行時不會出現執行名稱在vim左下方
" ============================================================================================"
" -- Reference:
"     [1] NERDTree:
"     		http://blog.longwin.com.tw/2009/02/vim-tree-explorer-nerdtree-plugin-2009/
"     [2] TagList:
"     		http://vim-taglist.sourceforge.net/

