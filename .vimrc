set nocompatible
call plug#begin('~/.config/nvim/plugged')

Plug 'dyng/ctrlsf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'sjl/gundo.vim'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'Konfekt/FastFold'

Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'
Plug 'shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-projectionist'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'

Plug 'matze/vim-move'

Plug 't9md/vim-choosewin'

" Tag cache disabled. JavaScript support is poor.
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'gregsexton/gitv'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'

Plug 'mattn/webapi-vim'
Plug 'jbgutierrez/vim-babel'
"Plug 'jelera/vim-javascript-syntax'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'tpope/vim-haml'
Plug 'groenewege/vim-less'
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'davidhalter/jedi-vim'

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

Plug 'moll/vim-bbye'

Plug 'ryanoasis/vim-devicons'

call plug#end()

set history=1000
set undolevels=1000
set noswapfile

set title
set number          " Show line numbers
set cursorline
set noshowmode
set laststatus=2
set background=dark
set t_Co=256
colorscheme molokai
syntax on

set tabstop=4       " TAB width in spaces
set shiftwidth=4    " Indentation amount for < and >
set expandtab       " Use spaces for TAB
set autoindent

set nolist
set wrap
set linebreak
set textwidth=0
set wrapmargin=0

set showmatch
set incsearch
set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

set hidden
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

let g:ctrlp_extensions = ['tag']
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_custom_ignore = {
            \ 'dir': '\v[\/](node_modules|bower_components|dist)$'
            \ }

let g:ctrlsf_ignore_dir = ['node_modules', 'bower_components', 'dist']

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'

let g:molokai_original = 1
let g:rehash256 = 1

let mapleader="\<SPACE>"
nnoremap ; :

" Clear search
nmap <Leader>c :nohlsearch<CR>

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
  else
    set rnu
  endif
endfunc

nnoremap <Leader>f :CtrlSF<space>
nnoremap <Leader><Leader>f :CtrlSFToggle<CR>
nnoremap <Leader>w :Bdelete<CR>
nnoremap <Leader>s :w<CR>
nnoremap <Leader><C-s> :wa<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader><C-q> :qa<CR>
map <Leader>a <Plug>(EasyAlign)

" Toggle between normal and relative numbering.
nnoremap <silent> <Leader>r :call NumberToggle()<CR>

nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>y :TagbarToggle<CR>

"smart indent when entering insert mode with i on empty lines
function! IndentWithI()
    if len(getline('.')) == 0
        return "\"_cc"
    else
        return "i"
    endif
endfunction
nmap <silent> <expr> i IndentWithI()

let g:move_key_modifier = 'C'

nmap  <Leader>`  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_delay = 100

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

autocmd FileType javascript setlocal omnifunc=tern#CompleteJS

let g:used_javascript_libs = 'underscore,angularjs,angularuirouter,react,flux,requirejs,jasmine,chai'

let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0

"set foldmethod=syntax
"set foldlevelstart=1

"let javaScript_fold=1         " JavaScript
