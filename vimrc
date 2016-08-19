"Indicates that vimrc is incompatible with vi and wont be used
set nocompatible
set encoding=utf-8

" {{{ Setup Vundle and Plugins
"=====================================================================
" Required by vundle to run properly, this will be turned back on
" afterwards for filetype plugins and indentation 
filetype off	

" Now set the runtime path to include Vundle and init
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Now let Vundle manage Vundle (This is required)
Plugin 'VundleVim/Vundle.vim'

" Now we add all the plugins we are using here
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'derekwyatt/vim-scala'
Plugin 'fatih/vim-go'

" Future adds: snippets, 

" End of plugins - They cannot come after
call vundle#end()
"=====================================================================
" }}}
" {{{ General
"=====================================================================
" Enable filetype plugins. This makes it so that vim recognizes file-
" type and will look into ~/.vim/after/ftplugins on unix based systems
" for a coorresponding file description. Note that after here makes it
" such that these settings will override settings from other plugins.
" Therefore we can define default settings in the vimrc, but these
" specific instructions in ~/.vim/after/ftplugins will override in
" conflicting cases.
"     Ex: python.vim might contain the following:
"     -------------------------------------------
"     setlocal expandtab
"     setlocal shiftwidth=4
"     setlocal softtabstop=4

" Enable syntax highlighting
syntax on
filetype plugin indent on

" Remap jj to mean esc in insert mode to make it easier to return to nmode
inoremap jj <ESC>
"=====================================================================
" }}}
" {{{ Tabs and Indention
"=====================================================================
" By default, do indentation without tabs such that we set a tab such
" that \t := 4 spaces. These settings come from vim.wikia.com
set expandtab
set shiftwidth=4
set softtabstop=4

" Copy the indentation of the previous line on creating a new line
set autoindent

" Notes: smartindent is not used per vim.wikia.com because the more
" flexible file-type based indentation is used as suggested, which
" requires setting indentation behavior for different langauges in
" their own file in ~./vim/after/ftplugins
"=====================================================================
" }}}
" {{{ Movement
"=====================================================================
" Make the default numbering to be relative for fast movement, but also
" set the current line to display the absolute number.
set number
set relativenumber

" Disable the arrow keys in order to get rid of dependency
nnoremap <up> <nop>
inoremap <up> <nop>
vnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <down> <nop>
vnoremap <down> <nop>
nnoremap <left> <nop>
inoremap <left> <nop>
vnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <right> <nop>
vnoremap <right> <nop>



" }}}
    " {{{ Appearance
    "=====================================================================
    " Highlight the cursor line 
    set cursorline

    " Show matching part of a pair of [] {} ()
    set showmatch

    set list
    set listchars=tab:▸\ ,eol:¬


    " Highlight lines exceeding 79 characters to encourage readibility.
    " the augroup is used because otherwise this only works for the first
    " file in a given buffer. From blog.ezyang.com/2010/03/vim-textwidth/
    set colorcolumn=81
    highlight ColorColumn ctermbg=23 guibg=darkgrey

    " Set the Colorscheme
    if has('gui_running')
        set background=dark
        colorscheme solarized
    endif

    " Airline status bar
    " make airline appear right away
    set laststatus=2
    
    "make the airline toolbar use the powerline fonts
    let g:airline_powerline_fonts = 1

    "=====================================================================
    " }}}
    " {{{ Search Options
    "=====================================================================
    " Search as characters are entered
    set incsearch

    " Highlight search matches
    set hlsearch

    " Ignore case on searches
    set ignorecase
    "=====================================================================
    " }}}
" {{{ Folding
"=====================================================================
" Enable folding
set foldenable

" Set the default foldmethod to do so by indentation level.
set foldmethod=indent

" For this file alone, look to the bottom for the modeline which allows
" us to fold up the file for easier navigation using {{{ and }}}
set modelines=1

" Open most folds by default. Only depth 10 blocks are default folded
set foldlevelstart=10

" Do not fold more than 10 levels worth of code.
set foldnestmax=10

" change the mapping of space so that it folds/unfolds
nnoremap <space> za
"=====================================================================
" }}}
" {{{ netrw / vinegar settings
"=====================================================================
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

"=====================================================================
" }}}

" vim:foldmethod=marker:foldlevel=0
