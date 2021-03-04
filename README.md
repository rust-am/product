# Магазин в консоли 
Консольное приложение эмулирующее магазин 
## Описание
При запуске программы выводится пронумерованный список товаров с описанием, а также  цена и имеющееся количество.

Пользователь выбирает по номеру желаемый товар и ниже отдельным списком выводится выбранные товары.

После того, как пользователь выбрал нужное количество товара, следует нажать 0 это фактически выход из программы.

При выходе из программы выводится список выбранных товаров, их количество и общая сумма за все позиции товаров.

Программа разработана на языке Ruby (версия 2.7.1)

## Настройки программы
Список формируется из файлов формата `name.txt`, где каждый файл это определенный товар с атрибутами.
Файлы для заполнения списка товаров должны размещаться в `/data/.`.

Примеры заполнения файлов txt: 
1. Книги
> Находится по адресу `data/books/name.txt`

`data/books/01.txt`
1. Название
2. Жанр книги
3. Автор
4. Цена
5. Количество

```
Идиот
роман
Федор Достоевский
1500
10
```
2. Диски
> Находится по адресу `data/albums/name.txt`

`data/albums/01.txt`
1. Название альбома
2. Название группы
3. Жанр
4. Цена
5. Количество
```
«Got Your Six»
Five Finger Death Punch
Heavy Metal
2015
790
7
```
3. Фильмы
> Находится по адресу `data/movies/name.txt`

`data/movies/01.txt`
1. Название фильма
2. Режиссёр
3. Год выпуска
4. Цена
5. Количество
```
Леон
Люк Бессон
1994
990
15
```

## Запуск программы
1. Необходимо скачать или клонировать репозиторий

2. Перейти в папку с файлами программы.

3. Затем запустить в терминале с помощью интерпретатора ruby файл <em>main.rb</em>
```
ruby main.rb
```
