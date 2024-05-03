local fn = vim.fn
local api = vim.api

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- my setting
vim.cmd([[
set wildmenu
set showcmd
set mouse=
set noswapfile
set nobackup
set nowb
set autoread
set wrap
set encoding=utf-8
set fileencodings=utf-8,cp950
set fileencoding=utf-8
let mapleader = ','
let g:mapleader = ','
syntax on
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
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

" ################## supertab ######################
"let g:SuperTabMappingForeward="<S-Tab>"
"let g:SuperTabRetainCompletionType=2

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

]])

vim.o.background = "light" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use ("wbthomason/packer.nvim") -- Have packer manage itself	

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets
	-- auto formatter
	use("rhysd/vim-clang-format")
	-- nerd tree
	use('scrooloose/nerdtree')
	use('jistr/vim-nerdtree-tabs')
	-- auto fill <>,(,"
	use('docunext/closetag.vim')
	use('tpope/vim-surround')
	use('tpope/vim-repeat')
	-- 移除尾部空白
	use('bronson/vim-trailing-whitespace')
	-- 多種選法修改
	use('terryma/vim-multiple-cursors')
	-- nerd commenter
	use('scrooloose/nerdcommenter')
	-- airline (powerline)
	use('vim-airline/vim-airline')
	use('vim-airline/vim-airline-themes')
	-- enhanced highlight
	use('octol/vim-cpp-enhanced-highlight')
	-- good to search
	use('rking/ag.vim')
	-- ctags indexer
	use('vim-scripts/DfrankUtil')
	use('vim-scripts/vimprj')
	use('vim-scripts/indexer.tar.gz')
	-- easy motion
	use('Raimondi/delimitMate')
	use('easymotion/vim-easymotion')
	-- A - for switching between source and header files
	use('vim-scripts/a.vim')
	-- git ++
	use('iberianpig/tig-explorer.vim')
	use('rbgrouleff/bclose.vim')
	-- show function
	use('vim-scripts/taglist.vim')
	-- supertab for pop mapping
	use('ervandew/supertab')
	-- dir diff
	use('will133/vim-dirdiff')
	-- hexedit
	use('Shougo/vinarise.vim')
	-- extend source
	use('Psychesnet/SrcExpl')
	use('Psychesnet/Trinity')
    -- colorscheme
    use("ellisonleao/gruvbox.nvim")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

