" .vimrc of György Demarcsek
set fileencoding=utf-8                  "File encoding is always UTF-8
set encoding=utf-8                      " Sets standard output encoding as well

if has('gui_running')
  set guifont=Ubuntu\ Mono\ 12
  set guioptions=T
  colorscheme solarized
  set background=dark
else
  set background=light
endif

" If there is a git repository present do not use backup files (we trust the
" owner created proper .gitignores, etc. )
let tmp=system("git rev-parse --show-toplevel")
if empty(matchstr(tmp, "^fatal*"))
  set backup
  set backupdir=./tmp/,~/tmp/,/var/tmp/,/tmp/,. " Do not mess up working directory with backup files
else
  set nobackup
end
set modeline                            " Look for modelines
set modelines=7                         " In the first n lines 
set number                              " Show line numbers
set mouse=a                             " Enable GUI mouse
set ff=unix                             " Use UNIX file format (eol=\n)
filetype plugin on                      " Enable file type recognition
filetype plugin indent on               " Enable file type specific indentation
set tabstop=4                           " Set number of columns a TAB has
set shiftwidth=4                        " Number of columns a single level of indentation generates
set softtabstop=4                       " Number of columns inserted when hitting TAB in INSERT mode
set expandtab                           " Use spaces instead of TAB character
set autoindent                          " Enable auto indentation
set confirm                             " Ask to confirm quitting without saved state
set smarttab                            " Tabs for indentation, spaces for formatting                          
" Opens tag list buffer for some source files
"autocmd FileType c,cpp,python,java,ruby autocmd VimEnter <buffer> call OpenProg()
syntax enable                           " Enables syntax highlighting
set incsearch                           " Enables incremental search
set hlsearch                            " Search results get highlighted
set smartcase                           " When using all lowercase search terms, case is ignored, otherwise not
set wildmenu                            " Show auto-completion menu
set ruler                               " Always display current position
" Remove trailing whitespaces in case of some source files
autocmd FileType c,cpp,cc,java,bash,php,ruby,python autocmd BufWritePre <buffer> :%s/\s\+$//e
" Draw a vertical red line at the given column to indicate long lines
au BufEnter *.h,*.c,*.cpp,*.cc,*.java,*.sh,*.php,*.rb,*.py set cc=100
set undolevels=99                       " Maximal depth of undo stack
set history=99                          " Number of command history items to keep


"function OpenProg()                     " Opens up taglist
"  TlistOpen
"  wincmd w
"endfunction

function Make()
  w
  ! make 
endfunction

au BufEnter *.h,*.c,*.cpp,*.py,*.rb,*.java,*.cc,*.php set cursorline                          " Show cursor's line with underlined decoration
set visualbell                          " Flash screen instead of beeping
set noerrorbells                        " Do not sound bell on errors
set lazyredraw                          " Do not redraw screen when not needed (e.g. during macro runs)
set pastetoggle=<F2>                    " Toggle paste mode with F2
" Run make on F5
map <F5> :call Make()
set foldenable                          " Enable folding
set foldlevelstart=99                   " Number of levels opened when opening a file (99=all)
set foldnestmax=20                      " Maximal fold nesting
" Map <space> to fold/unfold
nnoremap <space> za
set foldmethod=indent                   " Folding level is defined by indentation
" Makes copy-paste work as expected, but to make CtrlV work, we needed a
" different key combination for entering visual block mode, and this will be
" 'B' in normal mode
"nnoremap B <c-v>
"vmap <C-c> y<Esc>i
"vmap <C-x> d<Esc>i
"imap <C-v> <Esc>pi
"imap <C-y> <Esc>ddi
"map <C-z> <Esc>
"imap <C-z> <Esc>ui
"
set mat=2
set showmatch
set lazyredraw
set cmdheight=2
set noerrorbells
set novisualbell
set foldcolumn=1
set ai " Auto indent
set si " Smart indent
map <space> /
map <c-space> ?
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
map <leader>pp :setlocal paste!<cr>


function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

map ,bt :bufdo tab split<CR>

hi Search guibg=peru guifg=red
hi Search cterm=NONE ctermfg=yellow ctermbg=darkblue

" IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*

let g:tex_flavor='latex'
