" begin vim-plug
call plug#begin()

Plug 'chriskempson/base16-vim'
Plug 'mileszs/ack.vim'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'moll/vim-node'
Plug 'leafgarland/typescript-vim'
Plug 'shougo/vimproc.vim', {'do' : 'make'}
Plug 'quramy/tsuquyomi'
Plug 'valloric/youcompleteme', { 'do': './install.py' }

call plug#end()


" enable jsx syntax highlighting for .js files
let g:jsx_ext_required = 0


" Settings below are mostly stolen from Janus with a few other influences

" Basic Setup
set number
set cursorline
syntax enable

" Buffer
set hidden
set history=1000

" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
				  " off and the line continues beyond the left of the screen
				  "
" Searching

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" Wild settings

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Backup and swap files
set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

" Set theme
set background=dark
colorscheme base16-darktooth

" Statusline
if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif


" File types

filetype plugin indent on " Turn on filetype plugins (:help filetype-plugin)

if has("autocmd")
  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType make setlocal noexpandtab

  " Make sure all mardown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  if !exists("g:disable_markdown_autostyle")
    au FileType markdown setlocal wrap linebreak textwidth=72 nolist
  endif

  " make Python follow PEP8 for whitespace ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python setlocal tabstop=4 shiftwidth=4

  au FileType php setlocal tabstop=4 shiftwidth=4

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
