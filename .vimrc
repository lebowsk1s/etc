"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set history=100
filetype plugin indent on

set autoread
if has('mouse')
  set mouse=a
endif

let mapleader = ","
let g:mapleader = ","
"映射快捷键开始命令为","号,g:表示全局设置.其使用方法见下

nmap <leader>w :w!<cr>
"nmap表示在普通状态下,上面已经写过,mapleader被映射为","号,
"那么这里可以用,w命令来代替:w!命令,亲自试一下,是不是方便多了,手不
"用再挪大半个键盘打几个键了.apleader可以自由设定

"在Linux系统中，配置路径应在$HOME下
"map <leader>s :source $VIM/_vimrc<cr>
map <leader>s :source $HOME/.vimrc<cr>
"VIM的配置文件名字就是vimrc
map <leader>e :e! $HOME/.vimrc<cr>
"快速打开配置文件
map <leader>q :q<cr>
autocmd! bufwritepost vimrc source $HOME/.vimrc
"autocmd是自动执行命令,这句的意思是当配置文件被更改后重新
"读入,不需要你用,w,s重复操作了
behave mswin

"set foldenable
"set fdm=syntax
"使能语法折叠
"normal zR
"使能折叠后，默认打开所有折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme desert
syntax enable
"语法高亮

if has("gui_running")
  set guioptions-=T
  set guioptions-=M
endif
"在GUI界面下,set guioptions-=T表示不显示工具栏,工具栏

autocmd BufEnter *: syntax syncbind fromstart
"自动匹配用户读入的程序文件
"set guifont=Monaco:h12
"set guifont=DejaVu\ Sans\ Mono 15
set guifont=Courier\ 10\ Pitch\ 11
"set guifont=Consolas 15
"设置字体
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
"字体及缩进设置，用空格代替制表符

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=7
"scrolloff光标上下两侧最少保留的屏幕行数
set wildmenu
"命令行补全以增强模式运行.就是屏幕下方的命令行状态里,不设置时
"命令补全需要按Tab键,设置后不需要按Tab键,也会尽可能多的匹配对应项.
set ruler
"就是设置标尺.在右下角,无论何时都显示所在的行,列
set cmdheight=2
"默认方式下,命令行的高度是一行,为了看的清楚,这里设置为2行
set number
"显示行号
set hidden
"设置后编辑结束时隐藏缓冲区,否则卸载.
set backspace=eol,start,indent
"默认情况下,backspace键,也就是我们常说的退格键,只能在本行进行移
"动,现在可以扩展到影响以下参数了
"indent 允许在自动缩进上退格
"eol 允许在换行符上退格 (连接行)
"start 允许在插入开始的位置上退格；CTRL-W 和 CTRL-U 到达插入开始的位
"置时停留一次。
set whichwrap+=<,>,h,l
"和退格键一样,左右方向键默认也只能在本行移动,用起来会很别扭,这条设置过之后,
"就没有限制了, 使指定的左右移动光标的键在行首或行尾可以移到前一行或者后一行
"<和>是用来调整缩进的.
set ignorecase
"搜索时忽略大小写
set incsearch
"搜索时高亮关键词
set hlsearch
"搜索出之后,高亮关键词.必设项

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Statuslinee
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
"默认情况下,只有两个以上的窗口才显示状态栏.其值定义为
"本选项的值影响最后一个窗口何时有状态行:
"0: 永不
"1: 只有在有至少两个窗口时
"2: 总是
"注意:本选项与前面的set ruler功能上有重叠,如果设置了本项,
"set ruler值将被遮住.可以选择使用.
"状态栏上显示的功能可以更复杂,更多,且中定制(当然可以包含行列数)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Moving around tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"设置在分割窗口工作状态下，切换窗口的快捷键

inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
"在插入模式中，按住Ctrl键加hjkl能实现方向键左下上右的功能

nmap <silent> <F2>      :nohlsearch<CR>
imap <silent> <F2> <C-O>:nohlsearch<CR>
"在普通模式和插入模式，按F2取消刚搜索的关键词高亮

map <A-2> :tabnext<CR>
map <C-tab> :tabnext<CR>
map <A-1> :tabNext<CR>
map <leader>to :tabonly<CR>
map <leader>tn :tabnew<CR>
map <C-t> :tabnew<CR>
"标签页操作快捷键

map <leader>x :Explore<CR>
"打开当前目录文件列表
map <F4> :call Search_Word()<CR>
"搜索当前词，并打开quickfix窗口

set updatetime=100
"启动函数变量快速浏览的时间设置


command! Delsp %s/\s\+$//
"常用正则表达式，清除行末空格

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = 'ctags'     "设定windows系统中ctags程序的位置

let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 0         "在右侧窗口中显示taglist窗口

map <leader>ct :silent !ctags -R<cr>
map <leader>tl :Tlist<cr>

"""""""""""""""""""""""""""""
" Timestamp
""""""""""""""""""""""""""""""
nmap <F6> :execute "normal i" . strftime("//%x %X")<Esc>
imap <F6> <Esc>:execute "normal i" . strftime("//%x %X")<Esc>

""""""""""""""""""""""""""""""""
" 针对C语言，括号等自动补全
""""""""""""""""""""""""""""""""
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<Up><ESC>A
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i

"function! ClosePair(char)
""    if getline('.')[col('.')-1]==a:char
"        return "\<Right>"
"    else
"        return a:char
"    endif
"endfunction
