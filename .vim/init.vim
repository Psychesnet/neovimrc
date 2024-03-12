        " (_)_ __ (_) |___   _(_)_ __ ___
    " | | '_ \| | __\ \ / / | '_ ` _ \
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|

" ==================== VIM PLUG ==================

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes ''

" lang service
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" 自動填<>
Plug 'docunext/closetag.vim'

" auto formatter
Plug 'rhysd/vim-clang-format'

" nerd tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'

" 自動填(
Plug 'tpope/vim-surround'

" 自動補"
Plug 'tpope/vim-repeat'

" 移除尾部空白
Plug 'bronson/vim-trailing-whitespace'

" 多種選法修改
Plug 'terryma/vim-multiple-cursors'

" nerd commenter
Plug 'scrooloose/nerdcommenter'

" airline (powerline)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" enhanced highlight
Plug 'octol/vim-cpp-enhanced-highlight'

" good to search
Plug 'rking/ag.vim'

" UML
Plug 'scrooloose/vim-slumlord'

" ctags indexer
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'
Plug 'vim-scripts/indexer.tar.gz'

" UltiSnips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" easy motion
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'

" A - for switching between source and header files
Plug 'vim-scripts/a.vim'

" for python
Plug 'hdima/python-syntax'

" glsl color
Plug 'tikhomirov/vim-glsl'

" git ++
Plug 'iberianpig/tig-explorer.vim'
Plug 'rbgrouleff/bclose.vim'

" show function
Plug 'vim-scripts/taglist.vim'

" fuzzy open file
Plug 'Yggdroot/LeaderF'

" supertab for pop mapping
Plug 'ervandew/supertab'

" dir diff
Plug 'will133/vim-dirdiff'

" hexedit
Plug 'Shougo/vinarise.vim'

" extend source
Plug 'Psychesnet/SrcExpl'
Plug 'Psychesnet/Trinity'

call plug#end()


" ================ Suggestions ======================

" show wild menu (menu of suggestions) when typing commands in command mode
set path+=**
set wildmenu
set showcmd
set mouse=

" ================ File management ==================

" Turn off swap files
set noswapfile
set nobackup
set nowb

" TODO: improve behaviour
" reload files changed outside vim
set autoread
" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
            \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


" ================ Srolling =========================

" Start scrolling when we're 8 lines away from margins
set scrolloff=8

" auto wrap
set wrap

" ================ Encoding =========================
set encoding=utf-8
set fileencodings=utf-8,cp950
set fileencoding=utf-8

" ================ Keyboard bindings ================

" noremap - no recursive mapping
" 修改leader键
let mapleader = ','
let g:mapleader = ','

" ================ Visualization ====================

syntax on
set background=light
colorscheme gruvbox
hi DiffAdd cterm=NONE gui=NONE ctermfg=2 guifg=#719e07 ctermbg=7 guibg=#eee8d5
hi DiffChange cterm=NONE gui=NONE ctermfg=3 guifg=#b58900 ctermbg=7 guibg=#eee8d5
hi DiffDelete cterm=NONE gui=NONE ctermfg=1 guifg=#dc322f ctermbg=7 guibg=#eee8d5
hi DiffText cterm=NONE gui=NONE ctermfg=4 guifg=#268bd2 ctermbg=7 guibg=#eee8d5
hi Directory cterm=NONE gui=NONE ctermfg=4 guifg=#268bd2 ctermbg=NONE guibg=NONE

" enable 256bit colors - also: override gnome-terminal's settings
"set t_Co=256

" ================ Indentation ======================

set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

" ================ Number column ====================

" numbers
"set number " see the line number column

" Toggle relative numbering, and set to absolute on loss of focus or insert mode
"autocmd InsertEnter * :set nornu
"autocmd InsertLeave * :set rnu
"" we don't want to see relative numbering while debugging
"" debugger uses its own window, so we can disable rnu when source window loses
"" focus
"autocmd BufLeave * :set nornu
"autocmd BufEnter * call SetRNU()
"function! SetRNU()
"if(mode()!='i')
"set rnu
"endif
"endfunction


" ================ Searching ========================

nmap <Leader>c :!ctags -R --exclude=.git --fields=+l . <CR>
" ctrl+] on ctags
set tags=./tags;,.tags
nmap <leader>s :checkhealth <CR>

" Ignorecase when searching
set ignorecase

" incremental search - Vim starts searching when we start typing
set incsearch

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

set ruler        " 顯示右下角設定值
set ic           " 設定搜尋無識大小寫
set ru           " 第幾行第幾個字
highlight Search term=reverse ctermbg=green ctermfg=black

set confirm      " 操作過程有衝突時，以明確的文字來詢問
"set cursorline   " 顯示目前的游標位置

" jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif

set nocompatible              " be iMproved, required
filetype on                   " required

set foldenable
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" ================ Performance ======================

set mouse=
" fix slow scrolling that occurs when using mouse and relative numbers
set lazyredraw
" vim timeout (forgot why I need this or if I do at all)
set ttyfast
set ttimeoutlen=10

" ================ Misc =============================

" highlight matching braces
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=0

" When the last window will have a status line (2 = always)
set laststatus=2

" history
set history=1000

" on some systems the backspace does not work as expected.
" this fixes the problem
set backspace=indent,eol,start

" disable preview window
set completeopt-=preview

" on/off show line
function! NumberToggle()
  if(&number == 1)
    set nonu
  else
    set nu
  endif
endfunc
nnoremap <leader>x :call NumberToggle()<cr>

" ================ Plugins ==========================

" ################ a.vim ############################
nmap <leader>a :A<CR>

" ################ Airline ##########################

" vim airline fonts
if !exists('g:airline_symbols')
    let g:airline_symbols= {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='light'

" ################ NERDTree #########################

" shift+i (show hidden files)

" ctrl+n open/closes nerd tree
noremap <leader>n :NERDTreeToggle<CR>

" high light
let NERDTreeHighlightCursorline=1

" quit nerd tree on file open
let g:NERDTreeQuitOnOpen = 1

" show nerd tree always on the right instead on the left
let g:NERDTreeWinPos = "right"

" how to open window
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'

" ################## NERDTreeTab #####################
"map <Leader>n <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_synchronize_view=0
let g:nerdtree_tabs_synchronize_focus=0
"let g:nerdtree_tabs_open_on_console_startup=1

" ################# tagbar ##########################
nmap <Leader>t :TlistToggle<CR>
let g:Tlist_GainFocus_On_ToggleOpen= 1
" let g:Tlist_Ctags_Cmd = '~/git/ctags-5.8/ctags'

" ################ Clang format #####################

" Clang format - auto formatting

let g:clang_format#command = 'clang-format-3.8'
let g:clang_format#style_options = {
            \ "BreakBeforeBraces" : "Attach",
            \ "UseTab" : "Never",
            \ "IndentWidth" : 4,
            \ "ColumnLimit" : 100,
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AllowShortFunctionsOnASingleLine" : "false",
            \}

" Toggle auto formatting:
autocmd FileType c,cpp ClangFormatAutoEnable

" ################ multiple cursor #################
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" ################ Easymotion #######################
let g:EasyMotion_smartcase = 1
let g:EasyMotion_leader_key='<Space>'

" ################# delimitMate #####################
let b:delimitMate_nesting_quotes = ['"']

" ################ CTAGS ############################

" TODO: learn more about this plugin and improve it

" change the stack pop to a more comfortable mapping
nnoremap <C-e> <C-]>

" CTAGS indexer
let g:indexer_disableCtagsWarning = 1


" TODO: add (cmake) project support
" TODO: add debugger support

" ################ UltiSnips ########################

" make a dir Ultisnips in: '~/.config/nvim/UltiSnips/'
" and put your snippets in there
" eg. cpp.snippets

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<up>"
let g:UltiSnipsSnippetDirectories  = ['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/plugged/vim-snippets/UltiSnips'
let g:UltiSnipsUsePythonVersion = 3
" 进入对应filetype的snippets进行编辑
map ,us :UltiSnipsEdit<CR>

" ################ AG ###############################
" window size
let g:ag_qhandler="copen 40"

"start a search query by pressing \
nnoremap \\  :Ag!<space>

"search for word under cursor by pressing |
nnoremap \| :Ag! "\b<C-R><C-W>\b"<cr>:cw<cr>

" ################## dirdiff ######################
map <leader>d :DirDiff<space>

" ############### closetag ##########################
let g:closetag_html_style=1

" ############### vim-trailing-whitespace ###########
map <leader><space> :FixWhitespace<cr>

" ############# git ################################
" open tig with Project root path
nnoremap <Leader>g :TigOpenProjectRootDir<CR>

" ############### leaderF #########################
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

" ################## supertab ######################
let g:SuperTabMappingForeward="<S-Tab>"

" ################## vinarise ######################
let g:vinarise_enable_auto_detect = 0

" ################# Src Extend ####################
" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 70

" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100

" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"

" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"

" // In order to avoid conflicts, the Source Explorer should know what plugins except
" // itself are using buffers. And you need add their buffer names into below list
" // according to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_",
        \ "Source_Explorer"
    \ ]

" // The color schemes used by Source Explorer. There are five color schemes
" // supported for now - Red, Cyan, Green, Yellow and Magenta. Source Explorer
" // will pick up one of them randomly when initialization.
let g:SrcExpl_colorSchemeList = [
        \ "Red",
        \ "Cyan",
        \ "Green",
        \ "Yellow",
        \ "Magenta"
    \ ]

" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1

" // Workaround for Vim bug @https://goo.gl/TLPK4K as any plugins using autocmd for
" // BufReadPre might have conflicts with Source Explorer. e.g. YCM, Syntastic etc.
let g:SrcExpl_nestedAutoCmd = 1

" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" // create/update the tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

" // Set "<F3>" key for displaying the previous definition in the jump list
let g:SrcExpl_prevDefKey = "<F3>"

" // Set "<F4>" key for displaying the next definition in the jump list
let g:SrcExpl_nextDefKey = "<F4>"

" ##################### trinity ######################
nmap <leader>e  :TrinityToggleAll<CR>

