syntax on
set background=dark
set nu
set incsearch
set ignorecase smartcase

" tab settings
set tabstop=8
set expandtab
set shiftwidth=2 " or whatever
set smarttab autoindent

" paste with proper indentation
nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>
set pastetoggle=<F5>

" using the mouse
set mouse=a

" filetype indent settings
filetype plugin on

" tmux statusline plugin
"let g:airline#extensions#tmuxline#enabled = 0
"let g:tmuxline_powerline_separators = 0

" yank to clipboard
if has("clipboard")
 set clipboard=unnamed " copy to the system clipboard

 if has("unnamedplus") " X11 support
  set clipboard+=unnamedplus
 endif
endif
