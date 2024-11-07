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
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}  " Auto Completion
Plug 'https://github.com/windwp/nvim-autopairs' " Auto pairs
Plug 'akinsho/bufferline.nvim', {'tag': '*'} " Bufferline
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter
Plug 'nvim-lua/plenary.nvim' " Plenary
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.x'} " Telescope
Plug 'lukas-reineke/indent-blankline.nvim' " Indent Blankline
Plug 'tpope/vim-commentary' " Commenting
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'davidhalter/jedi-vim' " Python Autocompletion
Plug 'https://github.com/craftzdog/solarized-osaka.nvim' " Solarized Osaka Theme
Plug 'octol/vim-cpp-enhanced-highlight' " C++ Highlighting
Plug 'windwp/nvim-ts-autotag' " Auto Tag
Plug 'psf/black', {'branch': 'main'} " Python Black Formatter
Plug 'Vimjas/vim-python-pep8-indent' " Python PEP8 Indent
Plug 'fisadev/vim-isort' " Python Import Sorter
Plug 'klen/python-mode' " Python Mode

set encoding=UTF-8

call plug#end()

set hidden

" Configuration for Python
" Declare Python 3 path
let g:python3_host_prog = 'C:\Users\shriv\AppData\Local\Programs\Python\Python39\python.exe'
let g:coc_global_extensions = ['coc-pyright']
autocmd  BufWritePre *.py execute ':Black' " Format with Black on save
autocmd  BufWritePre *.py execute ':Isort' " Sort imports on save


" Treesitter configuration for web dev
lua << EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = { "html", "css", "javascript", "typescript", "json" },
	highlight = { enable = true },
	autotag = { enable = true },
}
EOF

" Enable CoC extensions for TypeScript and Tailwind CSS
let g:coc_global_extensions = ['coc-tsserver', 'coc-tailwindcss']

" Autpairs and auto-tagging
lua require('nvim-autopairs').setup{}
lua require('nvim-ts-autotag').setup()

" Treesitter configuration for C++
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "cpp", "c" },
  highlight = { enable = true },
}
EOF

" Enable Clangd support in CoC
let g:coc_global_extensions = ['coc-clangd']
let g:coc_clangd_format_on_type = 1
let g:coc_clangd_format_on_save = 1

" Key mappings for CoC
nnoremap <silent> gd :call CocActionAsync('jumpDefinition')<CR>
nnoremap <silent> gr :call CocActionAsync('jumpReferences')<CR>
nnoremap <silent> gi :call CocActionAsync('jumpImplementation')<CR>
nnoremap <silent> K :call CocActionAsync('doHover')<CR>


" Refresh NERDTree on save
autocmd BufWritePost * NERDTreeRefresh

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


" Use virtual text for diagnostics
setlocal signcolumn=yes
