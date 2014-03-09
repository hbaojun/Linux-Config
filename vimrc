"不兼容模式
set nocompatible
"set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
set guifont=DejaVu\ Sans\ Mono\ 10   " 设置字体  
"set guifont=Monospace\ 11

"高亮
syntax on

filetype on  " 侦测文件类型
filetype plugin on  " 载入文件类型插件
filetype indent on  " 为特定文件类型载入相关缩进文件
set completeopt=preview,menu "代码不全

set gcr=a:block-blinkoff0 "禁用光标闪烁

"显示命令
set showcmd

"状态栏2行
set laststatus=2

"显示光标位置
set ruler

"显示行号
set nu 

"高亮当前行和列
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
set cursorline
set cursorcolumn


"提前开始检索
set is

"搜索忽略大小写
set ignorecase

"高亮搜索关键词
set hlsearch

"设置魔术
set magic

"禁止生成临时文件
set nobackup 
set noswapfile

"禁止折叠
"set nowrap

"启动vim时关闭折叠
set nofoldenable


"历史记录数
set history=100

"使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"高亮匹配括号
set showmatch
set matchtime=1

"打开普通文件类型的自动缩进
set ai 

"C语言程序提供缩进
set smartindent
set cin
set cino=:0g0t0(sus
set autoindent

"tab键宽度为4
set tabstop=4

"连续空格视为制表符
set softtabstop=4

"制表符占的位数
set shiftwidth=4

"将所有tab替换成空格
set et

"处理未保存或只读文件时，弹出确认
set confirm

"自动保存
set autowrite

"文件被改动，自动读入
set autoread

"配色方案
colorscheme Tomorrow-Night
"colorscheme solarized

" 设置编码
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
language message en_US.utf-8
set fileencodings=utf-8,cp936,ucs-bom,chinese
set fileencoding=utf-8

 "带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-  

"不在单词内断行
set lbr

"对亚洲语言断行支持
set fo+=mB

set wildmenu
set backspace=2

"不显示侧边栏
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"Taglist配置
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"map <C-F12> :!ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q .<CR>
map <C-F12> :!ctags -R --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+liaS --extra=+q .<CR> 

"隐藏标题栏
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <Bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 

""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: hbaojun") 
        call append(line(".")+2, "\# mail: hbaojun.huang@gmail.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: hbaojun") 
        call append(line(".")+2, "    > Mail: hbaojun.huang@gmail.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif

    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif

    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 

"quickfix模式 
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr> 
set makeprg=g++\ -Wall\ \ %   "make 运行

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"vim-identguide 插件配置
"随vim启动
"let g:indent_guides_enable_on_vim_startup=1

"第二层显示缩进
"let g:indent_guides_start_level=2

" 色块宽度
"let g:indent_guides_guide_size=1

"快捷键开关可视化
"nmap <silent> <Leader>i <Plug>IndentGuidesToggle



source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

