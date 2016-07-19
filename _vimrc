source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

 
"vundle需要 
set nocompatible                                      "禁用 Vi 兼容模式
filetype off                                          "禁用文件类型侦测

set rtp+=$VIMHOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$VIMHOME/vimfiles/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'gmarik/snipmate.vim'
Plugin 'vim-scripts/a.vim'
"Plugin 'vim-scripts/ZoomWin'
Plugin 'vim-scripts/winmanager'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'vim-scripts/c.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/SuperTab'
Plugin 'vim-scripts/Markdown'
"Plugin 'vim-scripts/markdown-preview.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'
"Plugin 'vim-scripts/vim-zimwiki-syntax'
"Plugin 'vim-scripts/TabBar'
Plugin 'vim-scripts/OmniCppComplete'
"Plugin 'vim-scripts/Vimpress'
Plugin 'vim-scripts/ctags.vim'
Plugin 'vim-scripts/cSyntaxAfter'
Plugin 'vim-scripts/vim-R-plugin'
Plugin 'vim-scripts/The-NERD-tree'
"Plugin 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'gerw/vim-latex-suite'
Plugin 'flazz/vim-colorschemes'
"Plugin 'szw/vim-ctrlspace'
call vundle#end()

" -----------------------------------------------------------------------------
"  < 编码配置 >
" -----------------------------------------------------------------------------
" 注：使用utf-8格式后，软件与程序源码、文件路径不能有中文，否则报错
set encoding=utf-8                                    "设置gvim内部编码，默认不更改
set fileencoding=utf-8                                "设置当前文件编码，可以更改，如：gbk（同cp936）
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1     "设置支持打开的文件的编码
set ai                                                "打开普通文件类型的自动缩进

set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8


" 文件格式，默认 ffs=dos,unix
set fileformat=unix                                   "设置新（当前）文件的<EOL>格式，可以更改，如：dos（windows系统常用）
set fileformats=unix,dos,mac                          "给出文件的<EOL>格式类型


"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
 
"解决consle输出乱码
language messages zh_CN.utf-8


" -----------------------------------------------------------------------------
"  < 编写文件时的配置 >
" -----------------------------------------------------------------------------
filetype on                                           "启用文件类型侦测
filetype plugin on                                    "针对不同的文件类型加载对应的插件
filetype plugin indent on                             "对特定文件启用相关缩进
filetype indent on

set smartindent                                       "启用智能对齐方式
set expandtab                                         "将Tab键转换为空格
set tabstop=4                                         "设置Tab键的宽度，可以更改，如：宽度为2
set shiftwidth=4                                      "换行时自动缩进宽度，可更改（宽度同tabstop）
set softtabstop=4                                     "连续空格视为制表符
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度
set et                                                "将所有tab替换成空格
"set foldenable                                        "启用折叠
"set foldmethod=indent                                 "indent 折叠方式
"set foldmethod=marker                                "marker 折叠方式

"开启语法高亮 
syntax on

"在任何模式下启用鼠标
set mouse=a 
set selection=exclusive
set selectmode=mouse,key
set backspace=indent,eol,start

" 常规模式下用空格键来开关光标行所在折叠（注：zR 展开所有折叠，zM 关闭所有折叠）
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
 
" 当文件在外部被修改，自动更新该文件
set autoread

"处理为保存或只读文件时，弹出确认
set confirm

"自动保存
set autowrite

"带有如下符号的单词不被换行分割
set iskeyword+=_,$,@,%,#,-

"不在单词内断行
set lbr


set nobackup

"set foldmethod=syntax
set foldlevel=9999

" 常规模式下输入 cS 清除行尾空格
"nmap cS :%s/\s\+$//g<CR>:noh<CR>
 
" 常规模式下输入 cM 清除行尾 ^M 符号
"nmap cM :%s/\r$//g<CR>:noh<CR>

"提前开始检索
set is

"搜索模式里忽略大小写
set ignorecase
          
"如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开ignorecase选项时才会使用
set smartcase      
                  
"在输入要搜索的文字时，取消实时匹配
"set noincsearch                                       

"高亮匹配括号
set showmatch
set matchtime=1

" Ctrl + K 插入模式下光标向上移动
imap <c-k> <Up>
 
" Ctrl + J 插入模式下光标向下移动
imap <c-j> <Down>
 
" Ctrl + H 插入模式下光标向左移动
imap <c-h> <Left>
 
" Ctrl + L 插入模式下光标向右移动
imap <c-l> <Right>
 
" 启用每行超过80列的字符提示（字体变蓝并加下划线），不启用就注释掉
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
 
" -----------------------------------------------------------------------------
"  < 界面配置 >
" -----------------------------------------------------------------------------
set nu                                                "显示行号
set ruler
set laststatus=2                                      "启用状态栏信息
set cmdheight=1                                      "设置命令行的高度为2，默认为1
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set cursorline                                        "突出显示当前行
set guifont=YaHei\ Consolas\ Hybrid\ 11                 "设置字体:字号（字体名称空格用下划线代替）
"set gfw=Microsoft\ YaHei\ Mono\ 11
set nowrap                                            "设置不自动换行
set shortmess=atI                                     "去掉欢迎界面
set vb t_vb=                                          "关闭提示音 

" 设置 gVim 窗口初始位置及大小
" au GUIEnter * simalt ~x                         "窗口启动时自动最大化
winpos 100 10                                     "指定窗口出现的位置，坐标原点在屏幕左上角
set lines=40 columns=120                          "指定窗口大小，lines为高度，columns为宽度

 
" 设置代码配色方案
colorscheme Tomorrow-Night               "Gvim配色方案

" 显示/隐藏菜单栏、工具栏、滚动条，可用 Ctrl + F11 切换

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
nmap <silent> <F2> :if &guioptions =~# 'm' <Bar>
    \set guioptions-=m <Bar>
    \set guioptions-=T <Bar>
    \set guioptions-=r <Bar>
    \set guioptions-=L <Bar>
\else <Bar>
    \set guioptions+=m <Bar>
    \set guioptions+=T <Bar>
    \set guioptions+=r <Bar>
    \set guioptions+=L <Bar>
\endif<CR>


" -----------------------------------------------------------------------------
"  < ctags 工具配置 >
" -----------------------------------------------------------------------------
" 对浏览代码非常的方便,可以在函数,变量之间跳转等
set tags=./tags;                            "向上级目录递归查找tags文件（好像只有在Windows下才有用）
" -----------------------------------------------------------------------------
"  < a.vim 插件配置 >
" -----------------------------------------------------------------------------
" 用于切换C/C++头文件
" :A     ---切换头文件并独占整个窗口
" :AV    ---切换头文件并垂直分割窗口
" :AS    ---切换头文件并水平分割窗口
 
" -----------------------------------------------------------------------------
"  < cSyntaxAfter 插件配置 >
" -----------------------------------------------------------------------------
" 高亮括号与运算符等
au! BufRead,BufNewFile,BufEnter *.{c,cpp,h,java,javascript} call CSyntaxAfter()
 
" 设置Gvim的对齐线样式
let g:indentLine_char = "┊"
let g:indentLine_first_char = "┊"

 
" 设置终端对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
let g:indentLine_color_term = 239
 
" 设置 GUI 对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
let g:indentLine_color_gui = '#A4E57E'
 

" -----------------------------------------------------------------------------
"  < nerdcommenter 插件配置 >
" -----------------------------------------------------------------------------
" 我主要用于C/C++代码注释(其它的也行)
" 以下为插件默认快捷键，其中的说明是以C/C++为例的，其它语言类似
"<Leader>ci 以每行一个 /* */ 注释选中行(选中区域所在行)，再输入则取消注释
"<Leader>cm 以一个 /* */ 注释选中行(选中区域所在行)，再输入则称重复注释
"<Leader>cc 以每行一个 /* */ 注释选中行或区域，再输入则称重复注释
"<Leader>cu 取消选中区域(行)的注释，选中区域(行)内至少有一个 /* */
"<Leader>ca 在/*...*/与//这两种注释方式中切换（其它语言可能不一样了）
"<Leader>cA 行尾注释
"let NERDSpaceDelims = 1                     "在左注释符之后，右注释符之前留有空格
 
" -----------------------------------------------------------------------------
"  < nerdtree 插件配置 >
" -----------------------------------------------------------------------------
nmap <F3> :NERDTreeToggle<CR> "常规模式下输入 F3 调用插件
function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
  
function! NERDTree_IsValid()  
    return 1  
endfunction  

" -----------------------------------------------------------------------------
"  < winManager 插件配置 >
" -----------------------------------------------------------------------------
let g:NERDTree_title="[NERDTree]"  
"let g:winManagerWindowLayout="NERDTree|TagList"
let g:StartWindowsManager=1
let g:persistentBehaviour=0
nmap <F4> :WMToggle

"Winmanager有个小bug，在打开Winmanager界面时，会同时打开一个空的文件,会影响后续使用.
"在打开Winmanager时关掉这个空文件。在~/.vim/plugin目录下的winmanager.vim文件中找到以
"下函数定义并在第5行下添加第6行的内容：
"function! <SID>ToggleWindowsManager()  
"   if IsWinManagerVisible()  
"      call s:CloseWindowsManager()  
"   else  
"      call s:StartWindowsManager()  
"      exe 'q'  
"   end  
"endfunction

"function! s:Tlist_Window_Exit_Only_Window()中的winbunr(2)改为winbunr(3)，即只剩2个
"窗口时关闭，考虑到2个窗口肯定是同时存在，所以这样还是可行的：
function! s:Tlist_Window_Exit_Only_Window()
    " Before quitting Vim, delete the taglist buffer so that
    " the '0 mark is correctly set to the previous buffer.
    if v:version < 700
    if winbufnr(3) == -1
        bdelete
        quit
    endif
    else
    if winbufnr(3) == -1
        if tabpagenr('$') == 1
           " Only one tag page is present
           bdelete
           quit
        else
           " More than one tab page is present. Close only the current
           " tab page
           close
        endif
    endif
    endif
endfunction

let Tlist_Exit_OnlyWindow=1

"<omnicppcomplete 插件配置 >
" -----------------------------------------------------------------------------
" 用于C/C++代码补全，这种补全主要针对命名空间、类、结构、共同体等进行补全，详细
" 说明可以参考帮助或网络教程等
" 使用前先执行如下 ctags 命令（本配置中可以直接使用 ccvext 插件来执行以下命令）
" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
" 我使用上面的参数生成标签后，对函数使用跳转时会出现多个选择
" 所以我就将--c++-kinds=+p参数给去掉了，如果大侠有什么其它解决方法希望不要保留呀
set completeopt=menu                        "关闭预览窗口
 
 
" -----------------------------------------------------------------------------
"  < TagList 插件配置 >
" -----------------------------------------------------------------------------
" 高效地浏览源码, 其功能就像vc中的workpace
" 那里面列出了当前文件中的所有宏,全局变量, 函数名等
 
" 常规模式下输入 tl 调用插件，如果有打开 Tagbar 窗口则先将其关闭
let Tlist_Ctags_Cmd='C:\tags58\ctags.exe'

"nmap tl :TagbarClose<CR>:Tlist<CR>

"只显示当前文件的tags
"let Tlist_Show_One_File=1
                 
let Tlist_Enable_Fold_Column=0              "使taglist插件不显示左边的折叠行
let Tlist_Exit_OnlyWindow=1                 "如果Taglist窗口是最后一个窗口则退出Vim
"let Tlist_File_Fold_Auto_Close=1            "自动折叠
let Tlist_WinWidth=30                       "设置窗口宽度
let Tlist_Use_Right_Window=0                "在右侧窗口中显示
"let Tlist_Show_Menu=1 
"let Tlist_Auto_Open=1                 "启动vim自动打开taglist
let Tlist_GainFocus_On_ToggleOpen=0   "打开taglist窗口时，焦点在主窗口
"let Tlist_Process_File_Always=1       "始终解析文件中的tag，不管taglist窗口有没有打开


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
autocmd BufNewFile * normal G
"else
"call setline(1, "/*************************************************************************")
"call append(line("."), " > File Name: ".expand("%"))
"call append(line(".")+1, " > Author: hbaojun")
"call append(line(".")+2, " > Mail: hbaojun.huang@gmail.com ")
"call append(line(".")+3, " > Created Time: ".strftime("%c"))
"call append(line(".")+4, " ************************************************************************/")
"call append(line(".")+5, "")
endif
"if &filetype == 'cpp'
"call append(line(".")+6, "#include<iostream>")
"call append(line(".")+7, "using namespace std;")
"call append(line(".")+8, "")
"endif
"if &filetype == 'c'
"call append(line(".")+6, "#include<stdio.h>")
"call append(line(".")+7, "")
"endif
"新建文件后，自动定位到文件末尾
endfunc
