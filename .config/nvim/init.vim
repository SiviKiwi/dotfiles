""""""" Plugin management stuff """""""
set nocompatible
filetype plugin on
syntax on


set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'

" Custom plugins...
" EasyMotion - Allows <leader><leader>(b|e) to jump to (b)eginning or (end)
" of words.
Plugin 'easymotion/vim-easymotion'
" Ctrl-P - Fuzzy file search
Plugin 'kien/ctrlp.vim'
" Neomake build tool (mapped below to <c-b>)
" Plugin 'benekastah/neomake'

" Autocomplete for python
Plugin 'davidhalter/jedi-vim'

Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


" Remove extraneous whitespace when edit mode is exited
Plugin 'thirtythreeforty/lessspace.vim'

" LaTeX editing
Plugin 'skywind3000/asyncrun.vim'

" Status bar mods
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'


" After all plugins...
call vundle#end()
" filetype plugin indent on

""""""" Jedi-VIM """""""
" Don't mess up undo history
let g:jedi#show_call_signatures = "0"


""""""" SuperTab configuration """""""
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
function! Completefunc(findstart, base)
    return "\<c-x>\<c-p>"
endfunction

"call SuperTabChain(Completefunc, '<c-n>')

"let g:SuperTabCompletionContexts = ['g:ContextText2']


""""""" General coding stuff """""""
" Highlight 80th column
" set colorcolumn=80
" Always show status bar
set laststatus=2
" Let plugins show effects after 500ms, not 4s
set updatetime=500
" Disable mouse click to go to position
set mouse-=a
" Don't let autocomplete affect usual typing habits
set completeopt=menuone,preview,noinsert
" Let vim-gitgutter do its thing on large files
let g:gitgutter_max_signs=10000

" If your terminal's background is white (light theme), uncomment the following
" to make EasyMotion's cues much easier to read.
" hi link EasyMotionTarget String
" hi link EasyMotionShade Comment
" hi link EasyMotionTarget2First String
" hi link EasyMotionTarget2Second Statement

""""""" Python stuff """""""
" syntax enable
set number showmatch
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
let python_highlight_all = 1
let g:deoplete#enable_at_startup = 1

""""""" Keybindings """""""
" Set up leaders
let mapleader=","
let maplocalleader="\\"

" Start Async latexmk
nnoremap <Leader><space> :AsyncRun latexmk -pvc -pdf %<CR>



" Arrow keys up/down move visually up and down rather than by whole lines.  In
" other words, wrapped lines will take longer to scroll through, but better
" control in long bodies of text.
" NOTE - Disabled since <leader><leader>w|e|b works well with easymotion
"noremap <up> gk
"noremap <down> gj

" Neomake and other build commands (ctrl-b)
" nnoremap <C-b> :w<cr>:Neomake<cr>

autocmd BufNewFile,BufRead *.tex,*.bib noremap <buffer> <C-b> :w<cr>:new<bar>r !make<cr>:setlocal buftype=nofile<cr>:setlocal bufhidden=hide<cr>:setlocal noswapfile<cr>
autocmd BufNewFile,BufRead *.tex,*.bib imap <buffer> <C-b> <Esc><C-b>
