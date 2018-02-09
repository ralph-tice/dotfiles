" based on http://github.com/jferris/config_files/blob/master/vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible	" use vim defaults
set scrolloff=3         " keep 3 lines when scrolling
set ai                  " set auto-indenting on for programming

set showcmd		" display incomplete commands
set nobackup		" do not keep a backup file
set nowritebackup
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" allow backspacing over everything in insert mode
set backspace=indent,eol,start  " make that backspace key work the way it should

set incsearch		" do incremental searching
set showmatch           " jump to matches when entering regexp

" case only matters with mixed case expressions
set ignorecase		" ignore case when searching
set smartcase		" no ignorecase if Uppercase char present

" Turn off the annoying bell
set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

filetype on             " detect type of file
filetype indent on      " load indent file for specific file type
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set t_RV=               " http://bugs.debian.org/608242, http://groups.google.com/group/vim_dev/browse_thread/thread/9770ea844cec3282

:command W :w !sudo tee %
:command Dgl :diffget //2 | diffupdate
:command Dgr :diffget //3 | diffupdate

" Don't use Ex mode, use Q for formatting
map Q gq

" Spell check
autocmd Filetype gitcommit,markdown setlocal spell

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

" Switch wrap off for everything
set nowrap

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Ruby indent defaults
  autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2

  " Set File type to 'text' for files ending in .txt
  autocmd BufNewFile,BufRead *.txt setfiletype text

  " Enable soft-wrapping for text files
  autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Automatically load .vimrc source when saved
  autocmd BufWritePost .vimrc source $MYVIMRC

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" if has("folding")
  " set foldenable
  " set foldmethod=syntax
  " set foldlevel=1
  " set foldnestmax=2
  " set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
" endif

" Softtabs, 2 spaces
" set tabstop=2
" set shiftwidth=2
" set expandtab

" Always display the status line
set laststatus=2

" \ is the leader character
let mapleader = ","

" Edit the README_FOR_APP (makes :R commands work)
map <Leader>R :e doc/README_FOR_APP<CR>

" Leader shortcuts for Rails commands
map <Leader>m :Rmodel 
map <Leader>c :Rcontroller 
map <Leader>v :Rview 
map <Leader>u :Runittest 
map <Leader>f :Rfunctionaltest 
map <Leader>tm :RTmodel 
map <Leader>tc :RTcontroller 
map <Leader>tv :RTview 
map <Leader>tu :RTunittest 
map <Leader>tf :RTfunctionaltest 
map <Leader>sm :RSmodel 
map <Leader>sc :RScontroller 
map <Leader>sv :RSview 
map <Leader>su :RSunittest 
map <Leader>sf :RSfunctionaltest 

" Hide search highlighting
map <Leader>h :set invhls <CR>

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

" For Haml
au! BufRead,BufNewFile *.haml         setfiletype haml

" No Help, please
nmap <F1> <Esc>

" Press ^F from insert mode to insert the current file name
imap <C-F> <C-R>=expand("%")<CR>

" Maps autocomplete to tab
imap <Tab> <C-N>

imap <C-L> <Space>=><Space>

" Display extra whitespace
" set list listchars=tab:»·,trail:·

" Edit routes
command! Rroutes :e config/routes.rb
command! Rschema :e db/schema.rb

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor\ --ignore-dir=tmp\ --ignore-dir=coverage
endif

" Color scheme
" colorscheme vividchalk
" highlight NonText guibg=#060606
" highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Numbers
set number
set numberwidth=5

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t


" Tags
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
set tags=./tags;

let g:fuf_splitPathMatching=1

" Open URL
command -bar -nargs=1 OpenURL :!open <args>
function! OpenURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
	  exec "!open \"" . s:uri . "\""
  else
	  echo "No URI found in line."
  endif
endfunction
map <Leader>w :call OpenURL()<CR>

Plugin 'wakatime/vim-wakatime'

Plugin 'hashivim/vim-terraform'
let g:terraform_align=1

" Terraform fmt
let g:terraform_fmt_on_save = 1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1
" Terraform magic!
command! -bar PrettifyTerraformKeywords %s/^"\(module\|resource\|data\)"/\1/e
command! -bar PrettifyTerraformNewlines %s/.*=.*\zs\n\n\ze/\r/e
command! -bar PrettifyTerraformAssigns %s/\s\+\zs"\(.*\)"\ze.*=/\1/e
command! -bar FormatTerraform %!terraform fmt -
command! PrettyFormatTerraform PrettifyTerraformKeywords|PrettifyTerraformAssigns|PrettifyTerraformNewlines|FormatTerraform
