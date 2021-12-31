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

    "CSV
    "Plugin 'chrisbra/csv.vim'

    "Подсветка синтаксиса
    Plugin 'lumiliet/vim-twig'
    Plugin 'sickill/vim-monokai'
    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'MaxMEllon/vim-jsx-pretty'

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

    "Чтобы нормально прочитать файл в кодировке cp1251 нужно включить
    "следующую настройку
    "set encoding=cp1251
    "Чтобы преобразовать в utf8 нужно выполнить
    ":set fileencoding=utf8

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
    syntax on

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

    "Ignore case when searching
    set ignorecase

    "When searching try to be smart about cases 
    set smartcase

    "Искать во всех вложенных каталогах проекта :find
    set path+=.,**,,

    "Меню выбора файла Next: <C-n> Previous: <C-p>
    set wildmenu
    set wildmode=full

"-----------------
" Другие параметры
"-----------------

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

    "Определение расширения файла для команды gf
    set suffixesadd+=.php
    set suffixesadd+=.js
    set suffixesadd+=.css
    set suffixesadd+=.scss
    set suffixesadd+=.md

    "Перед сохранением вырезаем пробелы на концах
    autocmd BufWritePre *.html normal :%s/\s\+$//g

    "Опция задаёт минимальное количество строк сверху и снизу от курсора,
    "что позволяет отображать контекст строки, в которой находится курсор
    "для использование команд H M L
    set scrolloff=0

"------------
" Status Line
"------------

    "всегда показывать строку состояния
    set laststatus=2

    set statusline=
    set statusline+=\ %F                                        "полный путь к файлу
    set statusline+=%=%5l                                       "номер текущей строки
    set statusline+=%m\                                         "модификатор
    set statusline+=%=                                          "разделитель между левой и правой частью
    set statusline+=\ %y                                        "тип файла
    set statusline+=\ %{&fileencoding?&fileencoding:&encoding}  "кодировка
    set statusline+=\ [%{&fileformat}\]                         "формат end-of-line
    set statusline+=%=%5l                                       "номер текущей строки
    set statusline+=/%L\                                        "всего строк

"------------------
" Файловый менеджер
"------------------

    let g:netrw_banner = 0       "Скрыть баннер

"----------------
" Горячие клавиши
"----------------

    "F11 - Backup Database
    function Dodump()
      " let l:db_host = "localhost"
      " let l:db_name = "wordpress"
      " let l:db_user = "root"
      " let l:db_pass = ""
      let l:dump_name = "backup_" . strftime("%Y%m%d_%H%M") . ".sql"
      
      let l:lines = readfile('wp-config.php')
      for l:line in l:lines
        if (l:line =~ "define( 'DB_NAME', '")
          let ipa = l:line
          let ips = substitute(ipa, "define( 'DB_NAME', '", "", "g")
          let ipe = substitute(ips, "' );", "", "g")
          let l:db_name = ipe
        endif
        if (l:line =~ "define( 'DB_USER', '")
          let ipa = l:line
          let ips = substitute(ipa, "define( 'DB_USER', '", "", "g")
          let ipe = substitute(ips, "' );", "", "g")
          let l:db_user = ipe
        endif
        if (l:line =~ "define( 'DB_PASSWORD', '")
          let ipa = l:line
          let ips = substitute(ipa, "define( 'DB_PASSWORD', '", "", "g")
          let ipe = substitute(ips, "' );", "", "g")
          let l:db_pass = ipe
        endif
        if (l:line =~ "define( 'DB_HOST', '")
          let ipa = l:line
          let ips = substitute(ipa, "define( 'DB_HOST', '", "", "g")
          let ipe = substitute(ips, "' );", "", "g")
          let l:db_host = ipe
        endif
      endfor

      if l:db_pass == ""
        let l:cmd = "!mysqldump -h ". l:db_host ." -u ".l:db_user." " . l:db_name . " > ./" . l:dump_name
      else
        let l:cmd = "!mysqldump -h " .l:db_host ." -u ".l:db_user." -p".l:db_pass ." " .  l:db_name . " > ./" . l:dump_name
      endif
      execute echo l:db_name
      execute l:cmd
    endfunction
    nnoremap <F11> :call Dodump()<CR>

    "F12 - Backup Files
    function Dobackup()
      let l:backup_name = "backup_" . strftime("%Y%m%d_%H%M") . ".tar.gz"
      let l:cmd = "!tar --exclude='documentation' --exclude='*.zip' --exclude='*.psd' --exclude='tags' --exclude='node_modules' --exclude='.git' --exclude='*.tar.gz' -cvzf ". l:backup_name ." ."
      execute l:cmd
    endfunction
    nnoremap <F12> :call Dobackup()<CR>

    "Переход по окнам ctrl + hjkl
    map <C-k> <C-w><Up>
    map <C-j> <C-w><Down>
    map <C-l> <C-w><Right>
    map <C-h> <C-w><Left>
    
    "Сохранить всё
    "\w
    nmap <leader>w :wall<cr>

    "Выровнять
    nmap <leader>r :normal =ap<cr>
    nmap <leader>t :normal =at<cr>

    "Удалить всё
    "\d
    nnoremap <leader>d :%d<CR>

    "Класс
    nnoremap <leader>c :normal I.<esc>A {<cr>}<esc>

    "Сохранить и удалить буфер
    "\x
    nnoremap <leader>x :w<cr>:bd<cr>


    "Изменить подсветку синтаксиса
    "\h - html
    "\p - php
    "\t - twig
    "\s - css
    nnoremap <leader>h :set syntax=html<CR>
    nnoremap <leader>p :set syntax=php<CR>
    nnoremap <leader>t :set filetype=twig<CR>
    nnoremap <leader>s :set syntax=css<CR>

    "путь к каталогу текущего файла
    ":e %%
    cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

    "Открыть строку=ссылку под курсором
    nnoremap <leader>l yiW:!start <C-r>0<CR>

    "Открыть файл в браузере
    nnoremap <leader>o :!start <C-r>%<CR>

    "\n - создать и сохранить имя заметки в регистре n
    nnoremap <leader>n :source template.vim<CR>

    "\S - HTML to CSS
    nnoremap <leader>S :source ~/.vim/html-to-css.vim<CR>
      
"-------------
" Аббревиатуры
"-------------

    iab _me ishutin-pavel@mail.ru
    iab _c <div class="container"></div><!-- .container -->
    iab _r <div class="row"></div><!-- .row -->
    iab _col <div class="col-sm-6"></div><!-- .col -->

"----------------
" РАСКЛАДКА
"----------------

    set keymap=russian-jcukenwin
    set iminsert=0 "по умолчанию английский в режиме вставки
    set imsearch=0 "по умолчанию английский в поиске

"------
" Ctags
"------

  "set tags +=../tags
  nnoremap <F3> :!ctags -R --exclude=node_modules -F **/*.php
  nnoremap <F4> :!ctags -R<CR>

"-----------------
" vim-commentary
"-----------------
    " autocmd FileType php setlocal commentstring=<?php\ /*\ %s\ */\ ?>
    autocmd FileType php setlocal commentstring=/*\ %s\ */
    autocmd FileType twig setlocal commentstring={#\ %s\ #}
    autocmd FileType smarty setlocal commentstring=<!--\ %s\ -->

"-----------------
" Подсветка
"-----------------

  "MarkDown
  hi markdownH1 ctermfg=197 ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
  hi markdownH2 ctermfg=117 ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
  hi markdownH3 ctermfg=117 ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
  hi markdownH4 ctermfg=117 ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
  hi markdownH5 ctermfg=117 ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
  hi markdownH6 ctermfg=117 ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
  hi markdownHeadingDelimiter ctermfg=197 ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
  hi markdownUrlDelimiter ctermfg=117 ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
  "Ссылки в markdown
  " hi markdownIpLnk ctermfg=250 ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
  " match markdownIpLnk "\[\[\zs[0-9]\{12,14\}\ze\]\]"

  "Подсветка колонки
  highlight zettelIndex ctermfg=235 ctermbg=231 cterm=NONE guifg=#272822 guibg=#f8f8f0 gui=NONE
  " match zettelIndex /\%<41v.\%>40v/
  nnoremap <F6> :match zettelIndex /\%<41v.\%>40v/<CR>
  nnoremap <leader><F6> :match zettelIndex //<CR>
  "Yandex Direct Title
  nnoremap <leader>ydt :match zettelIndex /\%<56v.\%>55v/<CR>
  "Yandex Direct Subtitle
  nnoremap <leader>yds :match zettelIndex /\%<30v.\%>29v/<CR>
  "Yandex Direct Description
  nnoremap <leader>ydd :match zettelIndex /\%<81v.\%>80v/<CR>



  "Поиск выделения
  xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
  xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

  function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
  endfunction
