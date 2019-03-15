set nocompatible              " 去除VI一致性,必须
set fileformat=unix            " 会显示 dos 下的 \r\n 为 ^M
set shiftwidth=4 | set expandtab " 把 tab 键的输入变成空格，并且是 4 个
syntax on                          " 开启语法高亮

" 配置 vundle 开始
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'dpelle/vim-LanguageTool'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'rhysd/vim-clang-format'
Plugin 'majutsushi/tagbar'
Plugin 'tmhedberg/SimpylFold'
call vundle#end()              
filetype plugin indent on    " 自动检测文件类型并加载插件
" 配置 vundle 结束

" 配置格式化 clang-format 开始 
map <C-K> :pyf ~/.vim/prebuild/clang/llvm/share/clang/clang-format.py<cr>  
" 配置格式化 clang-format 结束

" 配置补全 you_complete_me 开始
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'  " 启用默认配置
let g:ycm_confirm_extra_conf = 0  " 关闭重复打开提醒
let g:ycm_python_binary_path = 'python3'  " 使用 python3 作为 python interpreter 
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>

" 配置补全 you_complete_me 结束
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-h>"
let g:UltiSnipsEditSplit="vertical"

set backupdir-=.
set backupdir^=~/tmp,/tmp

" common
set nu
set mouse=a " 开启鼠标控制vim

" 缩进
filetype indent on " 自适应不同语言的智能缩进
set expandtab " 将制表拓展为空格
set tabstop=2 " 设置编辑是制表占用的空格
set shiftwidth=2 " 设置格式化是制表占用的空格

" nerd tree
map <leader>t :NERDTreeToggle<CR>
" clang format
map <leader>f :ClangFormat<CR>
" json
map <leader>j :%!jq '.'<CR>
" Tagbar
nmap <F8> :TagbarToggle<CR>
" fdm
set fdm=indent
set foldlevel=1
set foldlevelstart=99
" encode
set encoding=utf-8
" del
map D :"_d
" no swp file
set noswapfile
