set nocompatible
syntax on
set number
set ruler

" tell vim that the terminal can handle 256 colors
set t_Co=256

"dont hang on long lines due to syntax
set synmaxcol=200

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

" highlight trailing whitespace as 'TODO'. needs to be after "syntax enable".
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

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

"Toggle line numbers and fold column for easy copying, by \-n
nnoremap <leader>n :set nonumber!<cr>:set foldcolumn=0<cr>

"treat these file extensions as language specific
au BufRead,BufNewFile SConstruct set filetype=python     "Scons
au BufRead,BufNewFile SConscript set filetype=python     "Scons
au BufRead,BufNewFile *.djhtml set filetype=javascript   "Django
au BufRead,BufNewFile *.rkt,*.rktl set filetype=scheme   "Racket
au BufRead,BufNewFile *.pde set filetype=java            "Processing
au BufRead,BufNewFile *.erb,*.erb.html set filetype=ruby "Rails
au BufRead,BufNewFile *.pp set filetype=ruby             "Puppet
au BufRead,BufNewFile *.dart set filetype=dart           "Dart
au BufRead,BufNewFile *.zig set filetype=zig             "Zig
au BufRead,BufNewFile *.nim set filetype=nim             "Nim

"language specific indentation
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype scheme setlocal tabstop=2 shiftwidth=2 softtabstop=2

" before the "colorscheme", to avoid overriding
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

colorscheme jellybeans
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set textwidth=80
set guifont=Menlo:h14
set nowrap
set nomodeline "improves security


command! -nargs=0 MyJupyterQtConsole call job_start("jupyter qtconsole --JupyterWidget.include_other_output=True")
function! MyJupyterRunCell()
    let start_line_num = search('^###', 'b')
    let end_line_num = search('^###', '')
    let lines = getline(start_line_num+1, end_line_num-1)
    let tmp_file = tempname()
    call writefile(lines, tmp_file)
    call system('jupyter run --existing --RunApp.kernel_timeout=5 <<< $(cat ' . tmp_file . ')')
    call system('rm ' . tmp_file)
    return 1
endfunction
nnoremap <silent> <leader>jc :call MyJupyterRunCell()<CR>
nnoremap <silent> <leader>jqt :MyJupyterQtConsole<CR>
