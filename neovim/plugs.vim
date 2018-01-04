call plug#begin('~/.config/nvim/plugged')

" Editing
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'rhysd/vim-clang-format'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang' }

" Colourschemes
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'chriskempson/tomorrow-theme'

call plug#end()
