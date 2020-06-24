"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Set proper color in Vim 
set termguicolors

" Set no highlight after search ends
set nohlsearch

" Vim Plugins Directory call

call plug#begin('~/.vim/plugged')

" -------------
" Vim Plugs go here

    "Bracket surround
        Plug 'tpope/vim-surround'
    "repeat with . for vim-surround
        Plug 'tpope/vim-repeat'
    "coc.vim
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Vim Airline
        Plug 'vim-airline/vim-airline'
    " Fuzzy find 1
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " Fuzzy find 2
        Plug 'junegunn/fzf.vim'
    " Gruvbox theme
        Plug 'morhetz/gruvbox'
    " Sway syntax
        Plug 'terminalnode/sway-vim-syntax'
    " Git stuff
        Plug 'tpope/vim-fugitive'
    " More git stuff
        Plug 'airblade/vim-gitgutter'
    " Commentary plugin
        Plug 'tpope/vim-commentary'

" Vim Plugs end here'

call plug#end()

" -------------

" set Vim-specific sequences for RGB colors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" ALL OF MY KEYBINDINGS GO HERE:

" ----------------------

" Leader = <space>
        let mapleader = "\<Space>"

    " Choose between buffers when hitting leader + b
        nnoremap <leader>b :buffers<CR>:buffer<Space>
    " Edit .vimrc in split pane pressing <leader>ev
        nnoremap <leader>ev <C-w><C-s><C-l>:e ~/.dotfiles/dotfiles/.config/nvim/init.vim<cr>
    " Make new split and switch over to it
        nnoremap <leader>w <C-w><C-s><C-w>j
    " Navigate vim buffers easier 
        nnoremap <C-J> <C-W><C-J>
        nnoremap <C-K> <C-W><C-K>
        nnoremap <C-L> <C-W><C-L>
        nnoremap <C-H> <C-W><C-H>
    " GFiles
        nnoremap <C-p> :Files<CR>

" COC STUFF!

    " Go to definition
        nmap <silent> gd <Plug>(coc-definition)
    " Find references
        nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
        nnoremap <silent> K :call <SID>show_documentation()<CR>

    " Use `[g` and `]g` to navigate diagnostics
        nmap <silent> [g <Plug>(coc-diagnostic-prev)
        nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Functions for coc vim


" ----------------------

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" VARIOUS

"Syntax highlighting

syntax on

" Disable compatibility with Vi
    set nocompatible
" Auto indentation (don't really know what this does, to be honest)
    set autoindent
" Incremental search
    set incsearch
" Case handling while searching
    set ignorecase
    set smartcase
" Set gdefault as default (:s/foo/bar/ = :s/foo/bar/g)
    set gdefault

" (Not only) Python tab stuff (shorter tab, some changes regarding the behaviour of indentation per filetype)

set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
filetype indent on
set modeline
set secure


" Provides tab completion for all file related tasks
set path+=**

" Display all matching files during the auto completion process
set wildmenu

" What have we just enabled?
" > Hit tab to :find by partial match
" > Use * to make it fuzzy search

" :b also let's you open a buffer by specifying it's substring


" Show line numbers
set number

" Leader key show command
set showcmd

" !!!OSX ONLY!!! Use '' in Visual mode to copy to clipboard on OSX
vmap '' :w !pbcopy<CR><CR>

" Undo history!
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undodir " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Settings for the color scheme.
set background=dark    " Setting dark mode
colorscheme gruvbox


" ##################
"
" coc.vim configuration

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
