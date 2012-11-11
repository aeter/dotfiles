syntax on

set nocompatible
set number
set ruler

" tell vim that the terminal can handle 256 colors
set t_Co=256

" highlight the trailing whitespace at the end of the lines as 'TODO'
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"cd to the dir the current file is opened
set autochdir

"Search
set hlsearch
set incsearch
set ignorecase
set smartcase

"Backup
set nobackup
set nowritebackup
set swapfile

"Shows what is being typed as a command
set showcmd
filetype on
filetype plugin indent on

"Spaces instead of tabs
set expandtab
set smarttab

"Cool tab completions
set wildmenu
set wildmode=list:longest,full

set backspace=2

"Bring the searched word to middle of screen
:nmap n nzz
:nmap N Nzz
:nmap * *zz
:nmap # #zz
:nmap g* g*zz 
:nmap g# g#zz

"Toggle line numbers and fold column for easy copying"
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" map Ctrl-Space for autocompletion in insert mode:
inoremap <Nul> <C-p>

" tab navigation like firefox
:nmap <A-Right> :tabnext<CR>
:imap <A-Right> <Esc>:tabnext<CR>
:nmap <A-Left> :tabprevious<CR>
:imap <A-Left> <Esc>:tabprevious<CR>
:nmap <C-t> :tabnew<CR>
:imap <C-t> <Esc>:tabnew<CR>

"scons files:
autocmd BufRead,BufReadPre,BufNewFile SConstruct set filetype=python
autocmd BufRead,BufReadPre,BufNewFile SConscript set filetype=python

"some django files
au BufNewFile,BufRead,BufReadPre *.djhtml set filetype=javascript

colorscheme jellybeans
set smartindent
set tabstop=4
set shiftwidth=4
set autoindent
set textwidth=80
set guifont=Menlo:h14
syntax enable
set nowrap