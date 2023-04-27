# Lab6PostgreSQL
<h2>
<h3> Задание 1  </h3>
<p>
Создайте две таблицы: people и people_log. Первая таблица должна 
содержать поля идентификатор (id), имя (first_name), фамилия 
(last_name), дата рождения (birthday), текущее состояние счёта 
(amount). Поле id – это первичный ключ. Поле amount – это 
действительное число. 
<p>
Вторая таблица должна содержать поля: 
идентификатор человека (person_id), дата операции (operation_date), 
сумма (sum). Поле person_id должно быть ограничено, как внешний 
ключ, ссылающийся на поле id таблицы people. Поле operation_date
должно позволить сохранять дату и время. Поле sum – это 
действительное число. </p>
<p> 
Заполните таблицы people и people_log
несколькими записями (не менее 5 на таблицу) </p>
<h3> Задание 2  </h3>
Напишите процедуру или функцию statement_of_acount, которая на 
основе двух параметров: даты начала периода и даты окончания 
периода, печатала бы на экран данные по каждой операции из таблицы 
people_log за указанный период (operation_date и sum). В конце должна 
печататься информация об общем числе операций и суммах 
положительных и отрицательных операций.
<h3> Задание 3  </h3>
Напишите процедуру или функцию account_operation, которая на 
основе двух параметров: идентификатора человека и суммы вносит 
изменения в таблицы people и people_log. В таблице people у человека с 
указанным в качестве параметра идентификатором состояние счёта 
должно измениться на указанную в качестве параметра сумму. В 
таблицу people_log должна быть добавлена запись с указанным в 
качестве параметра идентификатором человека, текущей датой и 
временем и указанной в качестве параметра суммой

