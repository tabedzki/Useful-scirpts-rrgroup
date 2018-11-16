" File              : /mnt/rrio1/home/tabedzki/.vimrc
" Author            : Christian Tabedzki <tabedzki@seas.upenn.edu>
" Date              : 23.05.2018
" Last Modified Date: 26.10.2018
" Last Modified By  : Christian Tabedzki <tabedzki@seas.upenn.edu>
" Last Modified By  : Christian Tabedzki <tabedzki@seas.upenn.edu>
" File              : /mnt/rrio1/home/tabedzki/.vimrc
" Date              : 22.05.2018
" Last Modified Date: 22.05.2018

set background=dark
set nu
"execute pathogen#infect()
filetype plugin indent on
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
inoremap <C-Space> <C-N>

set nocompatible              " be iMproved, required
filetype off                  " required

 "set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')

 " let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'
 Plugin 'vim-scripts/AutoComplPop'
 " Plugin 'alpertuna/vim-header'
 "Plugin 'vim-airline/vim-airline'
 ":Plugin 'vim-syntastic/syntastic'
  Plugin 'tpope/vim-commentary'
 "Plugin 'vim-airline/vim-airline-themes'
 " The following are examples of different formats supported.
 " Keep Plugin commands between vundle#begin/end.
 " plugin on GitHub repo
 Plugin 'tpope/vim-fugitive'
 Plugin 'itchyny/lightline.vim'
 Plugin 'tpope/vim-surround'
 Plugin 'tabedzki/Toggle'
 " Plugin 'vim-latex/vim-latex'
 " plugin from http://vim-scripts.org/vim/scripts.html
 " Plugin 'L9'
 " Git plugin not hosted on GitHub
 " Plugin 'git://git.wincent.com/command-t.git'
 " git repos on your local machine (i.e. when working on your own plugin)
 "Plugin 'file:///home/gmarik/path/to/plugin'
 " The sparkup vim script is in a subdirectory of this repo called vim.
 " Pass the path to set the runtimepath properly.
 " Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
 " Install L9 and avoid a Naming conflict if you've already installed a
 " different version somewhere else.
 " Plugin 'ascenator/L9', {'name': 'newL9'}

 " All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required
 " To ignore plugin indent changes, instead use:
 "filetype plugin on
 "
 " Brief help
 " :PluginList       - lists configured plugins
 " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
 "
 " see :h vundle for more details or wiki for FAQ
 " Put your non-Plugin stuff after this line
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
 set laststatus=2
 let g:lightline = {
       \ 'colorscheme': 'wombat',
       \ }
" " Use 256 colours (Use this setting only if your terminal supports 256
" colours)
 set t_Co=256
 " set statusline+=%#warningmsg#
 " set statusline+=%{SyntasticStatuslineFlag()}
 " set statusline+=%*
 "
 " let g:syntastic_python_checkers = ['pylint']
 " let g:syntastic_always_populate_loc_list = 1
 " let g:syntastic_auto_loc_list = 1
 " let g:syntastic_check_on_open = 1
 " let g:syntastic_check_on_wq = 0
 let g:header_field_author = 'Christian Tabedzki'
 let g:header_field_author_email = 'tabedzki@seas.upenn.edu'
 map <F4> :AddHeader<CR>
