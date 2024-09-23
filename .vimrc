" Change cursor shape in different modes for terminal Vim
if exists('$TMUX')
  " If using tmux, special handling for cursor shape
  let &t_SI = "\ePtmux;\e\e[5 q\e\\"
  let &t_EI = "\ePtmux;\e\e[1 q\e\\"
  let &t_SR = "\ePtmux;\e\e[4 q\e\\"
else
  " Thin cursor in insert mode (5 q) and thick block in normal mode (1 q)
  let &t_SI = "\e[5 q" " Thin cursor in insert mode
  let &t_EI = "\e[1 q" " Thick block cursor in normal mode
  let &t_SR = "\e[4 q" " Use beam cursor for replace mode
endif

" Ensure cursor changes immediately on mode change
augroup CursorShapeFix
  autocmd!
  autocmd InsertEnter * silent! exec "normal!"
augroup END

" Enable right-click to open a context menu
set mouse=a
set mousemodel=popup
set ttymouse=sgr

" Switch on syntax highlighting
syntax on

" Highlight search results
set hlsearch

" While typing a search command, show where the pattern is so far.
set incsearch

" General settings for better UX
set number        " Line numbers
set expandtab     " Use spaces instead of tabs
set tabstop=2     " Number of spaces a tab counts for
set shiftwidth=2  " Number of spaces to use for autoindent
set smartindent   " Enable smart indentation

" Airline theme for a better status line
let g:airline_theme = 'luna'

" Plugins
call plug#begin('~/.vim/plugged')

" File explorer (like IntelliJ’s project panel)
Plug 'preservim/nerdtree'

" Ctrl-p file search plugin
Plug 'ctrlpvim/ctrlp.vim'

" Onedark theme
Plug 'joshdick/onedark.vim'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Coc TServer
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Enable NERDTree (project sidebar)
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Set the Onedark theme
colorscheme onedark

" Set CtrlP configuration (optional, but recommended for better experience)
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$' " Ignore version control folders
let g:ctrlp_map = '<C-p>'                         " Remap CtrlP to Ctrl+p
let g:ctrlp_cmd = 'CtrlP'                         " Command to trigger CtrlP

