""" BEGIN: Custom general
set t_Co=256
set background=dark
colorscheme hybrid
"" Get transparent BG back
hi Normal ctermbg=NONE
set autoindent
filetype plugin indent on
"" https://github.com/pearofducks/ansible-vim/issues/24#issuecomment-235065486
autocmd FileType ansible setlocal indentkeys-=<:>
set tabstop=4
set shiftwidth=4
set ml
set number
"" alias Rw in order to write as root if I have sudo
"" but forgot to start as sudo. Rwq to also quit.
command Rw exec "w !sudo tee %"
command Rwq exec "Rw" | q!
""" END: Custom general

""" BEGIN: Auto relativenumber
if has('autocmd')
augroup vimrc_linenumbering
    autocmd!
    autocmd WinLeave *
                \ if &number |
                \   set norelativenumber |
                \ endif
    autocmd BufWinEnter *
                \ if &number |
                \   set relativenumber |
                \ endif
    autocmd VimEnter *
                \ if &number |
                \   set relativenumber |
                \ endif
augroup END
endif
""" END: Auto relativenumber

""" BEGIN: Powerline
"" First we will check to see if `powerline-daemon` is available
"" This is a good indicator of whether powerline is installed
"" this way we don't need to maintain two files.
if system('command -v powerline-daemon') != ''
"	python from powerline.vim import setup as powerline_setup
"	python powerline_setup()
"	python del powerline_setup
	set laststatus=2
	set noshowmode
endif
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

""" BEGIN: Syntastic shellcheck/pylint
execute pathogen#infect()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
if system('command -v closure-compiler') != ''
	let g:syntastic_javascript_closurecompiler_script = '/usr/bin/closure-compiler'
	let g:syntastic_javascript_closurecompiler_args = '--language_in=ES5'
	let g:syntastic_javascript_checkers = ['closurecompiler']
endif
if system('command -v ansible-lint') != ''
	let g:syntastic_ansible_ansible_lint_exec = '/usr/bin/ansible-lint'
	let g:syntastic_ansible_checkers = ['ansible_lint']
endif
if system('command -v yamllint') != ''
	let g:syntastic_yaml_checkers = ['yamllint']
endif

"let g:syntastic_python_python_exec = '/usr/bin/python3'
"let g:syntastic_python_checkers = ['python']
""" END: Syntastic
