:set number
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2
:set cursorline

let &g:guifont = 'JetBrains\ Mono:h10'

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview			
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/windwp/nvim-autopairs' " Auto pairs
Plug 'akinsho/bufferline.nvim', {'tag': '*'} " Bufferline
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter
Plug 'nvim-lua/plenary.nvim' " Plenary
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.5'} " Telescope
Plug 'lukas-reineke/indent-blankline.nvim' " Indent Blankline
Plug 'tpope/vim-commentary' " Commenting
Plug 'rebelot/kanagawa.nvim' " Kanagawa Theme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'davidhalter/jedi-vim' " Python Autocompletion
Plug 'EdenEast/nightfox.nvim' " Nightfox Theme
Plug 'https://github.com/craftzdog/solarized-osaka.nvim' " Solarized Osaka Theme
set encoding=UTF-8

call plug#end()

set hidden


" Refresh NERDTree on save
autocmd BufWritePost * NERDTreeRefresh

" Set up auto pairs
lua require('nvim-autopairs').setup{}

" Set up bufferline
lua require('bufferline').setup{}

" Set up Indent Blankline
lua require("ibl").setup()

" Set up commentary
autocmd FileType python,sh,html,xml,yaml,yml setlocal commentstring=#\ %s 

autocmd FileType typescript,javascript,javascriptreact,typescriptreact setlocal commentstring=//\ %s

autocmd FileType vim setlocal commentstring=\"\ %s

" Set up NERDTree
let g:NERDTreeShowHidden=1

" Key Mappings
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
inoremap <expr> <CR> pumvisible() ? coc#_select_confirm(): "\<CR>"
nmap <F8> :TagbarToggle<CR>
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-g> :Telescope live_grep<CR>
nnoremap <C-b> :Telescope buffers<CR>

" Set up buffer switch shortcuts
nnoremap <C-Right> :BufferLineCycleNext<CR>
nnoremap <C-Left> :BufferLineCyclePrev<CR>
nnoremap <C-x> :BufferLinePick<CR>
nnoremap <C-q> :BufferLinePickClose<CR>
nnoremap <C-c> :bd<CR>

:set completeopt-=preview " For no previews

:set termguicolors
:set background=dark
:colorscheme gruvbox

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" air-line 
let g:airline_powerline_fonts = 1
let g:airline_theme="gruvbox"

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Declare python3 path
let g:python3_host_prog = 'C:\Python312\python.exe'

" Use virtual text for diagnostics
setlocal signcolumn=yes
