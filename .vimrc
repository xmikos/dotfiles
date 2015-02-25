" *** INFECT VIM WITH PATHOGEN! ***
execute pathogen#infect()


" *** BASIC SETTINGS ***

" Don't use Vi-compatible mode
set nocompatible

" Allow hidden unsaved buffers (and remember undo for them)
set hidden

" Enable mouse selection
set mouse=a

" Windows-like CUA mode
source $VIMRUNTIME/mswin.vim
set selectmode=             "Disable select mode (use standard visual mode instead)
startinsert                 "Start Vim in insert mode

" UI settings
set history=100             "Set command-line history size 
set confirm                 "Show confirmation dialogs
set ruler                   "Show line and column number of the cursor position
set showcmd                 "Show command in the last line of the screen
set number                  "Show line numbers
set nowrap                  "Don't wrap long lines
set wildmenu                "Show possible completion matches in menu
set wildmode=longest,full   "Complete till longest common string, then next full match
set noshowmatch             "Don't jump to matching bracket when a bracket is inserted
set nostartofline           "Always keep cursor on same column after movement (if possible)
set cursorline              "Highlight current line

" Searching
set ignorecase              "Ignore case
set smartcase               "Don't ignore case if the pattern contains uppercase letters
set incsearch               "Show matches while typing a search command
set hlsearch                "Highlight all matches

" Indenting
set autoindent              "Copy indent from current line when starting a new line
set smartindent             "Do smart autoindenting when starting a new line (based on language)
set expandtab               "Insert spaces instead of <Tab>
set smarttab                "Insert/delete number of blanks according to shiftwidth
set tabstop=4               "Number of spaces that a <Tab> in the file counts for
set softtabstop=4           "Number of spaces that a <Tab> counts for while performing editing
set shiftwidth=4            "Number of spaces to use for each step of (auto)indent

" Filetype detection and syntax highlighting
filetype plugin indent on
syntax on


" *** PLUGINS SETTINGS ***

" More frequent updates (for better function of gitgutter and tagbar plugins)
set updatetime=1000

" Configure lightline.vim plugin and disable legacy Vim status texts
let g:lightline = {'colorscheme': 'wombat'}
set laststatus=2
set noshowmode

" Open Tagbar automatically for supported file types
autocmd FileType * nested :call tagbar#autoopen(0)


" *** COLOR SCHEMES ***

" Basic color settings
set t_Co=256
set background=dark

" Color schemes settings
let g:rehash256 = 1             "Fix molokai colors on 256-color terminals

" Color schemes
"colorscheme hybrid
"colorscheme jellybeans
"colorscheme molokai
colorscheme wombat

" Fix colors in wombat scheme
hi SignColumn ctermfg=241 ctermbg=232 cterm=none guifg=#857b6f guibg=#080808 gui=none
"hi clear SignColumn

" Transparent background in most color schemes
hi Normal guibg=Black ctermbg=NONE

" Set line length markers and make them black (so they can only be seen on current line)
set colorcolumn=80,100,120
hi ColorColumn guibg=Black ctermbg=Black


" *** KEYBINDINGS ***

" Toggle paste mode with F2
set pastetoggle=<F2>

" Toggle Tagbar (class browser) with F8
noremap  <F8>      :TagbarToggle<CR>
inoremap <F8>      <C-O>:TagbarToggle<CR>
vnoremap <F8>      <C-C>:TagbarToggle<CR>

" Toggle NERDTree (file browser) with F9
noremap  <F9>      :NERDTreeToggle<CR>
inoremap <F9>      <C-O>:NERDTreeToggle<CR>
vnoremap <F9>      <C-C>:NERDTreeToggle<CR>

" Insert key toggle between normal and insert mode
nnoremap <Insert>  i
inoremap <Insert>  <Esc>
vnoremap <Insert>  <Esc>

" Cut/paste lines with CTRL-K/CTRL-U like in Nano
inoremap <C-K> <Esc>:execute @a ? 'normal! "Bdd' : 'normal! "bdd'<cr>:let @a=1<cr>:echo ''<cr>i
inoremap <C-U> <Esc>"bPi
autocmd CursorMovedI * execute(':let @a=0')

" Indent/unindent selected lines
vnoremap <Tab>     >gv
vnoremap <S-Tab>   <gv

" Comment/uncomment selected lines (NERD_commenter.vim plugin)
nnoremap <C-D>     :call NERDComment("n", "Toggle")<CR>
vnoremap <C-D>     :call NERDComment("v", "Toggle")<CR>gv
inoremap <C-D>     <C-O>:call NERDComment("n", "Toggle")<CR>

" Browser-like tabs
inoremap <C-T>     <C-O>:tabnew<CR>
nnoremap <C-T>     :tabnew<CR>
inoremap <C-N>     <C-O>:tabnew<CR>
nnoremap <C-N>     :tabnew<CR>
inoremap <C-W>     <C-O>:quit<CR>
nnoremap <C-W>     :quit<CR>

" CTRL-Q and F10 is Quit All
noremap  <C-Q>      :quitall<CR>
vnoremap <C-Q> <C-O>:quitall<CR>
inoremap <C-Q> <C-O>:quitall<CR>
noremap  <F10>      :quitall<CR>
vnoremap <F10> <C-O>:quitall<CR>
inoremap <F10> <C-O>:quitall<CR>

" Next/previous with F3/Shift-F3
noremap    <F3>      n
vnoremap   <F3> <C-c>n
inoremap   <F3> <C-o>n
noremap  <S-F3>      N
vnoremap <S-F3> <C-c>N
inoremap <S-F3> <C-o>N

" Easy open/find/replace
if has('gui_running')
  " CTRL-O is Open
  noremap  <C-O>      :browse open<CR>
  vnoremap <C-O> <C-C>:browse open<CR>
  " CTRL-F is Find
  noremap  <C-F>      :promptfind<CR>
  vnoremap <C-F> <C-C>:promptfind<CR>
  inoremap <C-F> <C-O>:promptfind<CR>
else
  " CTRL-O is Open
  noremap  <C-O>      :edit .<CR>
  vnoremap <C-O> <C-C>:edit .<CR>
  " CTRL-F is Find
  noremap  <C-F>      /
  vnoremap <C-F> <C-C>/
  inoremap <C-F> <C-O>/
endif

" Fix copy & paste in Vim compiled without clipboard support
if !has("clipboard")
  vnoremap <C-X>          x
  vnoremap <S-Del>        x
  vnoremap <C-C>          y
  vnoremap <C-Insert>     y
  noremap  <C-V>          gP
  noremap  <S-Insert>     gP
  inoremap <C-V>          <C-O>gP
  inoremap <S-Insert>     <C-O>gP
  cnoremap <C-V>          <C-R>"
  cnoremap <S-Insert>     <C-R>"
endif

" CTRL+arrow/backspace/delete
inoremap <C-BackSpace> <C-o>db
vnoremap <C-BackSpace> <C-c>db
inoremap <C-Delete>    <C-o>dw
vnoremap <C-Delete>    <C-c>dw
inoremap <C-Left>      <C-o>b
vnoremap <C-Left>      <C-c>b
inoremap <C-Right>     <C-o>w
vnoremap <C-Right>     <C-c>w
inoremap <C-Up>        <C-o>{
vnoremap <C-Up>        <C-c>{
inoremap <C-Down>      <C-o>}
vnoremap <C-Down>      <C-c>}

" Move between windows (because C-Tab doesn't work in terminal)
inoremap <M-PageUp>    <C-O><C-W>w
nnoremap <M-PageUp>    <C-W>w
inoremap <M-PageDown>  <C-O><C-W>W
nnoremap <M-PageDown>  <C-W>W
