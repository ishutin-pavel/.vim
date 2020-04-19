"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"git config --global github.user ishutin-pavel

" Задачи:
" Переключение раскладки на Русскую машинопись <C-^>
" Показать пробельные символы

"------------------
" Конфиг
"------------------

    "Загрузить произвольный конфиг
    ":so[urce] {file}

    "Сохранить и применить текущий .vimrc
    ":w | so %

    "Горячая клавиша '<leader>w' - сохранить и применить
    nmap <leader>w :w<cr>:so%<cr>

"------------------
" Vandle Plagin
"------------------

    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    "let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    "Оборачивает код
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-repeat'

    "Подсветка парных тегов
    Plugin 'gregsexton/MatchTag'

    "Комментарии
    Plugin 'tpope/vim-commentary'

    "Подсветка синтаксиса
    Plugin 'lumiliet/vim-twig'
    Plugin 'sickill/vim-monokai'
    Plugin 'hail2u/vim-css3-syntax'

    "Gist Github
    Plugin 'mattn/webapi-vim'
    Plugin 'mattn/gist-vim'

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
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

    filetype plugin on

"------------------
" Автосохранение
"------------------

    set nobackup
    set nowb
    set noswapfile

"----------
" Кодировка
"----------

    set fileencoding=utf-8
    set encoding=utf-8
    set termencoding=utf-8

"-------------
" Правописание
"-------------

    "по какому языку работаем
    set spelllang=ru

    "в этот файл записываем слова не
    set spellfile=termins.utf-8.add

"-----
" Табы
"-----

    set shiftwidth=2 "Длина таба в пробелах Normal mode
    set tabstop=2    "Длина таба в пробелах
    set expandtab    "Преобразует указанное чило пробелов в tabstop в символ табуляции
    set autoindent   "Включить автоотступ

"------
" Цвета
"------

    "Подсветка синтаксиса
    syntax enable

    "Подсветка текущей строки
    "set cursorline

    "Цветовая схема. Устанавливается отдельно
    colorscheme monokai

    "Подсветка CSS3 от плагина hail2u/vim-css3-syntax
    augroup VimCSS3Syntax
      autocmd!
      autocmd FileType css setlocal iskeyword+=-
    augroup END

"------
" Поиск
"------

    "Подсветка результатов поиска
    set hlsearch

    " Ignore case when searching
    set ignorecase

    " When searching try to be smart about cases 
    set smartcase

    "Искать во всех вложенных каталогах проекта :find
    set path+=**

    "Меню выбора файла Next: <C-n> Previous: <C-p>
    set wildmenu
    set wildmode=full

"-----------------
" Другие параметры
"-----------------

    "Отображаем номера строк
    "set number

    "Показать незавершенные команды
    set showcmd

    "Разрешить переключаться по файлам без сохранения
    set hidden

    "Включаем мышь
    set mouse=i

    "Курсор в виде блока
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"

    "Не обновлять экран пока выполняется макрос
    set lazyredraw

    "Определение расширения файла
    set suffixesadd+=.php

"------------
" Status Line
"------------

    "всегда показывать строку состояния
    set laststatus=2

    set statusline=
    set statusline+=\ %F                                        "полный путь к файлу
    set statusline+=%m\                                         "модификатор
    set statusline+=%=                                          "разделитель между левой и правой частью
    set statusline+=\ %y                                        "тип файла
    set statusline+=\ %{&fileencoding?&fileencoding:&encoding}  "кодировка
    set statusline+=\ [%{&fileformat}\]                         "формат end-of-line
    set statusline +=%=%5l                                      "номер текущей строки
    set statusline +=/%L\                                       "всего строк

"------------------
" Файловый менеджер
"------------------

    let g:netrw_banner = 0       "Скрыть баннер
    "let g:netrw_liststyle = 1    "Listing style

"----------------
" Горячие клавиши
"----------------

    "Переход по окнам ctrl + hjkl
    map <C-k> <C-w><Up>
    map <C-j> <C-w><Down>
    map <C-l> <C-w><Right>
    map <C-h> <C-w><Left>
    
    "Удалить всё
    nnoremap <leader>d :%d<CR>
    "Syntax
    nnoremap <leader>h :set syntax=html<CR>
    nnoremap <leader>p :set syntax=php<CR>
    nnoremap <leader>s :set syntax=css<CR>
    "Session
    "nnoremap <f2> :mks! session.vim<CR>
    "nnoremap <f3> :source session.vim<CR>
    
"----------------
" РАСКЛАДКА
"----------------

    set keymap=russian-jcukenwin
    set iminsert=0 "по умолчанию английский в режиме вставки
    set imsearch=0 "по умолчанию английский в поиске

"------
" Ctags
"------

  "set tags +=../../../tags
  set tags +=../tags
  nnoremap <f5> :!ctags -R --exclude=node_modules
