Данное приложение позволяет генерировать короткие ссылки и получать статистику переходов.

## Требования
* Docker
* Docker-Compose

## Запуск
Клонируйте репозиторий, передите в корневой раздел приложения (в котором лежит файл docker-compose.yml) и запустите следующую команду

```
docker-compose up -d
```
После этого необходимо дождаться создания образов и запуска контейнеров. Первый запуск может занять длительное время, в зависимости от скорости интернета.
Если произошла ошбка, повторите ввод команды.

## Получение токена

```
curl -X POST \
  'http://localhost:3000/auth/?login=test&password=123'
```

### ответ

```
token:{token}
```
Срок действия токена 30 минут.

## Создание короткой ссылки

* token - токен, полученный при авторизации
* short - внешний вид ссылки. Не обязателен, по умолчанию генерируется автоматически
* full - полный адрес, на который нужно сделать переадресацию
* expiration_time - время жизни ссылки (кол-дней). Не обязательно, по уполчанию ссылка работает всегда

```
curl -X POST \
  'http://localhost:3000/add-link/?token=testtoken4&short=&full=http://vk.com&expiration_time=7'
```

### ответ

```
short_link:http://localhost:3000/?r={short}
```

## Переход по короткой ссылке

```
curl -X GET \
  'http://localhost:3000/?r={short}'
```

Либо просто переход в браузере по полученной ссылке http://localhost:3000/?r={short}

## Получение списка самых популярныйх переходов

```
curl -X GET \
  http://localhost:3000/get-popular/
```
либо в браузере по ссылке http://localhost:3000/get-popular/

### ответ

html таблица со списком ссылок, отсортированных по количеству переходов

