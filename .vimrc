filetype off    
if  (has("gui_running"))
  set rtp+=$VIM/vimfiles/vundle/
  call vundle#rc('$VIM/bundle/') "插件目录
else
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
endif

"let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'winmanager'
Bundle 'showliu/vbookmark.vim'
Bundle 'chazy/cscope_maps'
"Bundle 'minibufexplorerpp'
Bundle 'yegappan/grep'
Bundle 'taglist.vim'
Bundle 'bufexplorer.zip'
Bundle 'TxtBrowser'
Bundle 'DrawIt'
"indent
Bundle 'evanmiller/nginx-vim-syntax'
Bundle 'php.vim-html-enhanced'
Bundle '2072/PHP-Indenting-for-VIm'
Bundle 'saltstack/salt-vim'
"color
Bundle 'foxconndmd/vim-colors-xterm'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'blackdust.vim'
Bundle 'darkburn'
Bundle 'freya'
Bundle 'Lucius'


"基本设置
"cd $HOME "设置工作目录
set helplang=cn "中文帮助
set fileencodings=ucs-bom,utf-8,utf-16le,gb2312,gbk,cp936,gb18030,ansi,big5,euc-jp,euc-kr,latin1  "自动选择编码
set ambiwidth=double "阻止特殊符号无法显示
set encoding=utf-8  "设置VIM内部默认编码
language message zh_CN.UTF-8  "使用中文提示信息
set history=1000  "记录历史文件数”
set confirm "在处理未保存或只读文件的时候，弹出确认
set autoread "自动加载修改的文件
set nocompatible "与vi不一致

"设置静音模式
set novisualbell "关闭屏幕闪烁
set noerrorbells "关闭错误铃声警告
set t_vb=

"界面设置
set cmdheight=1 "命令栏高度
set number   "显示行号
set laststatus=2 "总是显示状态行
"状态行的显示内容:文件路径、编码、时间、类型
set statusline=%F%m%r%h%w\ [Code=%{&encoding}\ [Format=%{&fileformat}]\ [Type=%Y]\ [Line=%l\ Of\ %L][Column=%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set wildmenu  "在命令模式下使用 Tab 自动补全的时候， 将补全内容使用一个漂亮的单行菜单形式显示出来。
"set completeopt=longest,menu "关闭自动补全预览窗口
syntax enable  "语法高亮
set t_Co=256 "设置256色
set background=dark
set shortmess=atI  "不显示乌干达儿童
set showcmd  "在状态栏显示目前所执行的指令，未完成的指令片段亦

"图形界面配置"
if  (has("gui_running"))
  let $PATH.=';c:\cygwin64\bin\;d:\Program Files\PHP5.4.22\;C:\Python27\'
  au  GUIEnter * simalt ~x "启动最大化
  au! bufwritepost _vimrc source $VIM/_vimrc    
  set mouse=a "鼠标支持"
  "set clipboard+=unnamed "与windows共享剪贴板
  set mousemodel=popup  "右键菜单
  set gfw=Microsoft_YaHei_Mono:h12:cGB2312
  set guifont=Microsoft_YaHei_Mono:h12:cGB2312
  "set guioptions-=m " 隐藏菜单栏
  set langmenu=zh_CN.utf-8 " 设置中文菜单及编码
  set termencoding=GBK "将内部编码转换为显示编码
  set showtabline=2 "始终显示标签栏
  set tabpagemax=20 "最大标签数
  set guioptions-=T " 隐藏工具栏
  "set guioptions-=r " 隐藏右侧滚动条
  set nowrap  "不折行
  set guioptions+=b   "水平滚动条
  colo solarized
  "colo desert
else
  "字符界面配置
  let $PATH=$PATH .":/root/"
  au! bufwritepost .vimrc source ~/.vimrc    
  set termencoding=utf-8 "将内部编码转换为显示编码
  "set paste
  "colo desert-xterm
  colo solarized
endif

"文本编辑设置
set nobackup "修改文件无备份"
set noswapfile
"set nowritebackup
set backspace=2 " 设置退格键可用
filetype plugin indent on " 侦测文件类型
"set showmatch   " 插入括号时，短暂地跳转到匹配的对应括号
"set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 显示括号配对情况
set expandtab "编辑时将所有 Tab 替换为空格
set softtabstop=2  "设置tab键为4个空格"
set shiftwidth=2  "缩进空格数
set smarttab  "一次删除4个空格
au FileType html,python,vim,javascript setl shiftwidth=2 "特定类型文件缩进空格
au FileType html,python,vim,javascript setl tabstop=2
"set spell "打开拼写检查
"set paste "设置粘贴模式，代码不错位
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif "记住上次的位置

"搜索设置"
set ic  "不区分大小写
set hls  "高亮显示匹配内容
set incsearch "搜索时，输入的词句的逐字符高亮
set cursorline "高亮显示当前行"
set whichwrap=b,s,h,l,<,>,[,]  "光标左右循环移动“

"断行设置
"set wrap           " 自动换行
"set nowrap         " 不自动换行
set linebreak       " 整词换行
"set tw=78  "超过78个字符自动断行
set lbr  "不在单词之间断行
set fo+=mB  "打开断行模块对亚洲语言支持。 m 表示允许在两个汉字之间断行， 即使汉字之间没有出现空格。 B 表示
" 两行合并为一行的时候， 汉字与汉字之间不要补空格。

"设置自动对起折叠
set autoindent "" 自动对齐,继承前一行的缩进方式，特别适用于多行注释
set smartindent "开启新行时使用智能自动缩进
set cindent   "c风格程序缩进
"set foldopen=all  "光标遇到折叠，折叠就打开
"set foldclose=all "移开折叠时自动关闭折叠
"set foldenable    "开始折叠
"set foldmethod=syntax " 设置语法折叠
"set foldcolumn=0      " 设置折叠区域的宽度
"setlocal foldlevel=1  " 设置折叠层数

"PHP运行
autocmd FileType php map <F5> :!php %<CR>
autocmd FileType php map <F6> :call PhpCheckSyntax()<CR>
"autocmd FileType php map <F7> :call PhpParseExecute()<CR>

"PHP检查语法
function! PhpCheckSyntax()
  setlocal makeprg=php\ -l\ -n\ -d\ html_errors=off
  setlocal shellpipe=>
  setlocal errorformat=%m\ in\ %f\ on\ line\ %l
  make %
endfunction

"PHP在Quick窗口运行
function! PhpParseExecute()
  setlocal makeprg=php\ -f
  setlocal shellpipe=>
  setlocal errorformat=%m\ in\ %f\ on\ line\ %l
  make %
  clist
endfunction

"启用omni补全.
au FileType php set omnifunc=phpcomplete#CompletePHP
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType mysql set omnifunc=mysqlcomplete#CompleteMYSQL
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType python setlocal omnifunc=pythoncomplete#Complete
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" phpDocumentor for VIM
"inoremap  :call PhpDocSingle()
"nnoremap  :call PhpDocSingle()
"vnoremap  :call PhpDocRange()

"NERDTree 集成winmanager设置
"let g:NERDTree_title='NERD Tree'
"function! NERDTree_Start()
"    exec 'NERDTree'
"endfunction
"function! NERDTree_IsValid()
"    return 1
"endfunction

"winmanager设置
"let g:winManagerAutoOpen=1 "自动启动
let g:defaultExplorer = 1
let g:persistentBehaviour=0 "只剩一个窗口时退出
let g:winManagerWindowLayout='FileExplorer,BufExplorer|TagList' "设置WM窗口内容，在文件管理下ctrl+n切换到BufExplorer
"let g:winManagerWindowLayout='NERDTree,BufExplorer|TagList' "设置WM窗口内容，在文件管理下ctrl+n切换到BufExplorer
"let g:winManagerOnRightSide=1 "窗口放右侧
"let g:winManagerWidth = 30 "设置WM窗口宽度
nmap <c-w><c-f> :FirstExplorerWindow<cr> "切换到第一个窗口
nmap <c-w><c-b> :BottomExplorerWindow<cr> "切换到最后一个窗口
nmap wm :WMToggle<cr> "打开WM窗口
nmap wf :NERDTreeToggle<cr> "打开文件管理器

"taglist设置
"let Tlist_Ctags_Cmd = '"d:\Program Files\ctags\ctags.exe"'
if  (has("gui_running"))
  let Tlist_Ctags_Cmd = 'ctags.exe'
else
  let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif
set tags=tags;
set autochdir "自动切换到文件目录
"let Tlist_Show_One_File=1 "显示所有文件Tag
"let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "如Tag为最后窗口退出
let Tlist_Use_SingleClick=1 "单击时跳转
"let Tlist_Process_File_Always=1 "不管taglist窗口是否打开，始终解析文件中的tag
"let Tlist_GainFocus_On_ToggleOpen=1 "打开taglist时获得输入焦点
"let Tlist_Show_Menu=1 "Gvim下显示菜单
"let Tlist_Auto_Open=1  "自动打开taglist
"
"
"c: Find functions calling this function
map <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
"au FileType php call Do_CsTag()

set nocscopeverbose
autocmd FileType php map <F12> :call Do_CsTag()<CR>
autocmd FileType php map <F11> :call LoadCscope()<CR>

if(has("win32") || has("win95") || has("win64") || has("win16"))
  let g:iswindows=1
else
  let g:iswindows=0
endif

function! LoadCscope()
  if(g:iswindows==1)
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
      let path = strpart(db, 0, match(db, "/cscope.out$"))
      set nocscopeverbose " suppress 'duplicate connection' error
      exe "cs add " . db . " " . path
      set cscopeverbose
    endif
    if (executable("cscope") && has("cscope"))
      let UpperPath = findfile("cscope.out", ".;")
      if (!empty(UpperPath))
        let path = strpart(UpperPath, 0, match(UpperPath, "cscope.out$") - 1) 
        if (!empty(path))
          let s:CurrentDir = getcwd()
          let direct = strpart(s:CurrentDir, 0, 2) 
          let s:FullPath = direct . path
          let s:AFullPath = globpath(s:FullPath, "cscope.out")
          let s:CscopeAddString = "cs add " . s:AFullPath . " " . s:FullPath 
          execute s:CscopeAddString 
        endif
      endif
    endif
  else
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
      let path = strpart(db, 0, match(db, "/cscope.out$"))
      set nocscopeverbose " suppress 'duplicate connection' error
      exe "cs add " . db . " " . path
      set cscopeverbose
    endif
  endif
endfunction

function! Do_CsTag()
  let dir = getcwd()
  if filereadable("tags")
    if(g:iswindows==1)
      let tagsdeleted=delete(dir."\\"."tags")
    else
      let tagsdeleted=delete("./"."tags")
    endif
    if(tagsdeleted!=0)
      echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
      return
    endif
  endif
  if has("cscope")
    silent! execute "cs kill -1"
  endif
  if filereadable("cscope.out")
    if(g:iswindows==1)
      let csoutdeleted=delete(dir."\\"."cscope.out")
    else
      let csoutdeleted=delete("./"."cscope.out")
    endif
    if(csoutdeleted!=0)
      echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
      return
    endif
  endif
  if(executable('ctags'))
    silent! execute "!ctags -R --languages=php --langmap=php:.engine.inc.module.theme.install.php --tag-relative=yes --PHP-kinds=+cf"
  endif
  if(executable('cscope') && has("cscope") )
    if(g:iswindows!=1)
      silent! execute "!find . -name '*.php' -o -name '*.inc' > cscope.files"
    else
      silent! execute "!dir /s/b *.php,*.inc > cscope.files"
    endif
    silent! execute "!cscope -b"
    execute "normal :"
    if filereadable("cscope.out")
      execute "cs add cscope.out"
    endif
  endif
endfunction

"neocomplcache配置
let g:neocomplcache_enable_at_startup = 1 "启动neocomplcache
"let g:neocomplcache_enable_auto_select = 1 "自动选择第一个
let g:neocomplcache_enable_smart_case = 1 "大写字母区分大小写
let g:neocomplcache_enable_camel_case_completion = 1 "入大写字母时, 进行模糊搜索可能性词语  例如，当输入AE时会匹配ArgumentsException。
"let g:neocomplcache_enable_underbar_completion = 1 " 启用下划线补全.进行模糊搜索匹配的词。例如,当输入'p_h'时会匹配'public_html'。默认值是 0
let g:neocomplcache_max_list = 20
let g:neocomplcache_min_keyword_length = 2
let g:neocomplcache_min_syntax_length = 2

"inoremap <expr><Space>  pumvisible() ? "\<C-n>" : "\<Space>"  "定义补全选择快捷键
"let g:neocomplcache_min_syntax_length = 3 " 设定最小语法关键词长度.
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"supertab设置
"let g:SuperTabRetainCompletionType=1 "记住上次的补全方式,直到用其他的补全命令改变它
"let g:SuperTabDefaultCompletionType="<C-X><C-O>" "改变自动补全快捷键

"minibufexpl设置
let g:miniBufExplMapWindowNavVim = 1 "多窗口下ctrl加j/k/l/h/切换窗口
let g:miniBufExplMapWindowNavArrows = 1 "多窗口下ctrl加箭头切换窗口
"let g:miniBufExplMapCTabSwitchBufs = 1 "ctrl加Tab循环切换窗口
"let g:miniBufExplModSelTarget = 1
let g:miniBufExplForceSyntaxEnable = 1
map <C-n> :bprev!<CR> "切换到下一个Buf
"map <C-b> :bprev!<CR> "切换到上一个Buf

"grep插件
"nnoremap <silent> <F3> :Grep<CR> "F3 Grep查找
nnoremap <silent> <F3> :Rgrep<CR>

"fencview.vim 插件设置
"let g:fencview_autodetect = 1 "开启自动识别编码
"let g:fencview_checklines = 10 "检查前后10行来判断编码
"
"Txtbrowser设置
au BufEnter *.txt setlocal ft=txt

"vbookmark设置
"let g:vbookmark_bookmarkSaveFile = ".vimbookmark"
"禁用默认的按键绑定
"let g:vbookmark_disableMapping = 1
"使用 Visual Studio 书签的按键方式
"nnoremap <silent> <C-F2> :VbookmarkToggle<CR>
"nnoremap <silent> <F2> :VbookmarkNext<CR>
"nnoremap <silent> <S-F2> :VbookmarkPrevious<CR>

"模仿MS快捷键
vmap <C-c> "yy
vmap <C-x> "yd
nmap <C-v> "yp
vmap <C-v> "yp
nmap <C-a> ggvG$
imap <C-s> <Esc>:wa<cr>i<Right>
nmap <C-s> :wa<cr>
inoremap <C-a> <esc>ggVG "插入模式下C-a全局选中
vmap <C-c> "+y "可视模式下对选中模块进行复制C-c或剪切C-x
vmap <C-x> "+x
"插入模式下C-v粘贴
inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

"分割窗口快捷键
nmap wv <C-w>v   " 垂直分割当前窗口
nmap wc <C-w>c   " 关闭当前窗口
nmap ws <C-w>s   " 水平分割当前窗口

"一些不错的映射转换语法,如果在一个文件中混合了不同语言时有用
nmap <leader>1 :set filetype=xhtml<CR>
nmap <leader>2 :set filetype=css<CR>
nmap <leader>3 :set filetype=javascript<CR>
nmap <leader>4 :set filetype=php<CR>
let mapleader=',' "自定义leader键
nmap ,s :source $VIM/_vimrc <CR>
