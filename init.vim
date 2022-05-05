"====[  TODO  ]
" set up easyallign
" show marks -> should be much faster now
" TESTS
" All plugins 
"" Suggestions
" MAP g to t

"" Mappings to remember

"Zt
"Zb



"====[  Preferences  ]
set number
set relativenumber
set title
set clipboard=unnamedplus
set autochdir
set formatoptions-=cro
set updatetime=3000
" set signcolumn=number



" Folds
set foldopen=search
set foldopen+=jump
nnoremap zz zzzO
set foldenable
set foldminlines=0

set linebreak

"open slits
set splitright
set splitbelow

" Spell check
set nospell spelllang=en_us
nnoremap <silent> <F6> :set invspell<cr>
inoremap <silent> <F6> <C-O>:set invspell<cr>

syntax on
filetype plugin on
nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader='\' 

" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
" set laststatus=2
  
nnoremap # :w!<CR>
nnoremap @ :q<CR>
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

"" Fixing deleting and cutting
" Make d map to the black hole
noremap d "_d
noremap dd "_dd
noremap D "_D
noremap x d
noremap X D
nnoremap <Del> "_d 
vnoremap <Del> "_d 

"" System and environment
let &t_TI = ""
let &t_TE = ""
set encoding=utf-8

"" Tabs/indenting
set tabstop=4      "Tab indentation levels every four columns
set shiftwidth=4   "Indent/outdent by four columns
set expandtab      "Convert all tabs that are typed into spaces
set shiftround     "Always indent/outdent to nearest tabstop
set smarttab       "Use shiftwidths at left margin, tabstops everywhere else

"" Search
set incsearch       "Lookahead as search pattern is specified
set ignorecase      "Ignore case in all searches...
set smartcase       " ...unless uppercase letters used

set hlsearch
highlight clear Search
highlight       Search    ctermfg=White  ctermbg=Black  cterm=bold
highlight    IncSearch    ctermfg=Black  ctermbg=White    cterm=bold

""" Saving, exiting & reloading
noremap <leader>sv :source $MYVIMRC<CR>
"noremap <leader>sv :source $MYVIMRC<CR>:AirlineRefresh<CR>
"====[  Plugins  ]
"" Include plugins
call plug#begin()
""" MISC
Plug 'github/copilot.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-startify'
Plug 'phaazon/hop.nvim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-obsession'
"Plug 'tmhedberg/SimpylFold'
" NOTE add: the ~/tmp folder
Plug 'julienr/vim-cellmode'

""" Checking/linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'dense-analysis/ale'

""" Python
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'preservim/nerdcommenter'
Plug 'abarker/cyfolds'
""" Cpp
Plug 'bfrg/vim-cpp-modern'
Plug 'jackguo380/vim-lsp-cxx-highlight'
""" Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/vimux'
Plug 'edkolev/tmuxline.vim'

""" YCM
" Plug 'tabnine/YouCompleteMe.git'
" Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}

""" Snips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

""" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

""" history, undos, git...
Plug 'mbbill/undotree'
Plug 'chrisbra/changesPlugin'
""" Colors, highlights etc
Plug 'agude/vim-eldar'
Plug 'marko-cerovac/material.nvim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
""" Bar/tabs
"Plug 'kyazdani42/nvim-web-devicons'
"Plug 'romgrk/barbar.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Plug 'adelarsq/neoline.vim'
""" Fonts/icons (should be last)
Plug 'ryanoasis/vim-devicons'

call plug#end()


"" Plugin setup
""NOTE: Not all plugins are configured here
""" Copilot
imap <silent><script><expr> <Right> copilot#Accept("\<CR><Esc>")
imap <silent><C-Right> <Plug>(copilot-next)
" imap <silent><Down> <Plug>(copilot-previous)

let g:copilot_enabled = v:true

let g:copilot_no_tab_map = v:true

""" Nerdcommenter
map åå <plug>NERDCommenterInvert
map åz <plug>NERDCommenterSexy
map åy <plug>NERDCommenterYank

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

""" FZF 
"noremap <leader>. :Files ./<CR>
"noremap <leader>~ :Files ~/<CR>
" Insert mode completion TODO
imap <c-w> <plug>(fzf-complete-word)
imap <c-f> <plug>(fzf-complete-path)
tmap <c-v> p

nnoremap g.. :cd ..
nnoremap g.a :Ag <CR>
" nnoremap gc :Files ./<CR>
nnoremap gC :Files ~<CR>
"noremap g* yiw:Ag<CR><C-v>

nnoremap <expr> <C-f> (len(system('git rev-parse')) ? ':Files ./' : ':GFiles --exclude-standard --others --cached')."\<cr>"


function! s:fzf_statusline()
	" Override statusline as you like
	highlight fzf1 ctermfg=161 ctermbg=251
	highlight fzf2 ctermfg=23 ctermbg=251
	highlight fzf3 ctermfg=237 ctermbg=251
	setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

"autocmd! User FzfStatusLine call <SID>fzf_statusline()


let g:fzf_action = {
            \ 'ctrl-s': 'tab split',
            \ 'left': 'split',
            \ 'right': 'vsplit'}

""" Ale
" let b:ale_linters = ['flake8', 'pylint', 'cc', 'cpplint', 'cmakelint']
" let b:ale_fixers = ['autopep8', 'yapf']
" Disable warnings about trailing whitespace for Python files.
" let b:ale_warn_about_trailing_whitespace = 0
" noremap <F8> :let g:ale_open_list = 1
" let g:ale_list_window_size = 5

""" Startify
let g:startify_bookmarks = [ '.config/nvim/init.vim', '.config/i3/config', '~/.zshrc']

""" Vimux
let g:cellmode_use_tmux=1

""" vim-cellmode
let g:cellmode_tmux_panenumber='1'
let b:cyfolds_suppress_insert_mode_switching='1'
""" Restore view
" set viewoptions=cursor,folds,slash,unix

""" coc
"Map enter to coc action
nnoremap <CR> :CocAction<CR>

inoremap <silent><expr> <c-space> coc#refresh()
" GoTo code navigation.
nmap <silent> gD <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gI <Plug>(coc-declaration)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> ge <plug>(coc-diagnostic-next-error) 



""" NERDCommenter



""" Tmux

"====[  Mappings due to keyboard layout  ]

"" Basic qwerty to Colemak mappings
nnoremap n h
nnoremap e j
nnoremap i k
""Go Right and open folds if you are on a fold
"" Make a silent nnoremap for o

"" Try to open fold if you are on a fold and catch if you are not
function! OpenFoldOrRight()
    try
        execute "normal! zo"
    catch
        ""execute "normal! l"
    finally
        execute "normal! l"
    endtry
endfunction

nnoremap <silent> o :call OpenFoldOrRight()<CR>

nnoremap u i
nnoremap U I

noremap l u
noremap L U


noremap M N
"" Strange mappings
nnoremap % "
nnoremap ^ %
noremap ` o
noremap — o<Esc>
noremap – O
noremap Ö O<Esc>

" Repeat previous motion f/t motion


noremap $ ;



"===[ Mappings due to TMUX ]
nnoremap <C-B> <C-O>zz
nnoremap <C-K> <C-I>zz


"====[  Navigation mappings  ]
"" HOP
lua require'hop'.setup { keys = 'tnesiroalpmvufwxqz', jump_on_sole_occurrence = true }

" lua vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
" lua vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
" lua vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})
" lua vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})

lua vim.api.nvim_set_keymap('n', '$', "<cmd>lua require'hop'.hint_char1({current_line_only = false })<cr>", {})

lua vim.api.nvim_set_keymap('o', '$', "<cmd>lua require'hop'.hint_char1({current_line_only = false })<cr>", {})

lua vim.api.nvim_set_keymap('v', '$', "<cmd>lua require'hop'.hint_char1({current_line_only = false, inclusive_jump = true })<cr>", {})


lua vim.api.nvim_set_keymap('n', '-', "<cmd>lua require'hop'.hint_char1({current_line_only = false })<cr>", {})

lua vim.api.nvim_set_keymap('v', '-', "<cmd>lua require'hop'.hint_char1({current_line_only = false })<cr>", {})

lua vim.api.nvim_set_keymap('o', '-', "<cmd>lua require'hop'.hint_char1({current_line_only = false })<cr>", {})



"" Cursor movement
nnoremap Zt H
nnoremap Zz M
nnoremap Zb L

"" Go to begining of line
"" -> You never start motions with 0 or 1 jumps, do you?
nnoremap 0 $
nnoremap A ^

noremap { }
noremap } {

"" Words, characters, sentences and motions
nnoremap G Gzz
"
" Top layear
nnoremap O W
nnoremap N B
nnoremap " gE
nnoremap ' E


"" Navigation within a file

nnoremap <C-i> <C-u>
nnoremap <C-e> <C-d>

"" Window and tab navigation
nnoremap <Right> :wincmd l<CR>
nnoremap <Left> :wincmd h<CR>
nnoremap <Up> :wincmd k<CR>
nnoremap <Down> :wincmd j<CR>

nnoremap <Home> gT
nnoremap <End> gt



" Depricated 13. April
" nnoremap <Right> gt
" nnoremap <Left> gT

""  Create a new and empty tab
nnoremap <Leader>t :tabnew<CR>

"====[ Formatting ]
""" Windows

nnoremap Ð <C-w>_ 
nnoremap Þ <C-w>|
nnoremap ð <C-w>=

nnoremap <C-w>n <C-w>H
nnoremap <C-w>e <C-w>J
nnoremap <C-w>i <C-w>K
nnoremap <C-w>o <C-w>L



"====[  Modes  ]
"" Normal mode
""" Colemak remapping

""" Text editing
nnoremap j J
nnoremap J gJ



"" Insert (including transitions to and from insert)
autocmd InsertEnter,InsertLeave * set cul!
""" Enter insert
noremap ; A

""" Exit insert

" Automatic exit of insert mode
au CursorHoldI * stopinsert
au InsertEnter * let updaterestore=&updatetime | set updatetime=10000
au InsertLeave * let &updatetime=updaterestore

"" Replace

nnoremap <silent> <C-p> :set opfunc=SpecialChange<CR>g@

function! SpecialChange(type)
    silent exec 'normal! "_d`[v`]'
    silent exec 'normal! p'
endfunction


"" Visual mode

vnoremap n h
vnoremap e j
vnoremap i k
vnoremap o l

"Switch enter visual and enter block
noremap v <C-v>
noremap _ v
"Make DS/DEL work as expected in visual modes
xmap <BS> x

vnoremap u I
"vnoremap ; i

vnoremap å o
vnoremap Å O

vnoremap " ge
" forward to end of word with symbols 
vnoremap ' e

vnoremap , (o}kE


" Make vaa select the entire file...
xmap aa VGo1G

" Do not change clipboard when pasting over marked text
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'

vnoremap j i 

""" Operator pending mode (onoremap)
onoremap i i
onoremap o a
onoremap " "
onoremap ' "
onoremap . .
onoremap p p

"====[  History, changes, git etc  ]
nnoremap L :UndotreeShow<CR>
set undolevels=100
set undofile

noremap <F1> :let g:changes_vcs_check=0<CR>:let g:changes_vcs_system=''<CR>
noremap <F2> :let g:changes_vcs_check=1<CR>:let g:changes_vcs_system='git'<CR>
" noremap <F5> :UndotreeToggle<CR>
" Make diffs less glaringly ugly...
highlight DiffAdd     cterm=bold ctermfg=green     ctermbg=black
highlight DiffChange  cterm=bold ctermfg=grey      ctermbg=black
highlight DiffDelete  cterm=bold ctermfg=black     ctermbg=black
highlight DiffText    cterm=bold ctermfg=magenta   ctermbg=black



"====[  Esthetics, formating and visual mappings  ]
"" Airline
let g:airline#extensions#tabline#enabled = 1
" let g:airline_section_x = 0
let g:airline_section_y = 0
" let g:airline_section_z = 0
let g:airline_section_z = '%t'
" let g:airline_section_warning = 0
let g:airline_powerline_fonts = 1

let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'error']
    \ ]


let g:airline#extensions#coc#enabled = 1
"" Folds
"Colemak
nnoremap ze zj 
nnoremap zi zk
nnoremap zE zi
nnoremap <leader>o zO
nnoremap <leader>n zC

"Personal preference due to position
noremap m n  
onoremap M N

"" Plugin dependent settings
""" Goyo
let g:goyo_height = 90 

""" Color Scheme
" colorscheme eldar
let g:material_style = "deep ocean"
colorscheme material


"====[  Language specific mappings ]
"" CPP
autocmd Syntax c,cpp normal zR
autocmd Syntax c,cpp setlocal foldmethod=indent
" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

""" Plugin dependent settings
let g:ale_c_clangformat_style_option = 'Google'
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1

"" Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set foldlevel=0

""" Plugin dependent settings
let python_highlight_all=1
let g:flake8_quickfix_location="topleft"
let g:flake8_quickfix_height=7

let cyfolds_fold_keywords = 'class,def,async def,cclass,cdef,cpdef,for,while,if,elif,else'
 
 
"" Markdown MD

function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "=" 
endfunction
au BufEnter *.md setlocal foldexpr=MarkdownLevel()  
au BufEnter *.md setlocal foldmethod=expr

"====[  Vim script functions  ]
"" Autofolding

function! VimFolds(lnum)
  let s:thisline = getline(a:lnum)
  if match(s:thisline, '^"" ') >= 0
    return '>2'
  endif
  if match(s:thisline, '^""" ') >= 0
    return '>3'
  endif
  let s:two_following_lines = 0
  if line(a:lnum) + 2 <= line('$')
    let s:line_1_after = getline(a:lnum+1)
    let s:line_2_after = getline(a:lnum+2)
    let s:two_following_lines = 1
  endif
  if !s:two_following_lines
      return '='
    endif
  else
    " if (match(s:thisline, '^"""""') >= 0) &&
       " \ (match(s:line_1_after, '^"  ') >= 0) &&
       " \ (match(s:line_2_after, '^""""') >= 0)
    if (match(s:thisline, '^"====[') >= 0)
      return '>1'
    else
      return '='
    endif
  endif
endfunction

""" defines a foldtext
function! VimFoldText()
  " handle special case of normal comment first
  let s:info = '('.string(v:foldend-v:foldstart).' l)'
  if v:foldlevel == 1
    " let s:line = ' ◇ '.getline(v:foldstart+1)[3:-2]
    let s:line = ' ◇ '.getline(v:foldstart)[1:]
  elseif v:foldlevel == 2
    let s:line = '   ●  '.getline(v:foldstart)[3:]
  elseif v:foldlevel == 3
    let s:line = '     ▪ '.getline(v:foldstart)[4:]
  endif
  if strwidth(s:line) > 80 - len(s:info) - 3
    return s:line[:79-len(s:info)-3+len(s:line)-strwidth(s:line)].'...'.s:info
  else
    return s:line.repeat(' ', 80 - strwidth(s:line) - len(s:info)).s:info
  endif
endfunction

""" USE functions to fold vim -> move to language specfic section

augroup fold_vimrc
  autocmd!
  autocmd FileType vim 
                   \ setlocal foldmethod=expr |
                   \ setlocal foldexpr=VimFolds(v:lnum) |
                   \ setlocal foldtext=VimFoldText() |
     "              \ set foldcolumn=2 foldminlines=2
augroup END

"" Move lines and marked text
""" Function implementation
function! MoveLineUp()
  call MoveLineOrVisualUp(".", "")
endfunction

function! MoveLineDown()
  call MoveLineOrVisualDown(".", "")
endfunction

function! MoveVisualUp()
  call MoveLineOrVisualUp("'<", "'<,'>")
  normal gv
endfunction

function! MoveVisualDown()
  call MoveLineOrVisualDown("'>", "'<,'>")
  normal gv
endfunction

function! MoveLineOrVisualUp(line_getter, range)
  let l_num = line(a:line_getter)
  if l_num - v:count1 - 1 < 0
    let move_arg = "0"
  else
    let move_arg = a:line_getter." -".(v:count1 + 1)
  endif
  call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualDown(line_getter, range)
  let l_num = line(a:line_getter)
  if l_num + v:count1 > line("$")
    let move_arg = "$"
  else
    let move_arg = a:line_getter." +".v:count1
  endif
  call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualUpOrDown(move_arg)
    let col_num = virtcol(".")
    execute "silent! ".a:move_arg
    execute "normal! ".col_num."|"
endfunction
""" Bindings
nnoremap <silent> <C-Down> :<C-u>call MoveLineDown()<CR>
nnoremap <silent> <C-Up> :<C-u>call MoveLineUp()<CR>
inoremap <silent> <C-Down> <C-o>:call MoveLineDown()<CR>
inoremap <silent> <C-Up> <C-o>:call MoveLineUp()<CR>
xnoremap <silent> <C-Up> :<C-u>call MoveVisualUp()<CR>
xnoremap <silent> <C-Down> :<C-u>call MoveVisualDown()<CR>

""" Python folding

"set foldmethod=expr
"set foldexpr=GetPythonFold(v:lnum)
"set foldtext=PythonFoldText()
"setlocal foldmethod=expr
"setlocal foldexpr=GetPythonFold(v:lnum)
"setlocal foldtext=PythonFoldText()

function! PythonFoldText()
  let fs = v:foldstart
  while getline(fs) =~ '^\s*@' | let fs = nextnonblank(fs + 1)
  endwhile
  let line = getline(fs)
  let nnum = nextnonblank(fs + 1)
  let nextline = getline(nnum)
  "get the document string: next line is ''' or """
  if nextline =~ "^\\s\\+[\"']\\{3}\\s*$"
      let line = line . " " . matchstr(getline(nextnonblank(nnum + 1)), '^\s*\zs.*\ze$')
  "next line starts with qoutes, and has text
  elseif nextline =~ "^\\s\\+[\"']\\{1,3}"
      let line = line." ".matchstr(nextline, "^\\s\\+[\"']\\{1,3}\\zs.\\{-}\\ze['\"]\\{0,3}$")
  elseif nextline =~ '^\s\+pass\s*$'
    let line = line . ' pass'
  endif
  "compute the width of the visible part of the window (see Note above)
  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let size = 1 + v:foldend - v:foldstart
  "compute expansion string
  let spcs = '................'
  while strlen(spcs) < w | let spcs = spcs . spcs
  endwhile
  "expand tabs (mail me if you have tabstop>10)
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')
  return strpart(line.spcs, 0, w-strlen(size)-7).'.'.size.' lines'
endfunction

function! GetBlockIndent(lnum)
    " Auxiliary function; determines the indent level of the surrounding def/class
    " "global" lines are level 0, first def &shiftwidth, and so on
    " scan backwards for class/def that is shallower or equal
    let ind = 100
    let p = a:lnum+1
    while indent(p) >= 0
        let p = p - 1
        " skip empty and comment lines
        if getline(p) =~ '^$\|^\s*#' | continue
        " zero-level regular line
        elseif indent(p) == 0 | return 0
        " skip deeper or equal lines
        elseif indent(p) >= ind || getline(p) =~ '^$\|^\s*#' | continue
        " indent is strictly less at this point: check for def/class
        elseif getline(p) =~ s:defpat && getline(p) !~ '^\s*@'
            " level is one more than this def/class
            return indent(p) + &shiftwidth
        endif
        " shallower line that is neither class nor def: continue search at new level
        let ind = indent(p)
    endwhile
    "beginning of file
    return 0
endfunction

" Clever debug code, use to display text for a given moment the statement is executed:
" call PrintIfCount(6, "Line: ".a:lnum.", indent: ".ind.", previous indent: ".pind)
let s:counter=0
function! PrintIfCount(n,t)
    "Print text the nth time this function is called
    let s:counter = s:counter+1
    if s:counter==a:n | echo a:t
    endif
endfunction

function! GetPythonFold(lnum)
    " Determine folding level in Python source (see "higher foldlevel theory" below)
    let line = getline(a:lnum)
    let ind = indent(a:lnum)
    " Case D***: class and def start a fold
    " If previous line is @, it is not the first
    if line =~ s:defpat && getline(prevnonblank(a:lnum-1)) !~ '^\s*@'
        " let's see if this range of 0 or more @'s end in a class/def
        let n = a:lnum
        while getline(n) =~ '^\s*@' | let n = nextnonblank(n + 1)
        endwhile
        " yes, we have a match: this is the first of a real def/class with decorators
        if getline(n) =~ s:defpat
            return ">".(ind/&shiftwidth+1)
        endif
    " Case E***: empty lines fold with previous
    " (***) change '=' to -1 if you want empty lines/comment out of a fold
    elseif line == '' | return '='
    endif
    " now we need the indent from previous
    let p = prevnonblank(a:lnum-1)
    while p>0 && getline(p) =~ '^\s*#' | let p = prevnonblank(p-1)
    endwhile
    let pind = indent(p)
    " If previous was definition: count as one level deeper
    if getline(p) =~ s:defpat && getline(prevnonblank(a:lnum - 1)) !~ '^\s*@'
        let pind = pind + &shiftwidth
    " if begin of file: take zero
    elseif p==0 | let pind = 0
    endif
    " Case S*=* and C*=*: indent equal
    if ind>0 && ind==pind | return '='
    " Case S*>* and C*>*: indent increase
    elseif ind>pind | return '='
    " All cases with 0 indent
    elseif ind==0
        " Case C*=0*: separate global code blocks
        if pind==0 && line =~ '^#' | return 0
        " Case S*<0* and S*=0*: global code
        elseif line !~'^#'
            " TODO: here we need to check GetBlockIndent(a:lnum) for version 3.3
            " Case S*<0*: new global statement if/while/for/try/with
            if 0<pind && line!~'^else\s*:\|^except.*:\|^elif.*:\|^finally\s*:' | return '>1'
            " Case S*=0*, after level 0 comment
            elseif 0==pind && getline(prevnonblank(a:lnum-1)) =~ '^\s*#' | return '>1'
            " Case S*=0*, other, stay 1
            else | return '='
            endif
        endif
        " Case C*<0= and C*<0<: compute next indent
        let n = nextnonblank(a:lnum+1)
        while n>0 && getline(n) =~'^\s*#' | let n = nextnonblank(n+1)
        endwhile
        " Case C*<0=: split definitions
        if indent(n)==0 | return 0
        " Case C*<0<: shallow comment
        else | return -1
        end
    endif
    " now we really need to compute the actual fold indent
    " do the hard computation
    let blockindent = GetBlockIndent(a:lnum)
    " Case SG<* and CG<*: global code, level 1
    if blockindent==0 | return 1
    endif
    " now we need the indent from next
    let n = nextnonblank(a:lnum+1)
    while n>0 && getline(n) =~'^\s*#' | let n = nextnonblank(n+1)
    endwhile
    let nind = indent(n)
    " Case CR<= and CR<>
    endif
    if line =~ '^\s*#' && ind>=nind | return -1
    " Case CR<<: return next indent
    elseif line =~ '^\s*#' | return nind / &shiftwidth
    " Case SR<*: return actual indent
    else | return blockindent / &shiftwidth
    endif
endfunction

" higher foldlevel theory
" There are five kinds of statements: S (code), D (def/class), E (empty), C (comment)

" Note that a decorator statement (beginning with @) counts as definition,
" but that of a sequence of @,@,@,def only the first one counts
" This means that a definiion only counts if not preceded by a decorator

" There are two kinds of folds: R (regular), G (global statements)

" There are five indent situations with respect to the previous non-emtpy non-comment line:
" > (indent), < (dedent), = (same); < and = combine with 0 (indent is zero)
" Note: if the previous line is class/def, its indent is interpreted as one higher

" There are three indent situations with respect to the next (non-E non-C) line:
" > (dedent), < (indent), = (same)

" Situations (in order of the script):
" stat  fold prev   next
" SDEC  RG   ><=00  ><=
" D     *    *      *     begin fold level if previous is not @: '>'.ind/&sw+1
" E     *    *      *     keep with previous: '='
" S     *    =      *     stays the same: '='
" C     *    =      *     combine with previous: '='
" S     *    >      *     stays the same: '='
" C     *    >      *     combine with previous: '='
" C     *    =0     *     separate blocks: 0
" S     *    <0     *     becomes new level 1: >1 (except except/else: 1)
" S     *    =0     *     stays 1: '=' (after level 0 comment: '>1')
" C     *    <0     =     split definitions: 0
" C     *    <0     <     shallow comment: -1
" C     *    <0     >     [never occurs]
" S     G    <      *     global, not the first: 1
" C     G    <      *     indent isn't 0: 1
" C     R    <      =     foldlevel as computed for next line: -1
" C     R    <      >     foldlevel as computed for next line: -1
" S     R    <      *     compute foldlevel the hard way: use function
" C     R    <      <     foldlevel as computed for this line: use function



"====[ Lua ] 

