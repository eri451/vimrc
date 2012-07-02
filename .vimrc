" ------------------------------------------------------------------------------
" Basics
" ------------------------------------------------------------------------------
" Be IMproved
set nocompatible
" Enable pathogen bundle loader
call pathogen#infect()
" Source Vtimer
source ~/.vim/bundle/vtimer/vtimer.vim
" Recognize file types / set indent mode
filetype plugin indent on
" Share OS clipboard
set clipboard=unnamed
" Allow mouse usage in terminal vim
set mouse=a
" Always show status line
set laststatus=2
" Syntastic highlight
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" PowerLine
let g:Powerline_symbols = 'fancy'
" Per project vimrc
set exrc
" Source vimrc files after editing
autocmd bufwritepost .vimrc source <afile>
" Indention
set autoindent
" Automatically safe files when switchin between them / leaving vim
set autowriteall
autocmd FocusLost * silent! :wa
autocmd TabLeave * silent! :wa
" Do not create swap files, we're using git after all
set nobackup
set nowritebackup
set noswapfile
" Enable vim to remember undo chains between sessions (vim 7.3)
if v:version >= 703
  set undofile
endif
" Disable folding
set nofoldenable
" Configure snipmate dir
let g:snippets_dir="~/.vim/snippets"
" Setup syntastic filetypes
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['javascript', 'php'],
                           \ 'passive_filetypes': ['puppet'] }


" ------------------------------------------------------------------------------
" Styling
" ------------------------------------------------------------------------------
" Syntax highlighting
syntax on
" Color Scheme
colorscheme jammy
" Show Line numbers
set number
" Highlight LineNumbers
highlight CursorLineNr guibg=#222222 guifg=LightBlue ctermfg=lightblue gui=bold
highlight LineNr guifg=#aaaa00
" Visual line marking 80 characters (vim 7.3)
if v:version >= 703
  set colorcolumn=80
endif
" Text-mate style display of invisible characters (tab/newline)
set listchars=tab:▸\ ,eol:῀
set list
highlight NonText guifg=#222222
highlight SpecialKey guifg=#222222 guibg=NONE
" Highlight active line
set cursorline
highlight CursorLine guibg=#222222 guifg=NONE
" Highlight search results
set hlsearch
hi Search guibg=Khaki guifg=Black gui=NONE

" Highlight Popupmenus
hi Pmenu    guibg=#cde472 ctermbg=185 guifg=#222222 ctermfg=235 gui=NONE
hi PmenuSel guibg=#e5f1b7 ctermbg=193 guifg=#111111 ctermfg=233 gui=bold

" ------------------------------------------------------------------------------
" Tabs vs. Spaces
" ------------------------------------------------------------------------------
" Spaces instead of tabs
set expandtab
" 4 spaces for each tab
set tabstop=4
" 4 spaces for indention
set shiftwidth=4

" ------------------------------------------------------------------------------
" Key bindings
" ------------------------------------------------------------------------------
" Make , the leader key
let mapleader = ","

" Nerd Tree (toggle)
nnoremap <Leader>n :NERDTreeToggle<CR>
" Nerd Tree (reveal current file)
nnoremap <Leader>f :NERDTree<CR>:NERDTreeClose<cr>:NERDTreeFind<CR>
" Nerd Tree @ Projects
nnoremap <Leader><Leader>p :NERDTreeFromBookmark Projects<CR>

" Move between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Edit user .vimrc
nmap <Leader>v :e ~/.vimrc<CR>
" Edit project .vimrc
map <Leader>V :e .vimrc<CR>

" Toggle Spellcheck
nmap <Leader>sd :set spell! spelllang=de<CR>
nmap <Leader>se :set spell! spelllang=en<CR>

" Clear search results when hitting space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Copy path to current buffer into clipboard
nnoremap <leader><space> :!echo -n % \| pbcopy<CR><CR>

" Show current file as HTML (to paste into Keynote)
nmap <Leader>h :TOhtml<CR>:w<cr>:!open %<CR>:q<CR>

" Mapping for gundo
nnoremap <F5> :GundoToggle<CR>

" Mapping for numbers
nnoremap <F3> :NumbersToggle<CR>

" ------------------------------------------------------------------------------
" File type specifics *
" ------------------------------------------------------------------------------
" Execute current file with node.js
autocmd BufEnter *.js nmap <Leader><Leader> :w<CR>:!node %:p<CR>
" Execute current file with coffee-script node.js
autocmd BufEnter *.coffee nmap <Leader><Leader> :w<CR>:!coffee %:p<CR>

" Recognise file by extension
autocmd BufEnter *.ctp set filetype=php
autocmd BufEnter *.less set filetype=less
autocmd BufEnter *.ds set filetype=javascript
autocmd BufEnter *.json set filetype=javascript
autocmd BufEnter *.isml set filetype=html
autocmd BufEnter *.ejs set filetype=html

" Magic to make ledger work
au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger
