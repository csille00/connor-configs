# Vim Configuration

This README explains the customizations and commands in the provided \`vimrc\`. It covers the cursor behavior, search options, key mappings, plugin configurations, and other useful settings.

## Cursor Behavior

The cursor shape changes depending on the mode you're in:

- **Insert Mode**: Thin cursor (\`5 q\`)
- **Normal Mode**: Thick block cursor (\`1 q\`)
- **Replace Mode**: Beam cursor (\`4 q\`)

If you're using \`tmux\`, these settings are adjusted for compatibility. The \`CursorShapeFix\` augroup ensures the cursor changes instantly when switching modes.

\`\`\`vim
if exists('$TMUX')
  let &t_SI = "\\ePtmux;\\e\\e[5 q\\e\\\\"
  let &t_EI = "\\ePtmux;\\e\\e[1 q\\e\\\\"
  let &t_SR = "\\ePtmux;\\e\\e[4 q\\e\\\\"
else
  let &t_SI = "\\e[5 q"
  let &t_EI = "\\e[1 q"
  let &t_SR = "\\e[4 q"
endif
\`\`\`

## Mouse Support

To enable mouse support (including right-click context menus), the following options are set:

\`\`\`vim
set mouse=a
set mousemodel=popup
set ttymouse=sgr
\`\`\`

## Search Settings

To make searching more intuitive and interactive, the following options are enabled:

- \`hlsearch\`: Highlights search results.
- \`incsearch\`: Shows search matches as you type.

\`\`\`vim
set hlsearch
set incsearch
\`\`\`

## General Settings

These settings improve overall user experience:

- Line numbers (\`set number\`)
- Use spaces instead of tabs (\`set expandtab\`)
- Set tab width to 2 spaces (\`set tabstop=2\`, \`set shiftwidth=2\`)
- Enable smart indentation (\`set smartindent\`)

\`\`\`vim
set number
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
\`\`\`

## Plugins

This configuration uses [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins. You can install them by running \`:PlugInstall\`.

\`\`\`vim
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'sheerun/vim-polyglot'
call plug#end()
\`\`\`

### Key Plugin Highlights:

- **NERDTree**: Toggle with \`<C-n>\`, shows a file explorer.
- **CtrlP**: File search using \`<C-p>\`. Ignore version control directories like \`.git\`.
- **FZF**: For fuzzy searching files.
- **Coc.nvim**: Intellisense-like features.
- **Telescope**: File searching with additional options like live grep.

## Theme

The theme used is \`onedark.vim\`. It can be set via:

\`\`\`vim
colorscheme onedark
\`\`\`

## Key Mappings

### General Mappings:

- **NERDTree Toggle**: \`<C-n>\`
- **File Search (CtrlP)**: \`<C-p>\`
- **Find Files**: \`ff\`
- **Live Grep**: \`<C-S-F>\`
- **Buffer Search**: \`fb\`
- **Help Tags Search**: \`fh\`

### Coc.nvim Mappings:

- **Jump to Definition**: \`<C-b>\`
- **Jump to Declaration**: \`<C-S-b>\`
- **Rename Symbol**: \`<S-F6>\`
- **Format Code**: \`<C-A-l>\`
- **Show Code Actions**: \`<A-CR>\`
- **Find References**: \`gr\`
- **Show Documentation**: \`K\`

### Prettier Formatting

To use Prettier for code formatting, the following command and autocmd are defined:

- **Run Prettier**: \`:Prettier\`
- **Automatically run Prettier** on leaving insert mode:

\`\`\`vim
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
autocmd InsertLeave * :Prettier
\`\`\`

## Telescope Commands

Telescope is configured for fuzzy searching. Some key mappings for Telescope commands:

\`\`\`vim
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap <C-S-F> <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>
nnoremap fh <cmd>Telescope help_tags<cr>
\`\`\`

## Git Branch Sessions

You can save and load sessions based on the current Git branch. This is useful for switching between different workspaces automatically when switching branches.

\`\`\`vim
function! SaveGitBranchSession()
  ...
endfunction

function! LoadGitBranchSession()
  ...
endfunction

autocmd VimLeave * call SaveGitBranchSession()
autocmd VimEnter * if argc() == 0 | call LoadGitBranchSession() | endif
\`\`\`

## Additional Notes

- **Airline Theme**: The \`airline_theme\` is set to 'luna'.
- **Right-Click Context Menu**: Right-click opens a context menu (\`mousemodel=popup\`).
