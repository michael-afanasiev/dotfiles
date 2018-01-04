" Clang format
let g:clang_format#command = '/usr/local/opt/llvm/bin/clang-format'

" Vimtex
let g:tex_flavor = "latex"
let g:vimtex_latex_progname = 'nvr'
let g:vimtex_latexmk_build_dir = 'build'
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
let g:vimtex_compiler_latexmk = {'build_dir' : 'build'}
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_latexmk_options = '-pdf -shell-escape -verbose -file-line-error -synctex=1 -interaction=nonstopmode'

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '/Users/mafanasiev/.config/dotfiles/ycm_extra_conf_global.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
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

" Nerd commenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1

" CppHighlighter
let g:cpp_experimental_template_highlight = 1

" Clang-rename
noremap <leader>cr :pyf /usr/local/opt/llvm/bin/clang-rename

