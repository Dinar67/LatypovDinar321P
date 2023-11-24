CREATE DATABASE Practic321P_Lat_and_Hab
USE [Practic321P_Lat_and_Hab]




															--Лабораторная работа №2--


--Создали таблицу Академики
CREATE TABLE Academics
	(
		FIO_Academics NVARCHAR(150) CONSTRAINT PK_FIO_Academics PRIMARY KEY,
		DateBorn_Academics DATE,
		Specialization_Academics NVARCHAR(50),
		YearAssigment_Academics INT
	)

INSERT dbo.Academics
VALUES
	('Аничков Николай Николаевич', '1885-11-03', 'медицина', 1939),
    ('Бартольд Василий Владимирович', '1869-11-15', 'историк', 1913),
    ('Белопольский Аристарх Аполлонович', '1854-07-13', 'астрофизик', 1903),
    ('Бородин Иван Парфеньевич', '1847-01-30', 'ботаник', 1902),
    ('Вальден Павел Иванович', '1863-07-26', 'химик-технолог', 1910),
    ('Вернадский Владимир Иванович', '1863-03-12', 'геохимик', 1908),
    ('Виноградов Павел Гаврилович', '1854-11-30', 'историк', 1914),
    ('Ипатьев Владимир Николаевич', '1867-11-21', 'химик', 1916),
	('Истрин Василий Михайлович', '1865-02-22', 'филолог', 1907),
    ('Карпинский Александр Петрович', '1847-01-07', 'геолог', 1889),
    ('Коковцов Павел Константинович', '1861-07-01', 'историк', 1906),
    ('Курнаков Николай Семёнович', '1860-12-06', 'химик', 1913),
    ('Марр Николай Яковлевич', '1865-01-06', 'лингвист', 1912),
    ('Насонов Николай Викторович', '1855-02-26', 'зоолог', 1906),
    ('Ольденбург Сергей Фёдорович', '1863-09-26', 'историк', 1903),
    ('Павлов Иван Петрович', '1849-09-26', 'физиолог', 1907),
    ('Перетц Владимир Николаевич', '1870-01-31', 'филолог', 1914),
    ('Соболевский Алексей Иванович', '1857-01-07', 'лингвист', 1900),
    ('Стеклов Владимир Андреевич', '1864-01-09', 'математик', 1912);

																				--Запросы

--1.	Вывести ФИО, специализацию и дату рождения всех академиков.
SELECT A.FIO_Academics, A.Specialization_Academics, A.DateBorn_Academics FROM dbo.Academics A

--2.	Создать вычисляемое поле «О присвоении звания», которое содержит информацию об академиках в виде: «Петров Петр Петрович получил звание в 1974».
SELECT A.FIO_Academics + ' получил звание в ' + CAST(A.YearAssigment_Academics AS NVARCHAR(15)) AS 'О присвоении звания' FROM dbo.Academics A

--3.	Вывести ФИО академиков и вычисляемое поле «Через 5 лет после присвоения звания».
SELECT A.FIO_Academics, ' получил звание в ' + CAST((A.YearAssigment_Academics + 5) AS NVARCHAR(15)) AS 'Через 5 лет после присвоения звания'  FROM dbo.Academics A

--4.Вывести список годов присвоения званий, убрав дубликаты.
SELECT DISTINCT A.YearAssigment_Academics FROM dbo.Academics A

--5.	Вывести список академиков, отсортированный по убыванию даты рождения.
SELECT * FROM dbo.Academics A
ORDER BY A.DateBorn_Academics DESC

--6.	Вывести список академиков, отсортированный в обратном алфавитном порядке специализаций, по убыванию года присвоения звания, и в алфавитном порядке ФИО.
SELECT * FROM dbo.Academics A
ORDER BY A.Specialization_Academics DESC

SELECT * FROM dbo.Academics A
ORDER BY  A.YearAssigment_Academics DESC

SELECT * FROM dbo.Academics A
ORDER BY  A.FIO_Academics ASC

--7.	Вывести первую строку из списка академиков, отсортированного в обратном ал-фавитном порядке ФИО.
SELECT TOP 1 * FROM dbo.Academics A
ORDER BY A.FIO_Academics DESC

--8.	Вывести фамилию академика, который раньше всех получил звание.
SELECT TOP 1  A.FIO_Academics FROM dbo.Academics A
ORDER BY A.YearAssigment_Academics

--9.	Вывести первые 10% строк из списка академиков, отсортированного в алфавитном порядке ФИО.
SELECT TOP 10 PERCENT * FROM dbo.Academics A
ORDER BY A.FIO_Academics

--10.	Вывести из таблицы «Академики», отсортированной по возрастанию года присво-ения звания, список академиков, у которых год присвоения звания – один из первых пяти в отсортированной таблице.
SELECT TOP 5 WITH TIES A.FIO_Academics FROM dbo.Academics A
ORDER BY A.YearAssigment_Academics

--11.	Вывести, начиная с десятого, список академиков, отсортированный по возраста-нию даты рождения.
SELECT * FROM dbo.Academics A
ORDER BY A.DateBorn_Academics OFFSET 10 ROWS

--12.	Вывести девятую и десятую строку из списка академиков, отсортированного в ал-фавитном порядке ФИО.
SELECT * FROM dbo.Academics A
ORDER BY A.FIO_Academics OFFSET 8 ROWS FETCH NEXT 2 ROWS ONLY






													--Лабораторная работа №3--



CREATE TABLE Country
	(
		Name_Country NVARCHAR(50) CONSTRAINT PK_Name_Country PRIMARY KEY,
		Capital NVARCHAR(30),
		Area_Country INT,
		Population_Country INT,
		Continent NVARCHAR(50)
	)

INSERT Country
VALUES
	('Австрия', 'Вена', 83858, 8741753, 'Европа'),
    ('Азербайджан', 'Баку', 86600, 9705600, 'Азия'),
    ('Албания', 'Тирана', 28748, 2866026, 'Европа'),
    ('Алжир', 'Алжир', 2381740, 39813722, 'Африка'),
    ('Ангола', 'Луанда', 1246700, 25831000, 'Африка'),
    ('Аргентина', 'Буэнос-Айрес', 2766890, 43847000, 'Южная Америка'),
    ('Афганистан', 'Кабул', 647500, 29822848, 'Азия'),
    ('Бангладеш', 'Дакка', 144000, 160221000, 'Азия'),
    ('Бахрейн', 'Манама', 701, 1397000, 'Азия'),
    ('Белиз', 'Бельмопан', 22966, 377968, 'Северная Америка'),
    ('Белоруссия', 'Минск', 207595, 9498400, 'Европа'),
    ('Бельгия', 'Брюссель', 30528, 11250585, 'Европа'),
    ('Бенин', 'Порто-Ново', 112620, 11167000, 'Африка'),
    ('Болгария', 'София', 110910, 7153784, 'Европа'),
    ('Боливия', 'Сукре', 1098580, 10985059, 'Южная Америка'),
    ('Ботсвана', 'Габороне', 600370, 2209208, 'Африка'),
	('Бразилия', 'Бразилиа', 8511965, 206081432, 'Южная Америка'),
    ('Буркина-Фасо', 'Уагадугу', 274200, 19034397, 'Африка'),
    ('Бутан', 'Тхимпху', 47000, 784000, 'Азия'),
    ('Великобритания', 'Лондон', 244820, 65341183, 'Европа'),
    ('Венгрия', 'Будапешт', 93030, 9830485, 'Европа'),
    ('Венесуэла', 'Каракас', 912050, 31028637, 'Южная Америка'),
    ('Восточный Тимор', 'Дили', 14874, 1167242, 'Азия'),
    ('Вьетнам', 'Ханой', 329560, 91713300, 'Азия')

																				--Запросы




--1.	Вывести названия и столицы пяти наибольших стран по площади.
SELECT TOP 5 C.Name_Country, C.Capital FROM dbo.Country C
ORDER BY C.Area_Country DESC

--2.	Вывести список африканских стран, население которых не превышает 1 млн. чел.
SELECT * FROM dbo.Country C
WHERE C.Population_Country <= 1000000 AND C.Continent = 'Африка'

--3.	Вывести список стран, население которых больше 5 млн. чел., а площадь меньше 100	тыс. кв. км, и они расположены не в Европе.
SELECT * FROM dbo.Country C
WHERE C.Population_Country > 5000000 AND C.Area_Country < 100000 AND C.Continent != 'Европа'

--4.	Вывести список стран Северной и Южной Америки, население которых больше 20	млн. чел., или стран Африки, у которых население больше 30 млн. чел.
SELECT * FROM dbo.Country C
WHERE (C.Name_Country = 'Южная Америка' OR C.Name_Country = 'Северная Америка' AND
C.Population_Country > 20000000) OR C.Continent = 'Африка' AND C.Population_Country > 30000000

--5.	Вывести список стран, население которых составляет от 10 до 100 млн. чел., а пло-щадь не больше 500 тыс. кв. км.
SELECT * FROM dbo.Country C
WHERE C.Population_Country BETWEEN 10000000 AND 100000000 AND C.Area_Country <= 500000

--6.	Вывести список стран, названия которых не начинаются с буквы «К».
SELECT * FROM dbo.Country C
WHERE C.Name_Country NOT LIKE'К%'

--7.	Вывести список стран, в названии которых третья буква – «а», а предпоследняя – «и».
SELECT * FROM dbo.Country C
WHERE C.Name_Country LIKE '__а%и_'

--8.	Вывести список стран, в названии которых вторая буква – гласная.
SELECT * FROM dbo.Country C
WHERE C.Name_Country LIKE '_[аеёиоуыэюя]%'

--9.	Вывести список стран, названия которых начинаются с букв от «К» до «П».
SELECT * FROM dbo.Country C
WHERE C.Name_Country LIKE '[К-П]%'

--10.	Вывести список стран, названия которых начинаются с букв от «А» до «Г», но не с буквы «Б».
SELECT * FROM dbo.Country C
WHERE C.Name_Country LIKE '[А-Г]%' AND C.Name_Country NOT LIKE 'Б%'

--11.	Вывести список стран, столицы которых есть в базе.
SELECT * FROM dbo.Country C
WHERE C.Capital IS NOT NULL

--12.	Вывести список стран Африки, Северной и Южной Америки.
SELECT * FROM dbo.Country C
WHERE C.Continent IN ('Африка','Северная Америка','Южная Америка')





													--Лабораторная работа №4--

--1.	Вывести список академиков, отсортированный по количеству символов в ФИО.
SELECT * FROM dbo.Academics A
ORDER BY LEN(A.FIO_Academics)

--2.	Вывести список академиков, убрать лишние пробелы в ФИО.
SELECT TRIM(A.FIO_Academics) AS 'ФИО' FROM dbo.Academics A

--3.	Найти позиции «ов» в ФИО каждого академика. Вывести ФИО и номер позиции.
SELECT A.FIO_Academics, CHARINDEX('ов',A.FIO_Academics) AS 'позиция' FROM dbo.Academics A

--4.	Вывести ФИО и последние две буквы специализации для каждого академика.
SELECT A.FIO_Academics, RIGHT(A.Specialization_Academics,2) FROM dbo.Academics A

--5.	Вывести список академиков, ФИО в формате Фамилия и Инициалы.
SELECT A.FIO_Academics, SUBSTRING(A.FIO_Academics, 1, CHARINDEX(' ', A.FIO_Academics) - 1) + SUBSTRING(A.FIO_Academics, CHARINDEX(' ', A.FIO_Academics), 2) + '.' + SUBSTRING(A.FIO_Academics, CHARINDEX(' ', A.FIO_Academics,CHARINDEX(' ',A.FIO_Academics) + 1), 2) + '.' as 'Инициалы' FROM dbo.Academics A

--6.	Вывести список специализаций в правильном и обратном виде. Убрать дубликаты.
SELECT DISTINCT A.Specialization_Academics, REVERSE(A.Specialization_Academics) AS 'REVERSE' FROM dbo.Academics A

--7.	Вывести свою фамилию в одной строке столько раз, сколько вам лет.
SELECT REPLICATE('Хабибуллин   ',18) AS 'ITS ALWEYS BEEN ME'

--8.	Вывести абсолютное значение функций2 (2) −   (3  2) с точностью два знака после десятичной запятой.
PRINT('ФУНКЦИЯ НЕ НАЙДЕНА ! ! !')

--9.	Вывести количество дней до конца семестра.
SELECT DATEDIFF(DAY,GETDATE(),'2023-12-29') AS 'ДНЕЙ'

--10.	Вывести количество месяцев от вашего рождения.
SELECT DATEDIFF(MONTH, '17-06-2005', GETDATE()) AS 'КОЛ-ВО'

--11.	Вывести ФИО и високосность года рождения каждого академика.
SELECT A.FIO_Academics, IIF(YEAR(A.DateBorn_Academics)%4=0,'Високосный','НЕвисокосный') AS 'Год' FROM dbo.Academics A

--12.	Вывести список специализаций без повторений. Для каждой специализации выве-сти «длинный» или «короткий», в зависимости от количества символов.
SELECT DISTINCT A.Specialization_Academics, IIF(LEN(A.Specialization_Academics) > 7,'Длинный','Короткий') FROM dbo.Academics A







													--Лабораторная работа №5--



--1.	Вывести минимальную площадь стран.
SELECT MIN(C.Area_Country) AS 'MIN AREA' FROM dbo.Country C

--2.	Вывести наибольшую по населению страну в Северной и Южной Америке.
SELECT MAX(C.Population_Country) AS 'MAX POPULATION' FROM dbo.Country C
WHERE C.Continent IN ('Северная Америка','Южная Америка')
--3.	Вывести среднее население стран. Результат округлить до одного знака.
SELECT ROUND(AVG(Cast(C.Population_Country as FLOAT(5))),1) FROM dbo.Country C

--4.	Вывести количество стран, у которых название заканчивается на «ан», кроме стран, у которых название заканчивается на «стан».
SELECT COUNT(*) AS 'ALL' FROM dbo.Country C
WHERE C.Name_Country LIKE '%ан' AND C.Name_Country NOT LIKE '%стан'

--5.	Вывести количество континентов, где есть страны, название которых начинается с буквы «Р».
SELECT COUNT(C.Continent) as 'COUNT CONTINENT' FROM dbo.Country C
WHERE C.Name_Country LIKE 'Р%'

--6. [Во] Сколько раз страна с наибольшей площадью больше, чем страна с наименьшей площадью?
SELECT MAX(C.Area_Country)/MIN(C.Area_Country) as 'ВОТ ВО СКОЛЬКО =)' FROM dbo.Country C

--7.	Вывести количество стран с населением больше, чем 100 млн. чел. на каждом кон-тиненте. Результат отсортировать по количеству стран по возрастанию.
SELECT C.Continent, COUNT(C.Name_Country) AS 'COUNT_City' FROM dbo.Country C
WHERE C.Population_Country > 100000000
GROUP BY C.Continent
ORDER BY C.Continent, COUNT_City

--8.	Вывести количество стран по количеству букв в названии. Результат отсортировать по убыванию.
SELECT COUNT(C.Name_Country) AS 'COUNT_Country', LEN(C.Name_Country) AS 'LEN_Country' FROM dbo.Country C
GROUP BY LEN(C.Name_Country)
ORDER BY LEN_Country DESC

--9.	Ожидается, что через 20 лет население мира вырастет на 10%. Вывести список континентов с прогнозируемым населением:
SELECT C.Continent, SUM((C.Population_Country * 1.1)) AS 'PROGNOZIS' FROM dbo.Country C
GROUP BY C.Continent

--10.	Вывести список континентов, где разница по площади между наибольшими и наименьшими странами не более в 1000 раз:
SELECT C.Continent FROM dbo.Country C
WHERE (MAX(C.Area_Country) - MIN(C.Area_Country)) <= 1000 * MIN(C.Area_Country)

--11.	Вывести среднюю длину названий Африканских стран.
SELECT AVG(LEN(C.Name_Country)) FROM dbo.Country C
WHERE C.Continent = 'Африка'

--12.	Вывести список континентов, у которых средняя плотность среди стран с населе-нием более 1 млн. чел. больше, чем 30 чел. на кв. км.
SELECT C.Continent FROM dbo.Country C
WHERE (C.Area_Country / C.Population_Country) > 30 AND C.Population_Country > 1000000




 													--Лабораторная работа №6--

CREATE TABLE Faculty
	(
		Abbreviation_Faculty NVARCHAR(15) CONSTRAINT PK_Abb_Faculty PRIMARY KEY,
		Name_Faculty NVARCHAR(50)
	)

INSERT Faculty
VALUES 
    ('Ен', 'Естественные науки'),
    ('Гн', 'Гуманитарные науки'),
    ('Ит', 'Информационные технологии'),
    ('Фм', 'Физико-математический')



CREATE TABLE Cathedra
	(
		Code_Cathedra NVARCHAR(15) CONSTRAINT PK_Code_Cathedra PRIMARY KEY,
		Name_Cathedra NVARCHAR(50),
		Abb_Faculty NVARCHAR(15) CONSTRAINT FK_Abb_Faculty_Cathedra_Faculty FOREIGN KEY REFERENCES Faculty(Abbreviation_Faculty)
	)

INSERT Cathedra
VALUES
    ('Вм', 'Высшая математика', 'ен'),
    ('Ис', 'Информационные системы', 'ит'),
    ('Мм', 'Математическое моделирование', 'фм'),
    ('Оф', 'Общая физика', 'ен'),
    ('Пи', 'Прикладная информатика', 'ит'),
    ('Эф', 'Экспериментальная физика', 'фм')



CREATE TABLE Employee
	(
		Tab_Number INT CONSTRAINT PK_Tab_Number PRIMARY KEY,
		Code NVARCHAR(15) CONSTRAINT FK_Code_Employee_Cathedra FOREIGN KEY REFERENCES Cathedra(Code_Cathedra),
		Surname NVARCHAR(50),
		Statys NVARCHAR(50),
		Oklad DECIMAL(7,2),
		Shef INT
	)

INSERT Employee
VALUES
	(101, 'пи', 'Прохоров П.П.', 'зав. кафедрой', 35000.00, 101),
    (102, 'пи', 'Семенов С.С.', 'преподаватель', 25000.00, 101),
    (105, 'пи', 'Петров П.П.', 'преподаватель', 25000.00, 101),
    (153, 'пи', 'Сидорова С.С.', 'инженер', 15000.00, 102),
    (201, 'ис', 'Андреев А.А.', 'зав. кафедрой', 35000.00, 201),
    (202, 'ис', 'Борисов Б.Б.', 'преподаватель', 25000.00, 201),
    (241, 'ис', 'Глухов Г.Г.', 'инженер', 20000.00, 201),
    (242, 'ис', 'Чернов Ч.Ч.', 'инженер', 15000.00, 202),
    (301, 'мм', 'Басов Б.Б.', 'зав. кафедрой', 35000.00, 301),
    (302, 'мм', 'Сергеева С.С.', 'преподаватель', 25000.00, 301),
    (401, 'оф', 'Волков В.В.', 'зав. кафедрой', 35000.00, 401),
    (402, 'оф', 'Зайцев З.З.', 'преподаватель', 25000.00, 401),
    (403, 'оф', 'Смирнов С.С.', 'преподаватель', 15000.00, 401),
    (435, 'оф', 'Лисин Л.Л.', 'инженер', 20000.00, 402),
    (501, 'вм', 'Кузнецов К.К.', 'зав. кафедрой', 35000.00, 501),
    (502, 'вм', 'Романцев Р.Р.', 'преподаватель', 25000.00, 501),
    (503, 'вм', 'Соловьев С.С.', 'преподаватель', 25000.00, 501),
    (601, 'эф', 'Зверев З.З.', 'зав. кафедрой', 35000.00, 601),
    (602, 'эф', 'Сорокина С.С.', 'преподаватель', 25000.00, 601),
    (614, 'эф', 'Григорьев Г.Г.', 'инженер', 20000.00, 602)




CREATE TABLE Speciality
	(
		Number_Speciality NVARCHAR(12) CONSTRAINT PK_Number_Speciality PRIMARY KEY,
		Direction_Speciality NVARCHAR(70),
		Code NVARCHAR(15) CONSTRAINT FK_Code_Speciality_Cathedra FOREIGN KEY REFERENCES Cathedra(Code_Cathedra),
	)

INSERT Speciality
VALUES
    ('01.03.04', 'Прикладная математика', 'мм'),
    ('09.03.02', 'Информационные системы и технологии', 'ис'),
    ('09.03.03', 'Прикладная информатика', 'пи'),
    ('14.03.02', 'Ядерные физика и технологии', 'эф'),
    ('38.03.05', 'Бизнес-информатика', 'ис')




CREATE TABLE Dicipline
	(
		Code_Dicipline INT CONSTRAINT PK_Code_Disipline PRIMARY KEY,
		Space_Dicipline INT,
		Name_Dicipline NVARCHAR(30),
		Executor_Dicipline NVARCHAR(15) CONSTRAINT FK_Executor_Dicipline_Cathedra FOREIGN KEY REFERENCES Cathedra(Code_Cathedra)
	)

INSERT Dicipline
VALUES
    (101, 320, 'Математика', 'вм'),
    (102, 160, 'Информатика', 'пи'),
    (103, 160, 'Физика', 'оф'),
    (202, 120, 'Базы данных', 'ис'),
    (204, 160, 'Электроника', 'эф'),
    (205, 80, 'Программирование', 'пи'),
    (209, 80, 'Моделирование', 'мм')





CREATE TABLE Claim
	(
		Code_Claim INT CONSTRAINT FK_Code_Claim_Claim_Dicipline FOREIGN KEY REFERENCES Dicipline(Code_Dicipline),
		Number_Claim NVARCHAR(12) CONSTRAINT FK_Number_Claim_Claim_Speciality FOREIGN KEY REFERENCES Speciality(Number_Speciality)
	)

INSERT Claim
VALUES
	(101,'01.03.04'),
	(205,'01.03.04'),
	(209,'01.03.04'),
	(101,'09.03.02'),
	(102,'09.03.02'),
	(103,'09.03.02'),
	(202,'09.03.02'),
	(205,'09.03.02'),
	(209,'09.03.02'),
	(101,'09.03.03'),
	(102,'09.03.03'),
	(103,'09.03.03'),
	(202,'09.03.03'),
	(205,'09.03.03'),
	(101,'14.03.02'),
	(102,'14.03.02'),
	(103,'14.03.02'),
	(204,'14.03.02'),
	(101,'38.03.05'),
	(103,'38.03.05'),
	(202,'38.03.05'),
	(209,'38.03.05')





CREATE TABLE Zav_Kathedra
	(
		Tab_Number INT CONSTRAINT PK_Tab_Number_ZAVKAT PRIMARY KEY CONSTRAINT FK_Tab_Number_ZAVKAT FOREIGN KEY REFERENCES Employee(Tab_Number),
		Exp_Zav_Kat INT
	)


INSERT Zav_Kathedra
VALUES
	(101,15),
	(201,18),
	(301,20),
	(401,10),
	(501,18),
	(601,8);




CREATE TABLE Engineer
	(
		Tab_Number INT CONSTRAINT PK_Tab_Number_ENGINEER PRIMARY KEY CONSTRAINT FK_Tab_Number_ENGINEER FOREIGN KEY REFERENCES Employee(Tab_Number),
		Speciality NVARCHAR(30),
	)

INSERT Engineer
VALUES
	(153,'электроник'),
	(241,'электроник'),
	(242,'программист'),
	(435,'электроник'),
	(614,'программист')



CREATE TABLE Teacher
	(
		Tab_Number INT CONSTRAINT PK_Tab_Number_TEACHER PRIMARY KEY CONSTRAINT FK_Tab_Number_TEACHER Foreign KEY References Employee(Tab_Number),
		Statys_Teacher NVARCHAR(30),
		Stage NVARCHAR(10),
	)

INSERT dbo.Teacher
VALUES
	(101, 'профессор', 'д.т.н.'),
    (102, 'доцент', 'к.ф.-м.н.'),
    (105, 'доцент', 'к.т.н.'),
    (201, 'профессор', 'д.ф.-м.н.'),
    (202, 'доцент', 'к.ф.-м.н.'),
    (301, 'профессор', 'д.т.н.'),
    (302, 'доцент', 'к.т.н.'),
    (401, 'профессор', 'д.т.н.'),
    (402, 'доцент', 'к.т.н.'),
    (403, 'ассистент', null),
    (501, 'профессор', 'д.ф.-м.н.'),
    (502, 'профессор', 'д.ф.-м.н.'),
    (503, 'доцент', 'к.ф.-м.н.'),
    (601, 'профессор', 'д.ф.-м.н.')







CREATE TABLE Student
	(
		Reg_Number INT CONSTRAINT PK_Reg_Number PRIMARY KEY,
		Number NVARCHAR(12) CONSTRAINT FK_Number_Student_Speciality FOREIGN KEY REFERENCES Speciality(Number_Speciality),
		FIO_Student NVARCHAR(100)
	)

INSERT Student
VALUES
    (10101, '09.03.03', 'Николаева Н. Н.'),
    (10102, '09.03.03', 'Иванов И. И.'),
    (10103, '09.03.03', 'Крюков К. К.'),
    (20101, '09.03.02', 'Андреев А. А.'),
    (20102, '09.03.02', 'Федоров Ф. Ф.'),
    (30101, '14.03.02', 'Бондаренко Б. Б.'),
    (30102, '14.03.02', 'Цветков К. К.'),
    (30103, '14.03.02', 'Петров П. П.'),
    (50101, '01.03.04', 'Сергеев С. С.'),
    (50102, '01.03.04', 'Кудрявцев К. К.'),
    (80101, '38.03.05', 'Макаров М. М.'),
    (80102, '38.03.05', 'Яковлев Я. Я.')




CREATE TABLE Exam
	(
		Date_Exam DATE,
		Code_Disipline INT CONSTRAINT FK_Code_Dis_Exam_Discipline FOREIGN KEY REFERENCES Dicipline(Code_Dicipline),
		Reg_Number INT CONSTRAINT FK_Reg_Number_Exam_Student FOREIGN KEY REFERENCES Student(Reg_Number),
		Tab_Number_Teacher INT CONSTRAINT FK_Tab_Number_Teacher_Exam_Teacher FOREIGN KEY REFERENCES Teacher(Tab_Number),
		Auditory NVARCHAR(10),
		Grade INT
	)

INSERT Exam
VALUES
	('2015-06-05', 102, 10101, 102, 'т505', 4),
    ('2015-06-05', 102, 10102, 102, 'т505', 4),
    ('2015-06-05', 202, 20101, 202, 'т506', 4),
    ('2015-06-05', 202, 20102, 202, 'т506', 3),
    ('2015-06-07', 102, 30101, 105, 'ф419', 3),
    ('2015-06-07', 102, 30102, 101, 'т506', 4),
    ('2015-06-07', 102, 80101, 102, 'м425', 5),
    ('2015-06-09', 205, 80102, 402, 'м424', 4),
    ('2015-06-09', 209, 20101, 302, 'ф333', 3),
    ('2015-06-10', 101, 10101, 501, 'т506', 4),
    ('2015-06-10', 101, 10102, 501, 'т506', 4),
    ('2015-06-10', 204, 30102, 601, 'ф349', 5),
    ('2015-06-10', 209, 80101, 301, 'э105', 5),
    ('2015-06-10', 209, 80102, 301, 'э105', 4),
    ('2015-06-12', 101, 80101, 502, 'с324', 4),
    ('2015-06-15', 101, 30101, 503, 'ф417', 4),
    ('2015-06-15', 101, 50101, 501, 'ф201', 5),
    ('2015-06-15', 101, 50102, 501, 'ф201', 3),
    ('2015-06-15', 103, 10101, 403, 'ф414', 4),
    ('2015-06-17', 102, 10101, 102, 'т505', 5)




															--ЗАПРОСЫ--

--1.	Вывести из таблиц «Кафедра», «Специальность» и «Студент» данные о студентах, которые обучаются на данном факультете (например, «ит»).
SELECT C.Name_Cathedra, C.Abb_Faculty, S.Direction_Speciality, S.Number_Speciality, St.FIO_Student FROM dbo.Cathedra C JOIN dbo.Speciality S ON C.Code_Cathedra = S.Code JOIN dbo.Student St ON St.Number = S.Number_Speciality
WHERE C.Abb_Faculty = 'ит'

--2.	Вывести из таблиц «Кафедра», «Специальность» и «Сотрудник» данные о выпус-кающих кафедрах (факультет, шифр, название, фамилию заведующего). Выпускающей счита-ется та кафедра, на которую есть ссылки в таблице «Специальность».
SELECT C.Abb_Faculty, C.Code_Cathedra, C.Name_Cathedra, E.Surname FROM dbo.Cathedra C JOIN dbo.Speciality S ON C.Code_Cathedra = S.Code JOIN dbo.Employee E ON E.Code = S.Code

--3.	Вывести в запросе для каждого сотрудника номер и фамилию его непосредственного руководителя. Для заведующих кафедрами поле руководителя оставить пустым.
SELECT DISTINCT e.Tab_Number, e.Surname, IIF(e.Tab_Number NOT IN
(SELECT zk.Tab_Number FROM dbo.Zav_Kathedra zk), e2.Surname, NULL)
FROM dbo.Employee e JOIN dbo.Employee e2
ON e.Shef = e2.Tab_Number

--4.	Вывести список студентов, сдавших минимум два экзамена.
SELECT s.Reg_Number, s.Number, s.FIO_Student, COUNT(e.Date_Exam) AS 'Количество сданых экзаменов' FROM dbo.Student s JOIN dbo.Exam e
ON s.Reg_Number = e.Reg_Number
GROUP BY s.Reg_Number, s.Number, s.FIO_Student
HAVING COUNT(e.Date_Exam) > 1

--5.	Вывести список инженеров с зарплатой, меньшей 20000 руб.
SELECT * FROM dbo.Employee e JOIN dbo.Engineer e2
ON e.Tab_Number = e2.Tab_Number
WHERE e.Oklad < 20000

--6.	Вывести список студентов, сдавших экзамены в заданной аудитории.
SELECT s.* FROM dbo.Student s JOIN dbo.Exam e 
ON s.Reg_Number = e.Reg_Number
WHERE e.Auditory = 'т505'

--7.	Вывести из таблиц «Студент» и «Экзамен» учетные номера и фамилии студентов, 
--а также количество сданных экзаменов и средний балл для каждого студента только для тех студентов,
--у которых средний балл не меньше заданного (например, 4).
SELECT s.Reg_Number, s.FIO_Student, COUNT(e.Date_Exam) AS 'Количество сданых экзаменов', AVG(e.Grade) AS 'Средний балл' FROM dbo.Student s JOIN dbo.Exam e 
ON s.Reg_Number = e.Reg_Number
GROUP BY s.Reg_Number,  s.FIO_Student

--8.	Вывести список заведующих кафедрами и их зарплаты, и степень.
SELECT e.Tab_Number, e.Surname, e.Oklad, zk.Exp_Zav_Kat FROM dbo.Employee e JOIN dbo.Zav_Kathedra zk
ON e.Tab_Number = zk.Tab_Number

--9.	Вывести список профессоров.
SELECT * FROM Employee e JOIN dbo.Teacher t  
ON t.Tab_Number = e.Tab_Number
WHERE t.Statys_Teacher = 'профессор'

--10.	Вывести название дисциплины, фамилию, должность и степень преподавателя, 
--дату и место проведения экзаменов в хронологическом порядке в заданном интервале даты.
SELECT d.Name_Dicipline, e2.Surname, e2.Statys, zk.Exp_Zav_Kat, e.Date_Exam, e.Auditory FROM Exam e JOIN Dicipline d
ON e.Code_Disipline = d.Code_Dicipline JOIN Employee e2
ON e2.Tab_Number = e.Tab_Number_Teacher JOIN Zav_Kathedra zk
ON zk.Tab_Number = e2.Tab_Number
ORDER BY e.Date_Exam

--11.	Вывести фамилию преподавателей, принявших более трех экзаменов.
SELECT DISTINCT e1.Surname FROM Employee e1 JOIN Exam e2
ON e1.Tab_Number = e2.Tab_Number_Teacher
GROUP BY e1.Surname 
HAVING COUNT(e2.Date_Exam) > 3

--12.	Вывести список студентов, не сдавших ни одного экзамена в указанной дате.
SELECT * FROM Student s
WHERE s.FIO_Student NOT IN
(SELECT s.FIO_Student FROM Exam e JOIN Student s
ON e.Reg_Number = s.Reg_Number
WHERE e.Date_Exam = '2015-06-10')




 													--Лабораторная работа №7--


--1.	Вывести объединенный результат выполнения запросов, которые выбирают страны с площадью меньше 500 кв. км и с площадью больше 5 млн. кв. км:
SELECT * FROM dbo.Country c
WHERE c.Area_Country < 500000
UNION 
SELECT * FROM dbo.Country c
WHERE c.Area_Country > 5000000

--2.	Вывести список стран с площадью больше 1 млн. кв. км, исключить страны с насе-лением меньше 100 млн. чел.:
SELECT * FROM dbo.Country c
WHERE c.Area_Country > 1000000
EXCEPT
SELECT * FROM dbo.Country c
WHERE c.Population_Country < 100000000

--3.	Вывести список стран с площадью меньше 500 кв. км и с населением меньше 100	тыс. чел.
SELECT * FROM dbo.Country c
WHERE c.Area_Country < 500000
INTERSECT
SELECT * FROM dbo.Country c
WHERE c.Population_Country < 100000




 													--Лабораторная работа №8--


--1.	Вывести список стран и процентное соотношение площади каждой из них к общей площади всех стран мира.
SELECT *, cast(CAST((c.Area_Country / (Table1.sumArea/10000)) AS DECIMAL(10,2))/100 AS decimal(6,3)) AS 'Процентное соотношение к общей площади' FROM dbo.Country c,
(SELECT SUM(c.Area_Country) sumArea FROM dbo.Country c) AS Table1

--2.	Вывести список стран мира, плотность населения которых больше, чем средняя плотность населения всех стран мира.
SELECT * FROM dbo.Country c
WHERE (c.Population_Country / c.Area_Country) > 
(SELECT AVG(c.Population_Country / c.Area_Country) FROM dbo.Country c)

--3.	С помощью подзапроса вывести список европейских стран, население которых меньше 5 млн. чел.
SELECT * FROM dbo.Country C
WHERE c.Name_Country IN
(
	SELECT C.Name_Country FROM dbo.Country C 
	WHERE C.Continent = 'Европа'
)
AND C.Population_Country < 5000000

--4.	Вывести список стран и процентное соотношение их площади к суммарной пло-щади той части мира, где они находятся.
SELECT *, CAST( CAST(C.Area_Country / (
(SELECT SUM(c2.Area_Country) FROM dbo.Country c2 WHERE c2.Continent = C.Continent)/10000 )AS DECIMAL(10,2))/100 AS decimal(6,2)) 
AS 'Процентное соотношение к общей площади той части мира, где они находятся' FROM dbo.Country C

--5.	Вывести список стран мира, площадь которых больше, чем средняя площадь стран той части света, где они находятся.
SELECT * FROM dbo.Country c
WHERE c.Area_Country > (SELECT AVG(c2.Area_Country) FROM dbo.Country c2 WHERE c2.Continent = c.Continent)

--6.	Вывести список стран мира, которые находятся в тех частях света, средняя плот-ность населения которых превышает общемировую.
SELECT * FROM dbo.Country C
WHERE C.Continent IN
(SELECT c.Continent FROM dbo.Country c
GROUP BY c.Continent
HAVING AVG(c.Population_Country/c.Area_Country) > (SELECT AVG(c.Population_Country / c.Area_Country) FROM dbo.Country c))

--7.	Вывести список южноамериканских стран, в которых живет больше людей, чем в любой африканской стране.
SELECT * FROM dbo.Country c
WHERE c.Continent = 'Южная Америка' AND c.Population_Country > 
(SELECT MAX(c2.Population_Country) FROM dbo.Country c2 WHERE c2.Continent = 'Африка')

--8.	Вывести список африканских стран, в которых живет больше людей, чем хотя бы в одной южноамериканской стране.
SELECT * FROM dbo.Country c
WHERE c.Continent = 'Африка' AND c.Population_Country > 
(SELECT MIN(c2.Population_Country) FROM dbo.Country c2 WHERE c2.Continent = 'Южная Америка')

--9.	Если в Африке есть хотя бы одна страна, площадь которой больше 2 млн. кв. км, вывести список всех африканских стран.
SELECT * FROM dbo.Country c
WHERE c.Name_Country IN
(SELECT c.Name_Country FROM dbo.Country c
WHERE c.Continent = 'Африка' AND c.Area_Country > 2000000)

--10.	Вывести список стран той части света, где находится страна «Фиджи».
SELECT * FROM dbo.Country c
WHERE c.Continent IN
(SELECT c2.Continent FROM dbo.Country c2 WHERE c2.Name_Country = 'Фиджи')

--11.	Вывести список стран, население которых не превышает население страны «Фиджи».
SELECT * FROM dbo.Country c
WHERE c.Population_Country <
(SELECT c2.Population_Country FROM dbo.Country c2 WHERE c2.Name_Country = 'Фиджи')

--12.	Вывести название страны с наибольшим населением среди стран с наименьшей площадью на каждом континенте.
SELECT c.Name_Country FROM dbo.Country c
WHERE c.Population_Country =
(SELECT MAX(c.Population_Country) FROM dbo.Country c
WHERE c.Area_Country IN 
(SELECT MIN(c.Area_Country) FROM dbo.Country c
GROUP BY c.Continent))




 													--Лабораторная работа №9--


--1.	Создать таблицу «Управление_ВашаФамилия». Определить основной ключ, идентификатор, значение по умолчанию
CREATE TABLE Управление_Латыпов_Хабибуллин
(
ID	INT CONSTRAINT PK_ID PRIMARY KEY IDENTITY,
Вид	VARCHAR(50) CONSTRAINT DF_Вид DEFAULT 'Президентская республика'
)

--2.	Создать таблицу «Страны_ВашаФамилия». Определить основной ключ, разреше-ние / запрет на NULL, условие на вводимое значение.
CREATE TABLE Страны_Латыпов_Хабибуллин
(
ID	INT PRIMARY KEY,
Название_Страны	VARCHAR(50) CONSTRAINT CH_Название_Страны CHECK(Название_Страны LIKE '[А-К]%') NOT NULL
)

--3.	Создать таблицу «Цветы_ВашаФамилия». Определить основной ключ, значения столбца «ID» сделать уникальными, 
--для столбца «Класс» установить значение по умолчанию «Двудольные».
CREATE TABLE Цветы_Латыпов_Хабибуллин
(
Id_Цветы INT PRIMARY KEY,
ID	INT CONSTRAINT UQ_ID UNIQUE,
Класс VARCHAR(50) CONSTRAINT DF_Класс DEFAULT 'Двудольные'
)

--4.	Создать таблицу «Животные_ВашаФамилия». Определить основной ключ, значе-ния столбца «ID» сделать уникальными,
--для столбца «Отряд» установить значение по умол-чанию «Хищные».
CREATE TABLE Животные_Латыпов_Хабибуллин
(
Id_Животные INT PRIMARY KEY,
ID	INT UNIQUE,
Отряд VARCHAR(50) CONSTRAINT DF_Отряд DEFAULT 'Хищные'
)






 													--Лабораторная работа №10--


CREATE TABLE Students	
(					
	ID	INT PRIMARY KEY IDENTITY(1,1),	
	Surname	VARCHAR(50) NOT NULL,		
	SubjectSchool	VARCHAR(50) NOT NULL,		
	School	VARCHAR(50) NOT NULL,		
	Balls	FLOAT CHECK ((Balls >= 0) AND (Balls <= 100)) NULL
)					

INSERT INTO Students
VALUES ('Иванова', 'Математика', 'Лицей', 98.5),
       ('Петров', 'Физика', 'Лицей', 99),
       ('Сидоров', 'Математика', 'Лицей', 88),
       ('Полухина', 'Физика', 'Гимназия', 78),
       ('Матвеева', 'Химия', 'Лицей', 92),
       ('Касимов', 'Химия', 'Гимназия', 68),
       ('Нурулин', 'Математика', 'Гимназия', 81),
       ('Авдеев', 'Физика', 'Лицей', 87),
       ('Никитина', 'Химия', 'Лицей', 94),
       ('Барышева', 'Химия', 'Лицей', 88);
 

-- 1.	В таблицу «Ученики» внести новую запись для ученика школы № 18 Трошкова, оценка которого по химии неизвестна.
INSERT INTO Students
VALUES ('Трошков', 'Химия', 'школа № 18', NULL)

--2.	В таблицу «Ученики» внести три строки.
INSERT INTO Students
VALUES ('Латыпов', 'Математика', 'школа № 2', 99),
	   ('Хабмбуллин', 'Биология', 'школа № 10', 80.3),
	   ('Фатхуллин', 'Физкультура', 'Техникум', 100);

--3.	В таблице «Ученики» изменить данные Трошкова, школу исправить на № 21, пред-мет на математику, а оценку на 56.
UPDATE Students 
SET School = 'школа № 21', SubjectSchool = 'Математика', Balls = 56
WHERE Surname = 'Трошков'

--4.	В таблице «Ученики» изменить данные всех учеников по химии, оценку увеличить на 10%, если она ниже 60 баллов.
UPDATE Students 
SET Balls = Balls * 1.1
WHERE Balls < 60

--5.	В таблице «Ученики» удалить данные всех учеников из школы №21.
DELETE Students
WHERE School = 'школа № 21'

--6.	Создать таблицу «Гимназисты» и скопировать туда данные всех гимназистов, кроме тех, которые набрали меньше 60 баллов.
SELECT * INTO High_School_Students FROM Students
WHERE Balls >= 60

--7.	Очистить таблицу «Гимназисты».
TRUNCATE TABLE High_School_Students







 													--Лабораторная работа №11--


--1.	Даны числа A и B. Найти и вывести их произведение.
DECLARE @a INT, @b INT
SET @a = 5
SET @b = 10
SET @a = @a * @b
PRINT @a

--2.	В таблице «Ученики» найти разницу между средними баллами лицеистов и гимназистов.
DECLARE @licey FLOAT, @gimn FLOAT, @diff FLOAT SET @licey = 
(SELECT AVG(Balls) FROM Students
WHERE School = 'Лицей')
SET @gimn = 
(SELECT AVG(Balls) FROM Students
WHERE School = 'Гимназия')
SET @diff = ABS(@licey - @gimn)
PRINT @diff

--3.	В таблице «Ученики» проверить на четность количество строк.
DECLARE @Num int
SET @Num = 
(SELECT COUNT(s.ID) FROM Students s)
PRINT IIF(@Num % 2 = 0, 'ЧЕТНОЕ', 'НЕЧЕТНОЕ')

--4.	Дано четырехзначное число. Вывести сумму его цифр.
DECLARE @a INT, @b INT;
SET @a = 1234;
SET @b = 0;
WHILE @a > 0
BEGIN 
	SET @b = @b + @a % 10;
	SET @a = @a / 10;
END
PRINT @b

--5.	Даны случайные целые числа a, b и c. Найти наименьшее из них.
DECLARE @a INT = RAND() * 100, @b INT = RAND() * 100, @c INT = RAND() * 100
PRINT CAST(@a AS VARCHAR(3)) + ' ' + CAST(@b AS VARCHAR(3)) + ' ' + CAST(@c AS VARCHAR(3))
IF @a < @b AND @a < @c
	PRINT '@a = ' + CAST(@a AS VARCHAR(3))
ELSE IF @b < @a AND @b < @c
	PRINT '@b = ' + CAST(@b AS VARCHAR(3))
ELSE
	PRINT '@c = ' + CAST(@c AS VARCHAR(3))
	
--6.	Дано случайное целое число a. Проверить, делится ли данное число на 11.
DECLARE @a INT = RAND() * 100
IF @a % 11 = 0
PRINT CAST(@a AS VARCHAR(3)) + ' делится на 11'
ELSE
PRINT CAST(@a AS VARCHAR(3)) + ' не делится на 11'

--7.	Дано случайное целое число N (N < 1000). Если оно является степенью числа 3, то вывести «Да», если не является – вывести «Нет».
DECLARE @N INT = RAND() * 999
PRINT @N
WHILE @N % 3 = 0
SET @N = @N / 3
IF @N = 1
PRINT 'Да'
ELSE
PRINT 'Нет'

--8.	Даны случайные целые числа a и b. Найти наименьший общий кратный (НОК).
DECLARE @a INT = RAND() * 100, @b INT = RAND() * 100, @temp INT, @c INT;
PRINT CAST(@a AS VARCHAR(3)) + ' ' + CAST(@b AS VARCHAR(3))
SET @c= @a * @b;
WHILE @b <> 0
BEGIN
    SET @temp = @b;
    SET @b = @a % @b;
    SET @a = @temp;
END
PRINT @c / @a;

--9.	Даны два целых числа A и B (A<B). Найти сумму квадратов всех целых чисел от A до B включительно.
DECLARE @a INT = 1, @b INT = 5, @Sum INT = 0
WHILE @a <= @b
BEGIN
	SET @Sum = @Sum + (@a * @a)
	SET @a = @a + 1
END
PRINT 'Сумма квадратов = ' + CAST(@Sum AS VARCHAR(5))

--10.	Найти первое натуральное число, которое при делении на 2, 3, 4, 5, и 6 дает остаток 1, но делится на 7.
DECLARE @number INT = 1;
WHILE 1=1
BEGIN
    IF (@number % 2 = 1 AND @number % 3 = 1 AND @number % 4 = 1 AND @number % 5 = 1 AND @number % 6 = 1 AND @number % 7 = 0)
    BEGIN
        PRINT 'Первое натуральное число = ' + CAST(@number AS VARCHAR(5));
        BREAK;
    END

    SET @number = @number + 1;
END

--11.	Вывести свою фамилию на экран столько раз, сколько в нем букв.
DECLARE @surname NVARCHAR(50) = 'Латыпов';
DECLARE @length INT = LEN(@surname);
DECLARE @counter INT = 1;

WHILE @counter <= @length
BEGIN
    PRINT @surname;
    SET @counter = @counter + 1;
END;

--12.	Напишите код для вывода на экран с помощью цикла:

--Н
--иНи
--жиНиж
--нжиНижн
--енжиНижне
--венжиНижнев
--авенжиНижнева
--равенжиНижневар
--травенжиНижневарт
--отравенжиНижневарто
--вотравенжиНижневартов
--свотравенжиНижневартовс
--ксвотравенжиНижневартовск

DECLARE @text NVARCHAR(50) = 'Нижневартовск';
DECLARE @length INT = LEN(@text), @counter INT = 1, @length2 INT = LEN(@text);
WHILE @counter <= @length
BEGIN
	IF @counter = 1
		PRINT REPLICATE(' ', @length2) + SUBSTRING(@text, 1, @counter);
	ELSE
		PRINT REPLICATE(' ', @length2) + REVERSE(SUBSTRING(@text, 2, (@counter - 1))) + SUBSTRING(@text, 1, @counter);
    SET @counter = @counter + 1;
	SET @length2 = @length2 - 1;
END;




 
												--Лабораторная работа №12--




--1.	Напишите функцию для вывода названия страны с заданной столицей, и вызовите ее.
CREATE FUNCTION Country_and_Capital
(
	@Capital AS NVARCHAR(50)
)
RETURNS NVARCHAR(50)
AS
BEGIN
	DECLARE @Country AS  NVARCHAR(50) 
	SELECT @Country = C.Capital FROM dbo.Country C
	WHERE C.Name_Country = @Capital
	RETURN @Country	
END

SELECT dbo.Country_and_Capital('Австрия') AS 'STALITSA'

--2.	Напишите функцию для перевода населения в млн. чел. и вызовите ее.
CREATE FUNCTION Population_Million
(
	@Population INT
)
RETURNS INT
AS
BEGIN
	DECLARE @P AS INT
	SET @P = Round(@Population, -6)/1000000
	RETURN @P
END

SELECT C.*, dbo.Population_Million(C.Population_Country) AS 'MILLIONS' FROM dbo.Country C

--3.	Напишите функцию для вычисления плотности населения заданной части света и вызовите ее.
CREATE FUNCTION Population_Area
(
	@Name_Continent NVARCHAR(50)
)
RETURNS DECIMAL(7,2)
AS
BEGIN
	DECLARE @PA AS Decimal(7,3)
	SET @PA = 
	(
		SELECT (SUM(C.Population_Country) / SUM(C.Area_Country)) as Plotnost FROM Country C 
		WHERE C.Continent = @Name_Continent
		GROUP BY C.Continent
		

	)
RETURN @PA
END

PRINT dbo.Population_Area('Европа')

--4.	Напишите функцию для поиска страны, третьей по населению и вызовите ее.
CREATE FUNCTION CountrySearcher() 
RETURNS NVARCHAR(50)
AS
BEGIN
	DECLARE @Country AS NVARCHAR(50),
			@C1 AS FLOAT,
			@C2 AS FLOAT,
			@C3 AS FLOAT
	SELECT
		@C1 = MAX(C.Population_Country)
	FROM dbo.Country C

	SELECT
		@C2 = MAX(C.Population_Country)
	FROM dbo.Country C
	WHERE C.Population_Country < @C1

	SELECT
		@C3 = MAX(C.Population_Country)
	FROM dbo.Country C
	WHERE C.Population_Country < @C1 AND C.Population_Country < @C2

	SELECT @Country = C.Name_Country
	FROM dbo.Country C
	WHERE C.Population_Country = @C3
RETURN @Country
END

SELECT dbo.CountrySearcher() AS '3-MESTO'
SELECT * FROM dbo.Country C ORDER BY C.Population_Country DESC

--5.	Напишите функцию для поиска страны с максимальным населением в заданной ча-сти света и вызовите ее. Если часть света не указана, выбрать Азию.
CREATE FUNCTION MaxPopulation 
(
	@Continent NVARCHAR(50) = 'Азия'
)
RETURNS NVARCHAR(50)
AS
BEGIN
	DECLARE @Country AS NVARCHAR(50),
			@MAXIMUS AS INT
	SELECT @MAXIMUS = MAX(C.Population_Country) FROM dbo.Country C
	WHERE C.Continent = @Continent

	SELECT @Country = C.Name_Country FROM dbo.Country C
	WHERE C.Continent = @Continent AND C.Population_Country = @MAXIMUS
RETURN @Country
END

SELECT dbo.MaxPopulation('Европа') AS 'MAX POP'
--6.	Напишите функцию для замены букв в заданном слове от третьей до предпослед-ней на “тест” и примените ее для столицы страны.
CREATE FUNCTION ReplaceWord 
(
	@word NVARCHAR(130)
)
RETURNS NVARCHAR(130)
AS
BEGIN
RETURN LEFT(@word,1) + REPLICATE(' test ', LEN(@word)-2) + RIGHT(@word,1) 
END

SELECT C.Name_Country, dbo.ReplaceWord(C.Name_Country) FROM dbo.Country C

--7.	Напишите функцию, которая возвращает количество стран, не содержащих в назва-нии заданную букву.
CREATE FUNCTION CountryCount 
(
	@char AS CHAR(1)
)
RETURNS INT
AS
BEGIN
	DECLARE @count INT
	SELECT @count = COUNT(*) FROM dbo.Country C
	WHERE CHARINDEX(@char,C.Name_Country) > 0

RETURN @count
END

SELECT dbo.CountryCount('я') AS 'COUNT'

--8.	Напишите функцию для возврата списка стран с площадью меньше заданного числа и вызовите ее.
CREATE FUNCTION CountryList 
(
	@int INT
)
RETURNS TABLE
AS
RETURN
	(
		SELECT C.* FROM dbo.Country C
		WHERE C.Area_Country < @int
	)

SELECT * FROM dbo.CountryList(1000)

--9.	Напишите функцию для возврата списка стран с населением в интервале заданных значений и вызовите ее.
CREATE FUNCTION  CountryBetween
(
	@1int INT,
	@2int INT
)
RETURNS TABLE
AS
RETURN
	(
		SELECT * FROM dbo.Country C
		WHERE C.Population_Country BETWEEN @1int AND @2int
	)

SELECT * FROM dbo.CountryBetween(1,10000000)

--10.	Напишите функцию для возврата таблицы с названием континента и суммарным населением и вызовите ее.
CREATE FUNCTION TableSumPOP() 
RETURNS @table TABLE
			(
				Continent NVARCHAR(50),
				Population_Country INT
			)
AS
BEGIN
	INSERT
		@table
	SELECT
		C.Continent,
		SUM(C.Population_Country)
	FROM dbo.Country C
	GROUP BY C.Continent

RETURN
END

SELECT * FROM dbo.TableSumPOP()

--11.	Напишите функцию IsPalindrom(P) целого типа, возвращающую 1, если целый па-раметр P (P > 0) является палиндромом, и 0 в противном случае.
CREATE FUNCTION IsPalindrom(@P INT)
RETURNS INT
AS
BEGIN
    DECLARE @ReverseString VARCHAR(50);
    SET @ReverseString = REVERSE(CAST(@P AS VARCHAR(50)));
    
    IF @P = CAST(@ReverseString AS INT)
        RETURN 1;
    ELSE
        RETURN 0;
	RETURN 0;
END

PRINT(dbo.IsPalindrom(101101))

--12.	Напишите функцию Quarter(x, y) целого типа, определяющую номер координатной четверти, содержащей точку с ненулевыми вещественными координатами (x, y).
CREATE FUNCTION Quarterrr
(
	@X FLOAT,
	@Y FLOAT
)
RETURNS INT
AS
BEGIN
	DECLARE @number INT
	IF(@X > 0 AND @Y > 0)
		SET @number = 1
	ELSE IF(@X < 0 AND @Y > 0)
		SET @number = 2
	ELSE IF(@X < 0 AND @Y < 0)
		SET @number = 3
	ELSE IF(@X > 0 AND @Y < 0)
		SET @number = 4

RETURN @number
END

PRINT(dbo.Quarterrr(5,5))

--13.	Напишите функцию IsPrime(N) целого типа, возвращающую 1, если целый пара-метр N (N > 1) является простым числом, и 0 в противном случае.
CREATE FUNCTION IsPrime
(
	@number INT
)
RETURNS INT
AS
BEGIN
	DECLARE @count INT,
			@check INT,
			@result INT
	SET @count = 2
	WHILE @number / 2 >= @count
	BEGIN
		IF(@number % @count = 0)
			SET @check = 0

		SET @count = @count + 1
	END

	IF(@check = 0)
		SET @result = 0
	ELSE
		SET @result = 1

	RETURN @result
END

PRINT(dbo.IsPrime(5))

--14.	Напишите код для удаления созданных вами функций 
DROP FUNCTION TableSumPOP 
DROP FUNCTION CountryBetween 
DROP FUNCTION CountryList
DROP FUNCTION CountryCount
DROP FUNCTION ReplaceWord 
DROP FUNCTION MaxPopulation 
DROP FUNCTION CountrySearcher 
DROP FUNCTION Population_Area
DROP FUNCTION Population_Million
DROP FUNCTION Country_and_Capital
DROP FUNCTION IsPalindrom
DROP FUNCTION Quarterrr
DROP FUNCTION IsPrime





 													--Лабораторная работа №13--


--1.	Создайте представление, содержащее список африканских стран, население которых больше 10 млн. чел., а площадь больше 500 тыс. кв. км, и используйте его.
CREATE VIEW AfrikaCountry
AS
(SELECT * FROM dbo.Country C
WHERE C.Continent = 'Африка' AND C.Population_Country > 10000000 AND C.Area_Country > 500000)

SELECT * FROM dbo.AfrikaCountry A

--2.	Создайте представление, содержащее список континентов, среднюю площадь стран, которые находятся на нем, среднюю плотность населения, и используйте его.
CREATE VIEW SecondView 
AS
(SELECT C.Continent, AVG(C.Area_Country) AS 'AVG Area', AVG((C.Population_Country/C.Area_Country)) AS 'Plotnost' FROM dbo.Country C
GROUP BY C.Continent)

SELECT * FROM dbo.SecondView SV

--3.	Создайте представление, содержащее фамилии преподавателей, их должность, зва-ние, степень, место работы, количество их экзаменов, и используйте его.
CREATE VIEW TeachersInfo 
AS
	(SELECT e2.Surname, e2.Statys, t.Statys_Teacher, t.Stage, COUNT(e.Date_Exam) as 'Количество экзаменов'  FROM Teacher t JOIN Exam e
	ON e.Tab_Number_Teacher = t.Tab_Number JOIN Employee e2
	ON e2.Tab_Number = e.Tab_Number_Teacher 
	GROUP BY e2.Surname, e2.Statys, t.Statys_Teacher, t.Stage)


SELECT * FROM TeachersInfo

--4.	Создайте табличную переменную, содержащую три столбца («Номер месяца», «Название месяца», «Количество дней»), заполните ее для текущего года, и используйте ее.
DECLARE @Primer4 TABLE
(
[Номер месяца] INT,
[Название месяца] nvarchar(50),
[Количество дней] int
)

DECLARE @YearNow INT
SET @YearNow = YEAR(GETDATE())
DECLARE @NumMonth INT
SET @NumMonth = 1

while @NumMonth <= 12
Begin
 DECLARE @Date4 DATE
    SET @Date4 = DATEFROMPARTS(@YearNow, @NumMonth, 1)

    DECLARE @Month_name NVARCHAR(50)
    SET @Month_name = DATENAME(MONTH, @Date4)

    DECLARE @Month_days_count INT
    SET @Month_days_count = DAY(EOMONTH(@Date4))

    INSERT INTO @Primer4 ([Номер месяца], [Название месяца], [Количество дней])
    VALUES (@NumMonth, @Month_name, @Month_days_count)

    SET @NumMonth += 1
END

SELECT
[Номер месяца],
[Название месяца],
[Количество дней]
FROM
@Primer4


--5.	Создайте табличную переменную, содержащую список стран, площадь которых в 100 раз меньше, чем средняя площадь стран на континенте, где они находятся, и используйте ее.
DECLARE @CountryList TABLE 
(
	name NVARCHAR(50),
	capital NVARCHAR(50),
	area INT,
	population INT,
	continent NVARCHAR(50)
)
INSERT INTO @CountryList
SELECT * FROM dbo.Country C
WHERE C.Area_Country * 100 < (SELECT AVG(C2.Area_Country) FROM dbo.Country C2 WHERE C2.Continent = C.Continent GROUP BY C2.Continent)

SELECT * FROM @CountryList

--6.	Создайте локальную временную таблицу, имеющую три столбца («Номер недели», «Количество экзаменов», «Количество студентов»), заполните и используйте ее.
SELECT DATEPART(WEEK, e.Date_Exam) AS [Номер недели],	
COUNT(e.Id_Exam) AS [Количество экзаменов], 
COUNT(e.Reg_Number) AS [Количество студентов] INTO TAble1 FROM Exam e
GROUP BY DATEPART(WEEK, e.Date_Exam)

SELECT * FROM TAble1

--7.	Создайте глобальную временную таблицу, содержащую название континентов, наибольшую и наименьшую площадь стран на них, заполните и используйте ее.
CREATE TABLE Table2
(
Name_Continent VARCHAR(50),
Max_Area_Country int,
Min_Area_Country int
)

INSERT INTO Table2
SELECT c.Continent, MAX(c.Area_Country), MIN(c.Area_Country)  FROM Country c
GROUP BY c.Continent

SELECT * FROM Table2

DROP TABLE Table2


--8.	С помощью обобщенных табличных выражений напишите запрос для вывода списка сотрудников, чьи зарплаты меньше, чем средняя зарплата по факультету, их зарплаты и назва-ние факультета.
WITH Table3 AS
(
	SELECT e1.Surname, e1.Oklad, Faculty_Table.Name_Faculty FROM Employee e1 Join Cathedra c1 
	ON c1.Code_Cathedra = e1.Code JOIN 
	(SELECT AVG(e.Oklad) as Oklad_Faculty, f.Abbreviation_Faculty, f.Name_Faculty FROM Employee e Join Cathedra c 
	ON c.Code_Cathedra = e.Code JOIN Faculty f 
	ON f.Abbreviation_Faculty = c.Abb_Faculty
	GROUP BY f.Abbreviation_Faculty, f.Name_Faculty) as Faculty_Table 
	ON Faculty_Table.Abbreviation_Faculty = c1.Abb_Faculty
	WHERE e1.Oklad < Faculty_Table.Oklad_Faculty
)

SELECT * FROM Table3 
 


--9.	Напишите команды для удаления всех созданных вами представлений.
DROP VIEW TeachersInfo 
DROP VIEW SecondView 
DROP VIEW AfrikaCountry 
DROP Table Table1 








 													--Лабораторная работа №14--


--1.	Создайте курсор, содержащий отсортированные по баллам фамилии и баллы уче-ников, откройте его, выведите первую строку, закройте и освободите курсор.
DECLARE MyCursor CURSOR
FOR
	SELECT S.FIO_Student, E.Grade FROM dbo.Student S JOIN dbo.Exam E ON S.Reg_Number = E.Reg_Number
	ORDER BY S.FIO_Student
OPEN MyCursor
FETCH MyCursor
CLOSE MyCursor
DEALLOCATE MyCursor

--2.	Создайте курсор с прокруткой, содержащий список учеников, откройте его, выве-дите пятую, предыдущую, с конца четвертую, следующую, первую строку, закройте и освобо-дите курсор.
DECLARE MyCursor2 CURSOR SCROLL
FOR
	SELECT * FROM dbo.Student S
OPEN MyCursor2

FETCH ABSOLUTE 5 FROM MyCursor2
FETCH PRIOR FROM MyCursor2
FETCH ABSOLUTE -4 FROM MyCursor2
FETCH NEXT FROM MyCursor2
FETCH FIRST FROM MyCursor2

CLOSE MyCursor2
DEALLOCATE MyCursor2

--3.	Создайте курсор с прокруткой, содержащий список учеников, откройте его, выве-дите последнюю, шесть позиций назад находящуюся, четыре позиций вперед находящуюся строку, закройте и освободите курсор.
DECLARE MyCursor3 CURSOR SCROLL
FOR
	SELECT * FROM dbo.Student S
OPEN MyCursor3

FETCH LAST FROM MyCursor3
FETCH RELATIVE -6 FROM MyCursor3
FETCH RELATIVE 4 FROM MyCursor3

CLOSE MyCursor3
DEALLOCATE MyCursor3

--4.	С помощью курсора, вычислите сумму баллов у учеников с наибольшим и наименьшим баллом.
DECLARE MyCursor4 CURSOR SCROLL
FOR
	SELECT E.Grade FROM dbo.Student S JOIN dbo.Exam E ON S.Reg_Number = E.Reg_Number
	ORDER BY E.Grade

OPEN MyCursor4

DECLARE @sum FLOAT,
		@num FLOAT

FETCH FIRST FROM MyCursor4 INTO @num
SET @sum = @sum + @num
FETCH LAST FROM MyCursor4 INTO @num
SET @sum = @sum + @num
FETCH ABSOLUTE 5 FROM MyCursor4 INTO @num
SET @sum = @sum + @num
FETCH ABSOLUTE 6 FROM MyCursor4 INTO @num
SET @sum = @sum + @num
FETCH ABSOLUTE 12 FROM MyCursor4 INTO @num
SET @sum = @sum + @num

PRINT @sum
CLOSE MyCursor4
DEALLOCATE MyCursor4

--5.	С помощью курсора, сгенерируйте строку вида «Ученики <список фамилий и названий предметов, разделенных запятыми> участвовали в олимпиаде».
DECLARE MyCursor5 CURSOR SCROLL
FOR
	SELECT * FROM dbo.

--6.	Создайте курсор, содержащий список учеников, с его помощью выведите учеников с нечетной позицией.
DECLARE MyCursor CURSOR SCROLL
FOR
SELECT * FROM Students

OPEN MyCursor

FETCH ABSOLUTE 1 FROM MyCursor 
WHILE @@FETCH_STATUS = 0
BEGIN
	FETCH RELATIVE 2 FROM MyCursor
END
CLOSE MyCursor
DEALLOCATE MyCursor

SELECT * FROM Students

--7.	Создайте курсор, содержащий отсортированный по убыванию баллов список уче-ников, откройте его, для каждого ученика выведите фамилию, предмет, школу, баллы и про-центное соотношение баллов с предыдущим учеником.
DECLARE MyCursor1 CURSOR SCROLL
FOR
SELECT * FROM Students s
ORDER BY s.Balls DESC

DECLARE @I INT
DECLARE @F VARCHAR(50)
DECLARE @P VARCHAR(50)
DECLARE @S VARCHAR(50)
DECLARE @B FLOAT
DECLARE @OB FLOAT
SET @OB = 0;

OPEN MyCursor1

FETCH NEXT FROM MyCursor1 INTO @I ,@F, @P, @S, @B
WHILE @@FETCH_STATUS = 0
BEGIN
SELECT
@I AS Айди,
@F AS Фамилия,
@P AS Предмет,
@S AS Школа,
@B AS Баллы,
ABS(@B - @OB) AS Разница
SET @OB = @B
FETCH NEXT FROM MyCursor1 INTO @I,@F, @P, @S, @B
END

CLOSE MyCursor1
DEALLOCATE MyCursor1

SELECT * FROM Students






 													--Лабораторная работа №15--


--1.	Вывести список учеников и разницу между баллами ученика и максимальным бал-лом в каждой строке.
SELECT s.*, (100 - Balls) as 'Разница между баллами ученика и максимальным бал-лом' FROM Students s

--2.	Вывести список учеников и процентное соотношение к среднему баллу в каждой строке.
SELECT s.*, Balls * 100/ AVG(Balls) OVER() AS 'Процентное соотношение к среднему баллу' FROM Students s

--3.	Вывести список учеников и минимальный балл в школе в каждой строке.
SELECT s.*, MIN(s.Balls) OVER(PARTITION BY s.school) AS 'Минимальный балл в школе' FROM Students s

--4.	Вывести список учеников и суммарный балл в школе в каждой строке, отсортировать по школам в оконной функции.
SELECT s.*, SUM(s.Balls) OVER(PARTITION BY s.school ORDER BY s.school) AS 'Cуммарный балл в школе' FROM Students s

--5.	Вывести список учеников и номер строки при сортировке по фамилиям в обратном алфавитном порядке.
SELECT ROW_NUMBER() OVER(ORDER BY s.Surname DESC) as 'Номер строки',s.* FROM Students s

--6.	Вывести список учеников, номер строки внутри школы и количество учеников в школе при сортировке по баллам по убыванию.
SELECT ROW_NUMBER() OVER(PARTITION BY s.School ORDER BY s.Balls DESC) as 'Номер строки внутри школы',s.* FROM Students s
 
--7.	Вывести список учеников и ранг по баллам.
SELECT RANK() OVER(ORDER BY s.Balls) as 'Ранг по баллам' ,s.* FROM Students s

--8.	Вывести список учеников и сжатый ранг по баллам. Результат отсортировать по фамилии в алфавитном порядке.
SELECT DENSE_RANK() OVER(ORDER BY s.Balls) as 'Сжатый ранг по баллам',s.* FROM Students s
ORDER BY s.Surname ASC

--9.	Вывести список учеников, распределенных по пяти группам по фамилии.
SELECT NTILE(5) OVER(ORDER BY s.Surname) as Гр_Фам, s.* FROM Students s

--10.	Вывести список учеников, распределенных по трем группам по баллам внутри школы.
SELECT NTILE(3) OVER(PARTITION BY s.School ORDER BY s.Balls) as Гр_Балл, s.* FROM Students s

--11.	Вывести список учеников и разницу с баллами ученика, находящегося выше на три позиции при сортировке по возрастанию баллов.
SELECT s.*, ABS(s.Balls - LEAD(s.Balls, 3) OVER(ORDER BY s.Balls ASC)) as 'Разница с баллами ученика, находящегося выше на три позиции' 
FROM Students s

--12.	Вывести список учеников и разницу с баллами следующего ученика при сорти-ровке по убыванию баллов, значение по умолчанию использовать 0.
SELECT s.*, ABS(s.Balls - LEAD(s.Balls, 1, 0) OVER(ORDER BY s.Balls DESC)) as 'Разница с баллами следующего ученика' 
FROM Students s







 													--Лабораторная работа №16--


--1.	Напишите запрос, который выводит максимальный балл учеников по школам, по каждому предмету по каждой школе и промежуточные итоги
SELECT  s.School, s.SubjectSchool, MAX(s.Balls) FROM Students s
GROUP BY s.School, s.SubjectSchool WITH ROLLUP

--2.	Напишите запрос, который выводит минимальный балл учеников по школам и по предметам, и промежуточные итоги.
SELECT  s.School, s.SubjectSchool, MIN(s.Balls) FROM Students s
GROUP BY s.School, s.SubjectSchool WITH CUBE

--3.	Напишите запрос, который выводит средний балл учеников по школам и по предметам.
SELECT  s.School, s.SubjectSchool, AVG(s.Balls) FROM Students s
GROUP BY GROUPING SETS(s.School, s.SubjectSchool)

--4.	Напишите запрос, который выводит количество учеников по каждой школе по пред-метам и промежуточные итоги. 
--NULL значения заменить на соответствующий текст.
SELECT
COALESCE(SubjectSchool, 'ИТОГО') AS Предмет
,COALESCE(School, ' _Итого_ по предмету') AS Школа
,COUNT(Surname) AS Количество
FROM Students
GROUP BY
ROLLUP(SubjectSchool, School)

--5.	Напишите запрос, который выводит суммарный балл учеников по школам и по пред-метам, и промежуточные итоги.
--В итоговых строках NULL значения заменить на соответству-ющий текст в зависимости от группировки.
SELECT IIF(GROUPING(SubjectSchool)=1, 'ИТОГО', SubjectSchool) AS Предмет ,IIF(GROUPING(School)=1, ' _Итого_ по предмету', School) AS Школа ,
SUM(Balls) AS 'Суммарный балл' FROM Students
GROUP BY CUBE(SubjectSchool, School)

--6.	Напишите запрос, который выводит максимальный балл учеников по школам и по предметам. 
--В итоговых строках NULL значения заменить на соответствующий текст в зави-симости от уровней группировки.
SELECT IIF(GROUPING(SubjectSchool)=1, 'ИТОГО', SubjectSchool) AS Предмет ,IIF(GROUPING(School)=1, ' _Итого_ по предмету', School) AS Школа ,
MAX(Balls) AS 'Максимальный балл' FROM Students
GROUP BY CUBE(SubjectSchool, School)

--7.	Напишите запрос, который выводит средний балл учеников по школам в столбцы.
SELECT School ,Математика, Физика, Химия FROM (SELECT AVG(s.Balls) as Sr_Ball, s.SubjectSchool, s.School FROM Students s GROUP BY s.SubjectSchool, s.School) as Table1
PIVOT (AVG(Sr_Ball) for SubjectSchool IN (Математика, Физика, Химия)) as Pivot1

--8.	Напишите запрос, который выводит средний балл учеников по школам в столбцы и по предметам в строки.
SELECT SubjectSchool, Гимназия, Лицей FROM (SELECT AVG(s.Balls) as Sr_Ball, s.SubjectSchool, s.School FROM Students s GROUP BY s.SubjectSchool, s.School) as Table1
PIVOT (AVG(Sr_Ball) for School IN (Гимназия, Лицей)) as Pivot1

--9.	Напишите запрос, который выводит названия предметов, фамилии учеников и школы в один столбец.
SELECT
SubjectSchool,
[Фамилия или школа]
FROM Students
UNPIVOT (
[Фамилия или школа] FOR Значение IN (Surname, School)
) unpvt







 																--Лабораторная работа №17--


--1.	Создайте и запустите динамический SQL-запрос, выбирающий первые N строк из заданной таблицы.
DECLARE @DSQL VARCHAR(100), @Num int, @Table1 NVARCHAR(100);

SET @Num = 5;
SET @Table1 = 'Students'
SET @DSQL = 'SELECT TOP ' + CAST(@Num as NVARCHAR(30)) + ' * FROM ' + @Table1

EXECUTE (@DSQL)


--2.	Создайте и запустите динамический SQL-запрос, выбирающий все страны из таб-лицы «Страны», 
--последняя буква названия которых расположена в заданном диапазоне.
DECLARE @L1 CHAR(1)
DECLARE @L2 CHAR(1)

SET @L1 = 'а'
SET @L2 = 'д'

EXECUTE ('SELECT * FROM Country c WHERE c.Name_Country LIKE ''%[' + @L1 + '-' + @L2+	']''')

--3.	Создайте временную таблицу #Temp и добавьте к ней название столбцов таблицы «Страны». 
--Создайте курсор, который, построчно читая таблицу #Temp, выбирает каждый раз соответствующий столбец из таблицы «Страны».
CREATE TABLE #TEMP
(
TABLENAME VARCHAR(50)
)
INSERT INTO
#TEMP
VALUES
('Name_Country'),
('Capital'),
('Area_Country'),
('Population_Country'),
('Continent')

DECLARE TC CURSOR
FOR SELECT TABLENAME FROM #TEMP
OPEN TC
DECLARE @TN VARCHAR(50)
FETCH FROM TC INTO @TN
WHILE @@FETCH_STATUS = 0
BEGIN
EXECUTE ('SELECT '+ @TN +' FROM Country')
FETCH FROM TC INTO @TN
END
CLOSE TC
DEALLOCATE TC
DROP TABLE #TEMP

--4.	Создайте процедуру, которая принимает как параметр список столбцов, название таблицы и выбирает заданные столбцы из заданной таблицы.
CREATE PROCEDURE SelectColumnsFromTable
    @ColumnList NVARCHAR(MAX),
    @TableName NVARCHAR(MAX)
AS
BEGIN
    DECLARE @SqlQuery NVARCHAR(MAX)

    SET @SqlQuery = 'SELECT ' + @ColumnList + ' FROM ' + @TableName

    EXEC sp_executesql @SqlQuery
END

EXEC SelectColumnsFromTable 'Name_Country, Capital, Area_Country, Population_Country, Continent', 'Country'

--5.	Создайте процедуру, принимающую как параметр список столбцов, название таб-лицы, название проверяемого столбца, 
--знак сравнения, значение проверки и выбирающую за-данные столбцы из заданной таблицы в заданных условиях.
CREATE PROCEDURE SelectColumnsWithCondition
    @ColumnList NVARCHAR(MAX),
    @TableName NVARCHAR(MAX),
    @ColumnName NVARCHAR(MAX),
    @ComparisonOperator NVARCHAR(2),
    @ComparisonValue NVARCHAR(MAX)
AS
BEGIN
    DECLARE @SqlQuery NVARCHAR(MAX)

    SET @SqlQuery = 'SELECT ' + @ColumnList + ' FROM ' + @TableName + ' WHERE ' + @ColumnName + ' ' + @ComparisonOperator + ' ' + @ComparisonValue

    EXEC sp_executesql @SqlQuery
END 

EXEC SelectColumnsWithCondition 'Name_Country, Capital, Area_Country, Population_Country, Continent', 'Country', 'Area_Country', '>', '500000'

--6.	Выберите список европейских стран из таблицы «Страны» и экспортируйте в RAW формате XML.
SELECT * FROM Country c  
WHERE c.Continent = 'Европа'
FOR XML RAW

--7.	Выберите список стран с населением больше 100 млн. чел. из таблицы «Страны» и экспортируйте в PATH формате XML.
SELECT * FROM Country c 
WHERE c.Population_Country > 100000000
FOR XML PATH

--8.	Выберите список учеников из школы «Лицей» из таблицы «Ученики» и экспорти-руйте в PATH формате JSON
SELECT * FROM Students s
WHERE s.School = 'Лицей'
FOR JSON PATH