" Spelling
augroup LatexFile
  autocmd!
  autocmd FileType tex setlocal spell spelllang=en_ca
  autocmd User VimtexEventQuit VimtexClean
augroup END

" Nvim
set termguicolors
set clipboard=unnamed

" Rememebr previous line
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Realign buffers when iterm goes fullscreen
augroup FixProportionsOnResize
  au!
  au VimResized * exe "normal! \<c-w>="
augroup END

" Center comments.
nnoremap <C-b> :center 80<cr>hhv0r#A<space><esc>40A#<esc>d80<bar>YppVr#kk.

" Classics
syntax on
set number
set ruler
set wrap 
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set textwidth=80
filetype plugin on
nnoremap <silent> <C-l> :nohl<CR><C-l>
xnoremap p "_dP

" Terminal escape
:tnoremap <Esc> <C-\><C-n>
