" -----------------------------------------------------------------------------
"  < 界面配置 >
" -----------------------------------------------------------------------------
set nu                                                "显示行号
syntax on                                             "开启语法高亮 
set t_Co=256                                          "在终端启用256色
set ruler
set laststatus=2                                      "启用状态栏信息
set cmdheight=1                                       "设置命令行的高度为2，默认为1
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
colorscheme Tomorrow-Night                            "Gvim配色方案
set guifont=YaHei\ Consolas\ Hybrid\ 11               "设置字体:字号（字体名称空格用下划线代替）
set gfw=Microsoft\ YaHei\ Mono\ 11
set nowrap                                            "设置不自动换行
set cursorline                                        "突出显示当前行
set vb t_vb=                                          "关闭提示音 
set showmatch                                         "高亮匹配括号
set matchtime=1
"au GUIEnter * simalt ~x                              "窗口启动时自动最大化
set shortmess=atI                                     "去掉欢迎界面
winpos 100 10                                         "指定窗口出现的位置，坐标原点在屏幕左上角
set lines=40 columns=120                              "指定窗口大小，lines为高度，columns为宽度
set textwidth=80
"set wrap                                              "超过textwidth折行


"set guioptions-=m
"set guioptions-=T
set guioptions-=r
set guioptions-=L

" 设置Gvim的对齐线样式
let g:indentLine_char = "┊"
let g:indentLine_first_char = "┊"
 
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
 
" 启用每行超过80列的字符提示（字体变蓝并加下划线），不启用就注释掉
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)


" -----------------------------------------------------------------------------
"  < 编码配置 >
" -----------------------------------------------------------------------------
" 注：使用utf-8格式后，软件与程序源码、文件路径不能有中文，否则报错
set encoding=utf-8                                    "设置gvim内部编码，默认不更改
set fileencoding=utf-8                                "设置当前文件编码，可以更改，如：gbk（同cp936）
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1     "设置支持打开的文件的编码
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
language messages zh_CN.utf-8                         "解决consle输出乱码

set fileformat=unix                                   "设置新（当前）文件的<EOL>格式，可以更改，如：dos（windows系统常用）
set fileformats=unix,dos,mac                          "给出文件的<EOL>格式类型

source $VIMRUNTIME/delmenu.vim    "解决菜单乱码
source $VIMRUNTIME/menu.vim


" -----------------------------------------------------------------------------
"  < 编写文件时的配置 >
" -----------------------------------------------------------------------------
filetype plugin on                                    "针对不同的文件类型加载对应的插件
filetype plugin indent on                             "对特定文件启用相关缩进
filetype indent on

set ai                                                "打开普通文件类型的自动缩进
set smartindent                                       "启用智能对齐方式
set expandtab                                         "将Tab键转换为空格
set tabstop=4                                         "设置Tab键的宽度，可以更改，如：宽度为2
set shiftwidth=4                                      "换行时自动缩进宽度，可更改（宽度同tabstop）
set softtabstop=4                                     "连续空格视为制表符
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度
set et                                                "将所有tab替换成空格
"set foldenable                                       "启用折叠
"set foldmethod=indent                                "indent 折叠方式
"set foldmethod=marker                                "marker 折叠方式
set foldlevel=9999
set grepprg=grep\ -nH\ $*

set mouse=a                                           "在任何模式下启用鼠标
set selection=exclusive
set selectmode=mouse,key
set backspace=indent,eol,start
set autoread                                          " 当文件在外部被修改，自动更新该文件
set confirm                                           "处理为保存或只读文件时，弹出确认
set autowrite                                         "自动保存
set iskeyword+=_,$,@,%,#,-                            "带有如下符号的单词不被换行分割
set lbr                                               "不在单词内断行

set is "提前开始检索
set ignorecase                                        "搜索模式里忽略大小写

set smartcase                                         "如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开ignorecase选项时才会使用 
"set noincsearch                                      "在输入要搜索的文字时，取消实时匹配
set hlsearch
set incsearch 	                                      "在输入要搜索的文字时，实时匹配       


" -----------------------------------------------------------------------------
"  <定义快捷键> 
" -----------------------------------------------------------------------------
imap <c-k> <Up>                                       " Ctrl + K 插入模式下光标向上移动
imap <c-j> <Down>                                     " Ctrl + J 插入模式下光标向下移动
imap <c-h> <Left>                                     " Ctrl + H 插入模式下光标向左移动
imap <c-l> <Right>                                    " Ctrl + L 插入模式下光标向右移动
 


" -----------------------------------------------------------------------------
"  < Vundle 插件管理工具配置 >
" -----------------------------------------------------------------------------
" 用于更方便的管理vim插件，具体用法参考 :h vundle 帮助
" Vundle工具安装方法为在终端输入如下命令
" git clone https://github.com/gmarik/vundle.git /usr/share/vim/vimfiles/bundle/Vundle.vim
set nocompatible                                      "禁用 Vi 兼容模式
filetype off                                          "禁用文件类型侦测
 
set rtp+=/usr/share/vim/vimfiles/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'gmarik/snipmate.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/a.vim'
"Plugin 'vim-scripts/ZoomWin'
"Plugin 'vim-scripts/winmanager'
"Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'vim-scripts/c.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/SuperTab'
"Plugin 'vim-scripts/Markdown'
"Plugin 'vim-scripts/vimrepress'
Plugin 'vim-scripts/DoxygenToolkit.vim'
"Plugin 'vim-scripts/vim-zimwiki-syntax'
"Plugin 'vim-scripts/TabBar'
"Plugin 'vim-scripts/OmniCppComplete'
"Plugin 'vim-scripts/Vimpress'
Plugin 'vim-scripts/ctags.vim'
"Plugin 'vim-scripts/cSyntaxAfter'
"Plugin 'vim-scripts/vim-R-plugin'
"Plugin 'vim-scripts/The-NERD-tree'
"Plugin 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'gerw/vim-latex-suite'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'szw/vim-ctrlspace'
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
call vundle#end()
filetype on                                           "打开文件类型侦测

" -----------------------------------------------------------------------------
"  < cscope 工具配置 >
" -----------------------------------------------------------------------------
if has("cscope")
    set cscopequickfix=s-,c-,d-,i-,t-,e-              "设定可以使用 quickfix 窗口来查看 cscope 结果
    set cscopetag                                     "使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳转
    set csto=0                                        "如果你想反向搜索顺序设置为1
    if filereadable("cscope.out")                     "在当前目录中添加任何数据库
        cs add cscope.out
    elseif $CSCOPE_DB != ""                           "否则添加数据库环境中所指出的
        cs add $CSCOPE_DB
    endif
    set cscopeverbose
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

" -----------------------------------------------------------------------------
"  < ctags 工具配置 >
" -----------------------------------------------------------------------------
set tags=./tags;                                       "向上级目录递归查找tags文件（好像只有在Windows下才有用）
 
" -----------------------------------------------------------------------------
"  < TagList 插件配置 >
" -----------------------------------------------------------------------------
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File=1                              "只显示当前文件的tags
"let Tlist_Enable_Fold_Column=0                        "使taglist插件不显示左边的折叠行
let Tlist_Exit_OnlyWindow=1                            "如果Taglist窗口是最后一个窗口则退出Vim
"let Tlist_File_Fold_Auto_Close=1                      "自动折叠
let Tlist_WinWidth=30                                  "设置窗口宽度
let Tlist_Use_Right_Window=0                           "在右侧窗口中显示
let Tlist_Show_Menu=1 
let Tlist_Auto_Open=1                                  "启动vim自动打开taglist
let Tlist_GainFocus_On_ToggleOpen=0                    "打开taglist窗口时，焦点在主窗口
let Tlist_Process_File_Always=1                        "始终解析文件中的tag，不管taglist窗口有没有打开
nmap tl :TagbarClose<CR>:Tlist<CR>                     "常规模式下输入 tl 调用插件，如果有打开 Tagbar 窗口则先将其关闭
