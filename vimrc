" 不兼容模式
set nocompatible              " be iMproved, required
" 关闭文件类型检测
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" install vim-go plugin
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'kshenoy/vim-signature'
"Plugin 'mileszs/ack.vim'
"Plugin 'Yggdroot/LeaderF'
"Plugin 'kien/ctrlp.vim'
"Plugin 'rking/ag.vim'
Plugin 'airblade/vim-rooter' " https://github.com/airblade/vim-rooter

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'morhetz/gruvbox' 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" 打开语法高亮
syntax on
" 设置颜色数量
set t_Co=256
" 使用gruvbox配色方案
colorscheme gruvbox
" 设置背景为暗色
set background=dark

" common configure
set noswapfile
set mouse=a " 激活鼠标使用
set wrap " 自动换行
set showmatch " 显示括号匹配
set sw=4 " 设置软宽度
set tabstop=4 " 设置Tab长度为 4 空格
set shiftwidth=2 " 设置自动缩进长度为2空格
set gdefault " 行内替换
set expandtab " 使用空格来替换 Tab
set autoindent " 继承前一行的缩进方式，适用于多行注释"
set autowrite " 自动保存
set nocompatible " 关闭 vi 兼容模式
" set nonumber " 关闭行号显示
set number " 显示行号
set visualbell  "禁止响铃"
set incsearch "边输入边搜索(实时搜索)")"
set hlsearch "开启搜索结果的高亮显示"
set confirm " 在处理未保存或只读文件时，弹出确认
set history=100 " 设置历史记录步数
set backspace=indent,eol,start  " more powerful backspacing
"set pastetoggle=<F2> " 粘贴代码保留缩进
set autoread    "文件在Vim之外修改过，自动重新读入"
set autochdir
" 从不备份
" set nobackup
" set noswapfile
set foldcolumn=0 "关闭代码折叠线

" 设置缩进对齐
let g:indentLine_enabled = 1

" golang configure ====> start
" Override the icase field in 'omnifunc' results. By default it is set to 0.
" See 'complete-items' for details.
let go_code_completion_icase = 1

" Use this option to show the type info (|:GoInfo|) for the word under the
" cursor automatically. Whenever the cursor changes the type info will be
" updated. By default it's disabled. The delay can be configured with the
" |'g:go_updatetime'| setting.
let g:go_auto_type_info = 0
let go_imports_mode = "goimports"
" let g:go_updatetime = 1
" let g:go_gocode_autobuild = 1
" go test time out setting
let g:go_test_timeout = '5m'

" 当使用一个不支持的Vim版本时(支持的版本：Vim版本大于7.4.1689或者Neovim)，开启告警，默认开启
let g:go_version_warning = 1    
" 开启`omnifunc`代码自动补全，默认开启
let g:go_code_completion_enabled = 1
let g:go_auto_type_info = 1
" 保存时执行gofmt格式化代码，默认开启
let g:go_fmt_autosave = 1
" 保存时自动删除无用的包，添加缺失的包。这里可以关闭，否则保存时，经常容易卡死或者保存延时很高
let g:go_imports_autosave = 0
" 保存时自动格式化go.mod文件
let g:go_mod_fmt_autosave = 1
" 格式化代码时简化代码
let g:go_fmt_options = {
    \ 'gofmt': '-s',
    \ }
" 指定格式化代码时使用的命令，可选命令：gofmt, goimports, gopls
let g:go_fmt_command = "goimports"                       
" 当格式化失败时，不报错。
let g:go_fmt_fail_silently = 1
" 开启gofmt实验模式
let g:go_fmt_experimental = 1    
" 键入shift-k时，在另一个窗口显示光标下word的godoc
let g:go_doc_keywordprg_enabled = 1
" 使用浮动窗口显示word的godoc信息
let g:go_doc_popup_window = 1
" Maximum height for the GoDoc window created with |:GoDoc|. Default is 20.
let g:go_doc_max_height = 20
" Show GoDoc in balloon.
let g:go_doc_balloon = 0

" Use this option to define the command to be used for |:GoFillStruct|. By
" default `fillstruct` is used. Valid values are `fillstruct` and `gopls`. By
" default it is `fillstruct`.
let g:go_fillstruct_mode = 'fillstruct'

" Use this option to define the command to be used for |:GoReferrers|. By
" default `gopls` is used, because it is the fastest and works with Go modules.
" Valid options are `gopls` and `guru`. By default it's `gopls`.
let g:go_referrers_mode = 'gopls'

" Use this option to define the command to be used for |:GoImplements|.
" The Implements feature in gopls is still new and being worked upon.
" Valid options are `gopls` and `guru`. By default it's `gopls`.
let g:go_implements_mode = 'gopls'

" :GoDef所执行的命令，可选项：godef, gopls和guru。默认gopls，因为它很快
let g:go_def_mode = 'gopls'
" 是否可以使用gopls，默认可以
let g:go_gopls_enabled = 1


" Use this option to jump to an existing buffer for `:GoDef`, `:GoDefType`, and
" their mapping variants that cause splits. By default it's disabled.
let g:go_def_reuse_buffer = 1

" The commandline arguments to pass to gopls.
" By default, it is `['-remote=auto']`.
let g:go_gopls_options = ['-remote=auto']

" Specifies whether `gopls` should include suggestions from unimported packages.
" When it is `v:null`, `gopls`' default will be used. By default it is `v:null`.
let g:go_gopls_complete_unimported = v:null


" Specifies whether `gopls` should use deep completion.
" When it is `v:null`, `gopls`' default will be used. By default it is `v:null`.
let g:go_gopls_deep_completion = v:null

" Specifies how `gopls` should match for completions.
" Valid values are `v:null`, `fuzzy`, and `caseSensitive`. When it is `v:null`,
" `gopls`' default will be used. By default it is `v:null`.
let g:go_gopls_matcher = v:null


" 开启默认的按键绑定
" CTRL-], <C-LeftMouse>, g<C-LeftMouse> and (`gd`) 绑定到 :GoDef
" CTRL-t 绑定到 :GoDefPop.
let g:go_def_mapping_enabled = 1
" 高亮`<-`周围的空白符，这些空格不符合Go代码规范
let g:go_highlight_chan_whitespace_error = 0
let g:go_template_autocreate = 1
let g:go_autodetect_gopath = 1
" 执行`:GoAddTags`时tag名字格式，这里设置为驼峰格式
let g:go_addtags_transform = 'camelcase'

" 高亮函数和方法
let g:go_highlight_function_parameters = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_operators = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_variable_declarations = 1
" let g:go_highlight_variable_assignments = 1

" 标签操作
" 当输入 tn 时自动补全为 tabnew
ca tn tabnew
" 当输入 tc 时自动补全为 tabclose
ca tc tabclose
" 当输入 ts 时自动补全为 tabs
ca ts tabs


" NERDTree Settings Start
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1 " Show hidden files
" NERDTree Settings End

" 配置 Vim leader 键：空格键
nnoremap <SPACE> <Nop>
map <Space> <Leader>

map <2-LeftMouse> :GoDef <cr>
map <RightMouse> :GoDefPop <cr>
map <cr> :GoDef <cr>
map <C-I> :GoDefPop <cr>
map <S-K> :GoDoc <cr>
map <S-L> :GoIfErr <cr>
map <S-T> :GoDefType <cr>
map <S-M> :GoInfo <cr>
map <S-H> :GoSameIdsToggle <cr>
map <S-T> :GoAddTag<cr>
map <S-P> :GoImplements<cr>
map <S-R> :GoRename<cr>
map <S-C> :GoCallers<cr>
map <S-F> :GoFillStruct<cr>
nnoremap <C-w>c :bd<cr>

"let g:ackprg = 'ack'  " 设置使用的搜索命令，默认为ack
"let g:ackprg = 'ag --nogroup --nocolor --column'
"let g:fzf_layout = { 'down': '~30%' }
"let g:fzf_preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']

let g:fzf_preview_window = ['right:hidden', 'ctrl-/']
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'rounded' } }
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
"let g:fzf_action = { 'ctrl-c': ['abort', 'cancel'] }
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
"ctrl-o:toggle+up,ctrl-space:toggle-preview"'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
"-g '!{node_modules,.git}'
" 使用 rg 工具在当前项目中查询某个字符串
nnoremap <leader>f :RG<cr>
" 查看最近打开的文件和打开的缓冲区
nnoremap <leader>r :History<cr> 
" 查看打开的缓冲区
nnoremap <leader>j :Buffers<cr>
" 在项目根目录查找文件
nnoremap <leader>k :Files<cr>
"nnoremap <leader>k :cd<cr>:Files<cr>
" 在文件所在的目录查找文件
nnoremap <leader>l :cd %:p:h<cr>:Files<cr>
" 查找当前项目的 Tag (ctags -R)
nnoremap <leader>t :Tags<cr>
nnoremap <C-Q> :RG<cr>
nnoremap <C-R> :History<cr> 
nnoremap <C-E> :Buffers<cr>
nnoremap <C-K> :Files<cr>

inoremap { {<cr>}<Esc>ko
"inoremap ( ()<Esc>ha
"inoremap [ []<Esc>ha
"inoremap " ""<Esc>ha
"inoremap ' ''<Esc>ha
"inoremap ` ``<Esc>ha

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  "autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<cr>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  "autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  "autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
  autocmd BufNewFile,BufFilePre,BufRead * set wrap
augroup END

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
