let mapleader = ' '

" Reread the configuration file
noremap \` :source ~/.config/nvim/init.vim<cr>

" https://github.com/junegunn/vim-plug
" Automatic installation
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" VIM-PLUG
call plug#begin('~/.local/share/nvim/plugged')
    " Configuration
    Plug 'https://github.com/tpope/vim-sensible'

    " Visual
    Plug 'https://github.com/rakr/vim-one'
    Plug 'https://github.com/vim-airline/vim-airline'
    Plug 'https://github.com/Yggdroot/indentLine'
    Plug 'https://github.com/google/vim-searchindex'
    Plug 'https://github.com/plasticboy/vim-markdown'

    " Editing
    Plug 'https://github.com/tpope/vim-repeat'
    Plug 'https://github.com/tpope/vim-commentary'
    Plug 'https://github.com/tpope/vim-surround'
    Plug 'https://github.com/tpope/vim-unimpaired'
    Plug 'https://github.com/tpope/vim-speeddating'

    Plug 'https://github.com/junegunn/vim-peekaboo'
    Plug 'https://github.com/junegunn/vim-easy-align'

    Plug 'https://github.com/vim-scripts/ReplaceWithRegister'
    Plug 'https://github.com/tommcdo/vim-exchange'

    Plug 'https://github.com/terryma/vim-multiple-cursors'

    Plug 'https://github.com/terryma/vim-expand-region'

    Plug 'https://github.com/wellle/targets.vim'
    Plug 'https://github.com/kana/vim-textobj-user'
    Plug 'https://github.com/kana/vim-textobj-entire'

    Plug 'https://github.com/jiangmiao/auto-pairs'
    Plug 'https://github.com/tpope/vim-endwise'

    " Navigation
    Plug 'https://github.com/justinmk/vim-sneak'
    Plug 'https://github.com/easymotion/vim-easymotion'

    " Autocompletion
    Plug 'https://github.com/Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

    " Utilities
    Plug 'https://github.com/scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
    Plug 'https://github.com/junegunn/fzf', {'do': {-> fzf#install()}}
    Plug 'https://github.com/junegunn/fzf.vim'
    " Shellcheck must be installed.
    " https://github.com/koalaman/shellcheck
    Plug 'https://github.com/vim-syntastic/syntastic'

    " Snippets
    Plug 'https://github.com/SirVer/ultisnips'
    Plug 'https://github.com/honza/vim-snippets'

    " Git
    Plug 'https://github.com/airblade/vim-gitgutter'
    Plug 'https://github.com/airblade/vim-rooter'
    Plug 'https://github.com/tpope/vim-fugitive'
call plug#end()

" CONFIGURATION
" Reduce upate time from 4s to 100ms
set updatetime=100
" Copy to a X11 "+ clipboard register
set clipboard=unnamedplus
" Number lines
set number
" Show partial command in status line
set showcmd
" Switch between modified buffers without bang
set hidden
" Insert one space after a '.', '?' and '!' with a join command.
set nojoinspaces

" Search
" Case-insensitive search
set ignorecase
" Case-sensitive if search contains an uppercase letter
set smartcase

" Tab
" Use 4 spaces instead of tab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType typescript setlocal tabstop=2 shiftwidth=2

" Wildmenu
" 'wildmenu' is enabled in 'vim-sensible' plugin.
" Complete till longest common string and start 'wildmenu'.
" If pressing TAB doesn't result in a longer string,
" complete the next full match from wild menu.
" After the last match the original string is used and then the first match again.
set wildmode=longest:full,full

" Folding
set foldlevelstart=99
set foldmethod=syntax
let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1

" VISUAL
set termguicolors
set background=light
colorscheme one
let g:airline_theme='one'
let g:airline_powerline_fonts = 1
let g:indentLine_char = '⎸'

" EASY-ALIGN
" Start interactive EasyAlign in visual mode (e.g. vipga).
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip).
nmap ga <Plug>(EasyAlign)

" VIM-MULTIPLE-CURSORS
let g:multi_cursor_use_default_mapping=0

" VIM-SNEAK
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" DEOPLETE
let g:deoplete#enable_at_startup = 1

" NERDTREE
nnoremap <leader>n :NERDTreeToggle<CR>

" FZF
nnoremap <leader>f :Files<cr>
nnoremap <leader>p :Lines<cr>
nnoremap <leader>e :Buffers<cr>

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ULTISNIPS
" let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

" VIM-GITGUTTER
" Suppress the signs when a file has more than 1000 changes
let g:gitgutter_max_signs = 1000

" MAPPINGS
" Expansion of the active file directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" edit a file in a new buffer
nmap \ew :e %%
" edit a file in a new tab
nmap \et :tabe %%
" edit a file in a horizontal split
nmap \es :sp %%
" edit a file in a vertical split
nmap \ev :vsp %%

" Yank from cursor to end of line like 'C' and 'D'
nnoremap Y y$
