call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
"Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'wincent/command-t'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'drmikehenry/vim-fontsize'
Plug 'mattn/emmet-vim'
Plug 'tribela/vim-transparent'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

syntax enable
:set background=dark
colorscheme gruvbox

:set number
:set relativenumber
:set encoding=UTF-8
:set wildignore+=*/node_modules
:set shell=/bin/bash
:set showcmd
:set cursorline
:set mouse=a
:set updatetime=100

let g:neoformat_try_node_exe = 1
let NERDTreeShowHidden=1

let g:airline_theme='wombat'

command! -nargs=0 F :CocCommand prettier.forceFormatDocument 
command! -nargs=0 EF :CocCommand eslint.executeAutofix
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :cal CocActionAsync('runCommand', 'editor.action.organizeImport')
nnoremap <leader>s :CocCommand prettier.forceFormatDocument<CR>:w<CR>
nnoremap <leader>f :Files<CR>
nmap <silent>nf :NERDTreeFind<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"nmap <silent> ef :CocCommand eslint.executeAutofix<CR>
"nmap <silent> pr :CocCommand prettier.forceFormatDocument<CR>

let $FZF_DEFAULT_OPTS="--preview-window 'right:57%' --preview 'bat --style=numbers --line-range :300 {}'
\ --bind ctrl-y:preview-up,ctrl-e:preview-down,
\ctrl-b:preview-page-up,ctrl-f:preview-page-down,
\ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,
\shift-up:preview-top,shift-down:preview-bottom,
\alt-up:half-page-up,alt-down:half-page-down"

inoremap jj <esc>
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <C-a> :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-r> :lua require("harpoon.mark").clear_all()<CR>
nnoremap <C-n> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <C-g> :lua require("harpoon.mark").rm_file()<CR>
nnoremap <leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==

let g:neovide_fullscreen=v:true
let g:neovide_profiler=v:true
