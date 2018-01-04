" Vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'lervag/vimtex'                                                      " Latex
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang' } " Autocomplete
Plug 'scrooloose/nerdcommenter'                                           " Comments
Plug 'scrooloose/nerdtree'                                                " Project tree
Plug 'ctrlpvim/ctrlp.vim'                                                 " Open files
Plug 'vim-airline/vim-airline'                                            " Status line
Plug 'morhetz/gruvbox'                                                    " Colour scheme
Plug 'chriskempson/tomorrow-theme'                                        " Colour scheme
Plug 'vim-scripts/DoxygenToolkit.vim'                                     " Doxygen
Plug 'rhysd/vim-clang-format'                                             " Clang format
Plug 'mhartington/oceanic-next'                                           " Colour theme
call plug#end()

" Clang format
let g:clang_format#command = '/usr/local/opt/llvm/bin/clang-format'

" Vimtex
let g:tex_flavor = "latex"
let g:vimtex_latex_progname = 'nvr'
let g:vimtex_latexmk_build_dir = 'build'
let g:vimtex_compiler_latexmk = {'build_dir' : 'build'}
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_latexmk_options = '-pdf -shell-escape -verbose -file-line-error -synctex=1 -interaction=nonstopmode'

" This adds a callback hook that updates Skim after compilation
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
let g:ycm_global_ycm_extra_conf = '/Users/mafanasiev/.config/dotfiles/ycm_extra_conf_global.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
      \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
      \ 're!\\hyperref\[[^]]*',
      \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\(include(only)?|input){[^}]*',
      \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
      \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
      \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
      \ ]
nnoremap ,ff :YcmCompleter FixIt<CR>

" Colour scheme
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext" 
" colorscheme Tomorrow-Night-Eighties
" colorscheme gruvbox
" let g:gruvbox_italic=1
" set background=light

" Nerd commenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1

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

" Clang-rename
noremap <leader>cr :pyf /usr/local/opt/llvm/bin/clang-rename

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

" Functions
function! UpdateSkim(status)
  if !a:status | return | endif
  let l:out = b:vimtex.out()
  let l:tex = expand('%:p')
  let l:cmd = [g:vimtex_view_general_viewer, '-r']
  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif
  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
  else
    call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
  endif
endfunction
