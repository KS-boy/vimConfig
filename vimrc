




"__     _____ __  __ ____   ____ 
"\ \   / /_ _|  \/  |  _ \ / ___|
 "\ \ / / | || |\/| | |_) | |    
  "\ V /  | || |  | |  _ <| |___ 
   "\_/  |___|_|  |_|_| \_\\____|
                                





let mapleader=" "

set nu
set autoindent
syntax on
set cursorline
set wildmenu
"set mouse=a
set scrolloff=5


set incsearch

set ignorecase

set smartcase

inoremap jj <esc>
noremap ff gg=G 
noremap <C-x> ea<C-x>s
inoremap <C-x> <C-x>s


"Call figlet
map tx :r !figlet 





map S :w<CR>
map Q :q<CR>
map R :source ~/.vimrc<CR>

map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>

map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j


map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>

"Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>


"===
"=== NERDTree
"===

map tt :NERDTreeToggle<CR>

let NERDTreeMapOpenVSplit="s"
let NERDTreeMapOpenSplit=""


" ===
" === {
" ===
inoremap { {}<left><CR><up><right><CR>




noremap H 5h
noremap M 5k
noremap J 5j
noremap L 5l
noremap F 2K

noremap l $
noremap h 0

noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>


call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'ycm-core/YouCompleteMe'
Plug 'preservim/nerdtree'

Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

call plug#end()

"snazzy
colorscheme snazzy






" ===
" === Ultisnippets
" ===


autocmd FileType cpp UltiSnipsAddFiletypes cpp.snippets
autocmd FileType c UltiSnipsAddFiletypes c.snippets

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

let g:UltiSnipsSnippetDirectories=[$HOME.'~/.vim/Ultisnips','Ultisnips']










" Let clangd fully contro code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

let g:ycm_clangd_args = ['-log=verbose', '-pretty']

let g:ycm_enable_semantic_highlighting=1


" ===
" === 打开文件时，复原光标位置
" ===

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif



"change cursor shape in differen modes
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif








" config header file

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"

func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\###############################################################################")
        call append(line("."),   "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: Stewart Zhang")
        call append(line(".")+2, "\# mail: 2217569232@qq.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\######################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "\PATH=/bin/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin")
        call append(line(".")+7, "\ export PATH")
        call append(line(".")+8, "")
    else
        call setline(1, "/**************************************************************")
        call append(line("."), "  > File Name: ".expand("%"))
        call append(line(".")+1, "  > Author: Stewart Zhang")
        call append(line(".")+2, "  > Mail: 2217569232@qq.com ")
        call append(line(".")+3, "  > Created Time: ".strftime("%c"))
        call append(line(".")+4, " **************************************************************/")
        call append(line(".")+5, "")
    endif

    if &filetype == 'cpp'
        call append(line(".")+6, "#include <iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
        call append(line(".")+9, "int main()")
        call append(line(".")+10, "{")
        call append(line(".")+11, "")
        call append(line(".")+12, "  return 0;")
        call append(line(".")+13, "}")

    endif

     if &filetype == 'c'
        call append(line(".")+6, "#include <stdio.h>")
	call append(line(".")+7, "#include <string.h>")
	call append(line(".")+8, "#include <unistd.h>")
	call append(line(".")+9, "#include <stdlib.h>")
	call append(line(".")+10, "#include <fcntl.h>")
	call append(line(".")+11, "#include <arpa/inet.h>")
	call append(line(".")+12, "#include <netinet/in.h>")
	call append(line(".")+13, "#include <sys/socket.h>")
	call append(line(".")+14, "#include <sys/epoll.h>")
	call append(line(".")+15, "#include <assert.h>")
	call append(line(".")+16, "#include <errno.h>")
	call append(line(".")+17, "#include <signal.h>")
	call append(line(".")+18, "#include <pthread.h>")
        call append(line(".")+19, "")
        call append(line(".")+20, "int main(int argc,char**argv)")
        call append(line(".")+21, "{")
        call append(line(".")+22, "")
        call append(line(".")+23, "  return 0;")
        call append(line(".")+24, "}")
    endif
endfunc
