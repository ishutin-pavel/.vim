"Копируем всё
%yank
"Создаём буфер с нашим именем
execute "vsplit style.css"
"Вставка
put
"Удалить все строки без class
v/class/d
%s/"/\r/g
g/[<>]/d
g/class/d
g/href/d
g/tel/d
g/\#/d
sort u
%normal I.
%normal A {}
"Сохраняем файл
write
