let mapleader = ","

filetype on
filetype indent on
filetype plugin on

set encoding=UTF-8
set smartcase ignorecase

syntax on
set autochdir
set autoindent
set colorcolumn=80
set hlsearch
set laststatus=2
set list
set mouse=a
set noscrollbind
set number
set ruler
set spelllang=en_us
set splitbelow
set splitright
set vb
set wildmenu

hi Search cterm=NONE ctermfg=black ctermbg=red
set wildcharm=<C-Z>
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"

" netrw

nnoremap - :Explore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
autocmd FileType netrw setl bufhidden=delete

"-- netrw END

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plug 
call plug#begin()
"> Must Have
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'      " https://github.com/ctrlpvim/ctrlp.vim
Plug 'lervag/file-line'
Plug 'mkitt/tabline.vim'       " https://github.com/mkitt/tabline.vim
Plug 'rhysd/git-messenger.vim'
Plug 'ryanoasis/vim-devicons'  " https://github.com/ryanoasis/vim-devicons + https://github.com/ryanoasis/nerd-fonts/
Plug 'tpope/vim-commentary'    " https://github.com/tpope/vim-commentary
Plug 'tpope/vim-fugitive'      " https://github.com/tpope/vim-fugitive
Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline

Plug 'SirVer/ultisnips'                             " https://github.com/sirver/UltiSnips
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
Plug 'github/copilot.vim'

"> Theme
Plug 'NLKNguyen/papercolor-theme' " https://github.com/NLKNguyen/papercolor-theme
call plug#end()

"-- plug END
let g:git_messenger_always_into_popup = v:true

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" vim-gitgutter

set updatetime=500

"-- vim-gitgutter END

" papercolor-theme

set termguicolors
set background=dark
colorscheme PaperColor

"-- papercolor-theme END

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
