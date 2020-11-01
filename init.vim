call plug#begin("~/.vim/plugged")

" Plugin Section
Plug 'morhetz/gruvbox', { 'as': 'gruvbox' }
Plug 'justinmk/vim-sneak'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'posva/vim-vue'
Plug 'itchyny/lightline.vim'
Plug 'vifm/vifm.vim'
call plug#end()

" Config Section
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme gruvbox


"open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
 split term://bash 
 resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
	  \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	  \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \ }
function! LightlineFilename()
	return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" Use auocmd to force lightline update
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" <leader>s for Rg search
noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
	\ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always'.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
	\           : fzf#vim#with_preview('right:50%:hidden', '?'),
	\   <bang>0)

" Completion
set cmdheight=2
set updatetime=300

" Use 4 space tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab

" GUI SETTINGS
set guioptions-=T
set vb t_vb=
set ttyfast
set number
set backspace=indent,eol,start
set hls is
set laststatus=2
set cursorline

" Use <TAB> for selections ranges.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" SHORTCUTS
let mapleader = "\<Space>"
nnoremap <C-s> :w<cr>
nnoremap <Space> :EditVifm .<cr>
nnoremap Q <nop>
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

xnoremap K :move '<-2<cr>gv-gv
xnoremap J :move '>+1<cr>gv-gv
