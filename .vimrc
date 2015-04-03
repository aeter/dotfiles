set nocompatible
syntax on
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

"Search
set hlsearch
set incsearch
set ignorecase
set smartcase

"Encryption -> enable with ':X', disable with 'set key='
"Vim before 7.3 doesn't support blowfish
set cm=blowfish
"No Backup
set nobackup
set nowritebackup
set noswapfile

"Shows what is being typed as a command
set showcmd

"Syntax highlighting
filetype on
filetype plugin indent on
syntax enable

"Spaces instead of tabs
set expandtab
set smarttab

"Cool tab completions
set wildmenu
set wildmode=list:longest,full

"Center on the line the searched word is found
:nmap n nzz
:nmap N Nzz
:nmap * *zz
:nmap # #zz

"Toggle line numbers and fold column for easy copying"
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

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

"Racket
au BufReadPost *.rkt,*.rktl set filetype=scheme

"Processing
au BufReadPost *.pde set filetype=java

"Python specific indentation
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

"Ruby specific indentation
autocmd Filetype ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

"Scheme specific indentation
autocmd Filetype scheme setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

colorscheme jellybeans
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set textwidth=80
set guifont=Menlo:h14
set nowrap

