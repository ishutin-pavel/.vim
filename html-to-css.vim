"Копируем всё
%yank
"Создаём буфер с нашим именем
execute "vsplit style.css"
"Вставка
put
"переносим class в отдельную строку
%s/class="\([ a-zA-Z_-]*\)"/\rclass="\1"\r/g
"Удалить все строки без class
v/class/d
"оставляем только содержимое классов
%s/class="\([ a-zA-Z_-]*\)"/\1/g
"переносим классы из одной строки
%s/\s/\r/g
"Сортируем
sort u
"Добавляем точку и кавычки
%normal I.
%normal A {}
"Сохраняем файл
write
