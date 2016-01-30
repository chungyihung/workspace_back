" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall

" Filetype off is required by vundle
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'

"--------------------- All of your Plugins must be added before the following line------------------

Bundle "naseer/logcat"
Bundle "wesleyche/SrcExpl"
Bundle "wesleyche/Trinity"
"Bundle 'Rip-Rip/clang_complete'
"NeoComplcache
"Bundle 'Shougo/neocomplcache.vim'
"Bundle 'Shougo/neosnippet'
"Bundle 'Shougo/neosnippet-snippets'

"VIM Git Plugin
Bundle "tpope/vim-fugitive"

"YouCompleteMe
Bundle "Valloric/YouCompleteMe"

" vim-gitgutter: show where the file you modified
Bundle "airblade/vim-gitgutter"

" Syntastic
"Bundle "scrooloose/syntastic"

" ultisnips
Bundle "SirVer/ultisnips"
Bundle "honza/vim-snippets"

" SuperTab
"Bundle "ervandew/supertab"

" snipmate
"Bundle "MarcWeber/vim-addon-mw-utils"
"Bundle "tomtom/tlib_vim"
"Bundle "garbas/vim-snipmate"

" Kolor
Bundle "Zeis/vim-kolor"

call vundle#end()            " required
filetype plugin indent on    " required

