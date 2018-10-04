call plug#begin('~/.config/nvim/bundle')
Plug 'w0rp/ale'
Plug 'janko-m/vim-test'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-rails'
Plug 'godlygeek/tabular'
Plug 'mattn/emmet-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'keith/rspec.vim'
Plug 'tpope/vim-surround'
Plug 'derekprior/vim-trimmer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-obsession'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'posva/vim-vue'
Plug 'tpope/vim-abolish'
Plug 'Yggdroot/indentLine'
Plug 'rlue/vim-fold-rspec'
Plug 'mhinz/vim-signify'
Plug 'wakatime/vim-wakatime'
Plug 'mhinz/vim-startify'
call plug#end()


let mapleader = " "
set backspace=2   " Backspace deletes like most programs in insert mode
color dracula
set background=dark
set autowrite     " Automatically :write before running commands
set laststatus=2  " Always display the status line
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
" dISplay extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces
set rnu

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <leader>h :vertical resize -40<CR>
nnoremap <leader>l :vertical resize 40<CR>
nnoremap <leader>k :resize -40<CR>
nnoremap <leader>j :resize 40<CR>

nnoremap <leader>f :Files<CR>
" Switch between the last two files
" nnoremap <leader><leader> <c-^>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" copy
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>


" Escape to exit terminal mode
tnoremap <silent> <Esc> <C-\><C-n>

nnoremap <leader>r :split term://sudo pkill -USR2 -f 'puma'<CR>

" Navigate out of terminal mode splits
tnoremap <silent> <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
tnoremap <silent> <C-j> <C-\><C-n>:TmuxNavigateDown<CR>
tnoremap <silent> <C-k> <C-\><C-n>:TmuxNavigateUp<CR>
tnoremap <silent> <C-l> <C-\><C-n>:TmuxNavigateRight<CR>

" Enter terminal insert mode as soon as I enter a terminal split
autocmd BufEnter term://* startinsert

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction


autocmd! User FzfStatusLine call <SID>fzf_statusline()


let g:airline#extensions#tabline#enabled = 1

let g:fixmyjs_engine = 'eslint'
let g:fixmyjs_rc_path = '~/.eslintrc.js'

map <Leader> <Plug>(easymotion-prefix)

" NERDTree mapping
map <leader>1 :NERDTreeToggle<CR>
map <leader>2 :NERDTreeFind<CR>

au BufNewFile,BufRead *.json.jbuilder set ft=ruby syn=ruby

nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>t :TestNearest<CR>
let test#strategy = 'neovim'
let test#ruby#rspec#options = '--profile --format documentation'

set timeoutlen=1000 ttimeoutlen=0

autocmd FileType ruby nnoremap<buffer> <leader>wtf Orequire "pry";binding.pry
autocmd FileType javascript nnoremap<buffer> <leader>wtf Odebugger;
autocmd FileType vue nnoremap<buffer> <leader>wtf Odebugger;

autocmd FileType vue syntax sync fromstart

let g:ale_fixers = { 'javascript': ['eslint', 'prettier'], 'ruby': ['rubocop'], 'vue': ['eslint', 'prettier']}
let g:ale_linters = {'javascript': ['eslint', 'prettier']}

hi def link jsObjectKey Identifier

if has("gui_vimr")
" VimR specific settings like
  set termguicolors
endif

let g:fold_rspec_foldlevel = 4       " sets initial open/closed state of all folds (open unless nested more than two levels deep)
let g:fold_rspec_foldcolumn = 2
let g:fold_rspec_foldclose = 'all'   " closes folds automatically when the cursor is moved out of them (only applies to folds deeper than 'foldlevel')
let g:fold_rspec_foldminlines = 3    " disables closing of folds containing two lines or fewer


"" Mapping selecting mappings Mapp
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

set undodir=~/.config/nvim/undodir
