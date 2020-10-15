set showmode
set showcmd
set incsearch " 输入字符串就显示匹配点
set nu
set hlsearch
set hls
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set noexpandtab 
set autoindent 
set cindent
set ruler

set foldmethod=syntax " 用语法高亮来定义折叠  
set foldlevel=100 " 启动vim时不要自动折叠代码  
set foldcolumn=5 " 设置折叠栏宽度  


set cursorline
"括号自动补全  
"":inoremap ( ()<ESC>i  
"":inoremap ) <c-r>=ClosePair(')')<CR>  
"":inoremap { {<CR>}<ESC>O  
"":inoremap } <c-r>=ClosePair('}')<CR>  
"":inoremap [ []<ESC>i  
"":inoremap ] <c-r>=ClosePair(']')<CR>  
"":inoremap " ""<ESC>i  
"":inoremap ' ''<ESC>i  
""function ClosePair(char)  
""	if getline('.')[col('.') - 1] == a:char  
""		return "/<Right>"  
""	else  
""		return a:char  
""	endif  
""endfunction  
""
"--ctags setting--
" 按下F5重新生成tag文件，并更新taglist
"map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
"imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
"set tags=tags
"set tags+=./tags "add current directory's generated tags file
"set tags+=~/.myCtagsStore/tags "add new tags file(刚刚生成tags的路径，在ctags -R 生成tags文件后，不要将tags移动到别的目录，否则ctrl+］时，会提示找不到源码文件)
"set tags +=~/media/nxp-source/source_linux
"set autochdir



"-- Taglist setting --
"let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
"let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边
"let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
"let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
"let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
"是否一直处理tags.1:处理;0:不处理
"let Tlist_Process_File_Always=1 "实时更新tags
"let Tlist_Inc_Winwidth=0
"let Tlist_Auto_Open=1



"-- WinManager setting --
let g:winManagerWindowLayout='FileExplorer|TagList' " 设置我们要管理的插件
let g:persistentBehaviour=0 " 如果所有编辑文件都关闭了，退出vim
let g:defaultExplorer = 0
nmap wm :WMToggle<cr>



" -- MiniBufferExplorer --
"let g:miniBufExplMapWindowNavVim = 1 " 按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
"let g:miniBufExplMapWindowNavArrows = 1 " 按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapCTabSwitchBufs = 1 " 启用以下两个功能：Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在当前窗口打开；ubuntu好像不支持
let g:miniBufExplMapCTabSwitchWindows = 1 " 启用以下两个功能：Ctrl+tab移到下一个窗口；Ctrl+Shift+tab移到上一个窗口；ubuntu好像不支持
let g:miniBufExplModSelTarget = 1 " 不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer



set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8



set laststatus=2      " 总是显示状态栏
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue 
	" 获取当前路径，将$HOME转化为~
function! CurDir()
let curdir = substitute(getcwd(), $HOME, "~", "g")
return curdir
endfunction
set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\



set nocompatible              " 这是必需的 
filetype off                  " 这是必需的 

" 在此设置运行时路径 
set rtp+=~/.vim/bundle/Vundle.vim
" vundle初始化 
call vundle#begin()
" 或者传递一个 Vundle 安装插件的路径
"call vundle#begin('~/some/path/here')

" 让 Vundle 管理 Vundle, 必须
Plugin 'VundleVim/Vundle.vim'

" 下面是不同支持幅度的例子
" 保持 Plugin 命令 在 vundle#begin 和 end 之间
" plugin 在 GitHub 仓库
Plugin 'tpope/vim-fugitive'
" 来自http://vim-scripts.org/vim/scripts.html的插件 
" Plugin 'L9'
" 未托管在GitHub上的Git插件 
" Plugin 'git://git.wincent.com/command-t.git'
" 本地机器上的git软件库（即编写自己的插件时） 
" Plugin 'file:///home/gmarik/path/to/plugin'
" sparkup vim脚本在名为vim的该软件库子目录下。 
" 传递路径，合理设置运行时路径。 
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安装 L9 并避免名称冲突 
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"每个插件都应该在这一行之前  
call vundle#end()            " 这是必需的 
filetype plugin indent on    " 这是必需的 
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




