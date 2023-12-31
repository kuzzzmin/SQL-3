CREATE DATABASE IF NOT EXISTS dz_3;
-- 2. Подключаемся к БД
USE dz_3;

DROP TABLE IF EXISTS staff; -- Удаляем таблицу, если она существует
CREATE TABLE staff
(
id INT PRIMARY KEY AUTO_INCREMENT, 
first_name VARCHAR(45),
last_name VARCHAR(45),
post VARCHAR(45),
seniority INT, 
salary DECIMAL (8,2),
age INT
);

INSERT staff (first_name, last_name, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', 40, 100000, 60),
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

SELECT * FROM staff;

SELECT * FROM staff 
ORDER BY salary; -- по возрастанию

SELECT * FROM staff
ORDER BY salary DESC; -- по убыванию 

SELECT * FROM staff
ORDER BY salary DESC
LIMIT 5; -- Выведите 5 максимальных заработных плат 

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst).
SELECT post, 
SUM(salary) FROM staff
GROUP BY post;

-- Найдите количество специальностей.
SELECT 
post, 
COUNT(post) AS `Кол-во специальностей`
FROM staff
GROUP BY post;

-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT 
post, 
COUNT(last_name) AS `Количество сот-ов` 
FROM staff
WHERE (age BETWEEN 25 AND 49) AND post = 'Рабочий';

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет.
SELECT
post, 
AVG(age) FROM staff
GROUP BY post
HAVING AVG(age) < 30;