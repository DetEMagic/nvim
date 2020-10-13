"Neovim init.vim file for debian/ubuntu/linux mint terminal"

set number "row numbers"
set noshowmode "fix for lightline"
set laststatus=2 "fix for lightline"
set nowrap "text does not come on a new line if it you can't see it"
set clipboard+=unnamedplus "copy and paste works as intended"
set incsearch "livesearch"
set ttimeoutlen=50 "no label-delay when you go from INSERT to NORMAL"
set noshowcmd "No navigation flashing under status bar"

"indent is set to 4 instead of default 8"
set tabstop=4
set shiftwidth=4
set expandtab

"download automatically coc extensions"
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-json',
\ 'coc-clangd',
\ 'coc-html',
\ 'coc-css',
\ 'coc-tsserver'
\ ]

"create the directories automatically if they do not exist"
if !isdirectory($HOME . '/.config/nvim/backup//')
    call mkdir($HOME . '/.config/nvim/backup//', "p")
endif
if !isdirectory($HOME . '/.config/nvim/swap//')
    call mkdir($HOME . '/.config/nvim/swap//', "p")
endif
if !isdirectory($HOME . '/.config/nvim/undo//')
    call mkdir($HOME . '/.config/nvim/undo//', "p")
endif

"swap, backup and undo files can be found in these directories, instead of the 
"same directory as the file. (//) makes that the file can't have the same name."
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//

"download automatically vim-plug"
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"vim-plug: from github Plug 'namn/projekt'"
call plug#begin() 
"treview of directories/files"
Plug 'preservim/NERDTree'
"theme"
Plug 'joshdick/onedark.vim'
"Statusbar"
Plug 'itchyny/lightline.vim'
"Shows which parentheses/brackets are together"
Plug 'tpope/vim-surround'
"Intellisense"
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Better clangd syntax highlighting"
Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()

"Ctrl-n for nerdtree"
map <C-n> :NERDTreeToggle<CR>

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"hide end-of-buffer filler lines (~)"
let g:onedark_hide_endofbuffer = 1

"lightline onedark theme"
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

"syntax highlighting in languages"
syntax on
"Atom One Dark UI"
colorscheme onedark
"remap to esc to exit terminal mode"
:tnoremap <Esc> <C-\><C-n>
