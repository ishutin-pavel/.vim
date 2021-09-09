"Копируем всё
%yank
"Создаём буфер с нашим именем
execute "vsplit style.css"
"Вставка
put
"Удалить все строки без class
v/class/d
"Замена кавычек на перенос строки
%s/"/\r/g
"Удаляем всё не нужное
g/[<>]/d
g/class/d
g/href/d
g/tel/d
g/\#/d
"Сортируем
sort u
"Добавляем точку и кавычки
%normal I.
%normal A {}
"Сохраняем файл
write
