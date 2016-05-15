""" BEGIN: Custom general
set t_Co=256
colorscheme hybrid
filetype plugin indent on
set background=dark
"" Get transparent BG back
"hi Normal ctermbg=black
set ml
set number
"" alias Rw in order to write as root if I have sudo
"" but forgot to start as sudo. Rwq to also quit.
command Rw exec "w !sudo tee %"
command Rwq exec "Rw" | q!
""" END: Custom general

""" BEGIN: Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
""" END: Powerline

""" Remove trailing whitespaces:
autocmd BufWritePre * :%s/\s\+$//e

""" BEGIN: Highlight trailing whitespace but not in INSERT
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
""" END: Highlight trailing whitespace

""" BEGIN: OmniComplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
""" END: OmniComplete

""" BEGIN: Syntactics shellcheck/pylint
execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_python_python_exec = '/usr/bin/python3'
"let g:syntastic_python_checkers = ['python']
""" END: Syntactics
