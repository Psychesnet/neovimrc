" (_)_ __ (_) |___   _(_)_ __ ___
" | | '_ \| | __\ \ / / | '_ ` _ \
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|

" ==================== VIM PLUG ==================

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes ''

" auto create tag
Plug 'docunext/closetag.vim'

" autocompletion (also a linter - diagnostics)
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'Shougo/echodoc.vim'

" ale - linter / autocompletion / formatter
Plug 'w0rp/ale'

" auto formatter
Plug 'rhysd/vim-clang-format'

" defx
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'

" quick compiler
Plug 'thinca/vim-quickrun'

" surround vim
Plug 'tpope/vim-surround'

" auto repeat
Plug 'tpope/vim-repeat'

" auto remove space at the end of line
Plug 'bronson/vim-trailing-whitespace'

" auto format
Plug 'Chiel92/vim-autoformat'

" multiple cursors
Plug 'terryma/vim-multiple-cursors'

" nerd commenter
Plug 'scrooloose/nerdcommenter'

" lightline
Plug 'itchyny/lightline.vim'

" enhanced highlight
Plug 'octol/vim-cpp-enhanced-highlight'

" good to search
Plug 'rking/ag.vim'

" quickfix
Plug 'Valloric/ListToggle'

" slumlord
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
Plug 'kevinw/pyflakes-vim'
"Plug 'vim-scripts/pydoc.vim'
Plug 'hdima/python-syntax'

" colorscheme
Plug 'matveyt/vim-modest'
Plug 'sainnhe/vim-color-vanilla-cake'
Plug 'morhetz/gruvbox'

" auto-close (for parenthesis)
" TODO: broken, since clang_complete
"Plug 'jiangmiao/auto-pairs'

" ctrlp
" TODO: learn
" Plug 'kien/ctrlp.vim'

" glsl color
Plug 'tikhomirov/vim-glsl'

" git ++
Plug 'mhinz/vim-signify'
Plug 'iberianpig/tig-explorer.vim'
Plug 'rbgrouleff/bclose.vim'

" show function
Plug 'majutsushi/tagbar'

" debugger
Plug 'vim-scripts/Conque-GDB'

" fuzzy open file
Plug 'Yggdroot/LeaderF'

" supertab for pop mapping
Plug 'ervandew/supertab'

" dir diff
Plug 'will133/vim-dirdiff'

" hexedit
Plug 'Shougo/vinarise.vim'

call plug#end()


" ================ Suggestions ======================

" show wild menu (menu of suggestions) when typing commands in command mode
set path+=**
set wildmenu
set showcmd

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

" clipboard
" copy
"noremap <C-c> "+y
"" paste
"noremap <C-v> "+p
"" cut
"noremap <C-x> "+d
"" paste in insert mode
"inoremap <C-v> <Esc>"+pa

" ================ Visualization ====================

syntax on
set background=light
"colorscheme gruvbox

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
set history=9999

" on some systems the backspace does not work as expected.
" this fixes the problem
set backspace=indent,eol,start

"disable preview window
set completeopt-=preview

" ================ Plugins ==========================

" ################ a.vim ############################
nmap <leader>a :A<CR>

" ################ lightline ##########################


" ################ defx #########################

" ctrl+n open/closes defx
nmap <silent> <Leader>n :Defx <CR>
autocmd FileType defx call s:defx_mappings()

function! s:defx_mappings() abort
  nnoremap <silent><buffer><expr> l     <SID>defx_toggle_tree()                    " 打开或者关闭文件夹，文件
  nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')     " 显示隐藏文件
  nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
endfunction

function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
endfunction

call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'toright',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })

" ################# tagbar ##########################
nmap <Leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
"let g:tagbar_ctags_bin = '~/git/ctags-5.8/ctags'

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

" ################ YouCompleteMe ####################

let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_use_ultisnips_completer = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_strings=1
set completeopt=menu,menuone

" 对指定源文件，输入两个字母后即触发语义补全
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }

let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "python":1,
            \ "sh":1,
            \ "zsh":1,
            \ }

let g:ycm_filetype_blacklist = {
            \ 'markdown' : 1,
            \ 'text' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \}

" ################ echodoc ##########################
set cmdheight=2
let g:echodoc_enable_at_startup = 1

" ################ Ale ##############################

" autocompletion
let g:ale_completion_enabled = 1

let g:ale_cpp_clang_executable = 'clang++-5.0'

" linter
let g:ale_linters = {
            \   'cpp': ['clang']
            \}
let g:ale_cpp_clang_options = '-std=c++1z -O0 -Wextra -Wall -Wpedantic -I /usr/include/eigen3'
"let g:ale_cpp_clangtidy_options = '-checks="cppcoreguidelines-*"'
"let g:ale_cpp_cpplint_options = ''
"let g:ale_cpp_gcc_options = ''
"let g:ale_cpp_clangcheck_options = ''
"let g:ale_cpp_cppcheck_options = ''


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

" shortcuts for autoformatting the entire file: Ctrl+j
inoremap <C-j> <Esc>:ClangFormat<CR>a
nnoremap <C-j> <Esc>:ClangFormat<CR>

" ################ auto format ######################
noremap <leader>i :Autoformat<CR>
let g:formatdef_autopep8 = "'autopep8 - --range '.a:firstline.' '.a:lastline"
let g:formatters_python = ['autopep8']

" ################ multiple cursor #################
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" ################ listToggle #######################
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

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

" ############### quick run #########################
let g:quickrun_config = {
            \   "_" : {
            \       "outputter" : "message",
            \   },
            \}

let g:quickrun_config['plantuml'] = {
            \  'command': 'plantuml'
            \, 'exec': ['%c %s', 'open %s:p:r.png']
            \, 'outputter': 'null'
            \}

let g:quickrun_no_default_key_mappings = 1
nmap <Leader>r <Plug>(quickrun)
map <F10> :QuickRun<CR>

" ############## gdb ###############################
"待除錯檔案位於螢幕上方
let g:ConqueGdb_SrcSplit = 'above'
"儲存歷史
let g:ConqueGdb_SaveHistory = 1
"修改Conque GDB的Leader鍵
let g:ConqueGdb_Leader = ';'
"總是顯示顏色
let g:ConqueTerm_Color = 2
"程式結束執行時，關閉Conque GDB視窗
let g:ConqueTerm_CloseOnEnd = 1
"Conque Term配置錯誤時顯示警告資訊
let g:ConqueTerm_StartMessages = 0
let g:ConqueGdb_GdbExe = '/home/erihsi/git/dev1/src/chk/bs_br/output/host/bin/aarch64-linux-gdb'
nnoremap \g  :ConqueGdb -q -x debugOCD.gdb <CR>

"Keyboard Mapping	Function
"",r	Run program
"",c	Continue program
"",n	Next line
"",s	Step line
"",p	Print identifier under cursor
"",b	Set break point
"",d	Delete break point
"",f	Finish
"",t	Backtrace

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
let g:vinarise_enable_auto_detect = 1
