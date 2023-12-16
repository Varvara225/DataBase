-- DROP SCHEMA db_project;
DROP DATABASE IF EXISTS db_project;
CREATE DATABASE  db_project;
USE db_project; 

DROP TABLE IF EXISTS Videos;
CREATE TABLE Videos (
  `video_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `topic` VARCHAR(45) NOT NULL,
  `videotext_type` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `length` INT NOT NULL,
  PRIMARY KEY (`video_id`));

DROP TABLE IF EXISTS Fragments;
CREATE TABLE Fragments (
  `fragment_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  `start_point` TIME NOT NULL,
  `end_point` TIME NOT NULL,
  PRIMARY KEY (`fragment_id`));

DROP TABLE IF EXISTS VideoTexts;
CREATE TABLE VideoTexts (
  `videotext_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`videotext_id`));
  
DROP TABLE IF EXISTS Annotators;
CREATE TABLE Annotators (
  `annotator_id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `education` VARCHAR(500) NOT NULL,
  `birthday` DATETIME NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`annotator_id`));
  
ALTER TABLE Annotators MODIFY description VARCHAR(1000);

DROP TABLE IF EXISTS Annotation; 
CREATE TABLE Annotation (
  `annotation_id` INT NOT NULL,
  `fragment_id` INT NOT NULL,
  `sign_lang` VARCHAR(45) NOT NULL,
  `gloss` VARCHAR(45) NOT NULL,
  `translation` INT NOT NULL,
  `annotator_id` INT NOT NULL,
  PRIMARY KEY (`annotation_id`));
  
ALTER TABLE Annotation MODIFY translation VARCHAR(100);

DROP TABLE IF EXISTS DeafDegree;
CREATE TABLE DeafDegree (
  `degree_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`degree_id`));

DROP TABLE IF EXISTS Participants;
CREATE TABLE Participants (
  `participant_id` INT NOT NULL,
  `signer_type` INT NOT NULL,
  `sex` VARCHAR(45) NOT NULL,
  `birthday` DATETIME NOT NULL,
  `region` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`participant_id`));

DROP TABLE IF EXISTS Participating;  
CREATE TABLE Participating (
  `id` INT NOT NULL,
  `fragment_id` INT NOT NULL,
  `participant_id` INT NOT NULL,
  PRIMARY KEY (`id`));

DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
  `user_id` INT NOT NULL,
  `annotator_id` INT NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`));

INSERT INTO Videos (video_id, name, topic, videotext_type, date, location, length)
VALUES
(1, 'Introduction to SQL', 'Education', 1, '2023-04-01', 'Moscow', 30),
(2, 'Cooking 101', 'Food', 2, '2023-03-15', 'Moscow', 60),
(3, 'Yoga for Beginners', 'Health', 1, '2023-02-20', 'Moscow', 18),
(4, 'Gardening Tips', 'Gardening', 3, '2023-01-11', 'Novosibirsk', 12),
(5, 'History of the Internet', 'Education', 1, '2022-01-30', 'Library', 24),
(6, 'Street Photography', 'Photography', 2, '2022-03-21', 'City Center', 15),
(7, 'Mountain Biking', 'Sports', 3, '2021-04-03', 'Mountains', 36),
(8, 'Science Experiments', 'Science', 1, '2021-02-05', 'Laboratory', 9),
(9, 'DIY Home Decor', 'Art & Craft', 3, '2021-03-18', 'Novosibirsk', 12),
(10, 'Tech News Roundup', 'Technology', 2, '2020-03-30', 'Novosibirsk', 18);

  
INSERT INTO Users (user_id, annotator_id, login, password) VALUES
(1, 1,'user1', 'pass1'),
(2, 2, 'user2', 'pass2'),
(3, 3, 'user3', 'pass3'),
(4, 4, 'user4', 'pass4'),
(5, 5, 'user5', 'pass5'),
(6, 6, 'user6', 'pass6'),
(7, 7, 'user7', 'pass7');

INSERT INTO Annotators (annotator_id, name, education, birthday, description) VALUES
(1, 'Комарова Анна Анатольевна', 'Центр образования глухих и жестового языка ми. Г.Л. Зайцевой', '1965-03-30', 'Автор нескольких десятков печатных работ о жизни и культуре глухих, переводческой деятельности и жестовому языку. Научный руководитель ряда студенческих работ по РЖЯ. Член Совета всемирной Ассоциации переводчиков жестового языка, член Совета Объединения переводчиков жестового языка РФ.'),
(2, 'Кибрик Андрей Александрович', 'Институт языкознания РАН', '1970-03-30', 'Инициатор систематических исследований РЖЯ профессиональными лингвистами. Научный руководитель ряда студенческих работ и первой диссертации по РЖЯ.  Автор и соавтор ряда статей, посвященных РЖЯ, в частности, его дискурсивной структуре.'),
(3, 'Светлана Игоревна Буркова', 'Новосибирский государственный технический университет', '1975-03-30', 'Автор и соавтор ряда статей, посвященных различным лингвистическим аспектам РЖЯ. Руководитель проекта «Корпусное исследование морфосинтаксиса и лексики русского жестового языка (грант РФФИ № 12-06-00231-а). Инициатор и руководитель проекта по созданию онлайн-корпуса РЖЯ. Инициатор создания и один из авторов первого русскоязычного учебника по лингвистике жестовых языков. Научный руководитель ряда студенческих работ по РЖЯ, а также диссертации, посвященной грамматической семантике РЖЯ.'),
(4, 'Вадим Игоревич Киммельман', 'университет Бергена', '1975-03-30', 'Автор и соавтор ряда статей, посвященных различным лингвистическим аспектам РЖЯ. Автор диссертации, посвященной информационной структуре в РЖЯ и нидерландском жестовом языке. Участник проекта «Корпусное исследование морфосинтаксиса и лексики русского жестового языка (грант РФФИ № 12-06-00231-а). Участник проекта по созданию онлайн-корпуса РЖЯ.  Один из авторов первого русскоязычного учебника по лингвистике жестовых языков. Научный руководитель ряда студенческих работ по РЖЯ.'),
(5, 'Елизавета Владимировна Филимонова', 'МГУ', '1988-03-30', 'Автор ряда статей по морфологии и грамматической семантике РЖЯ. Автор диссертации, посвященной средствам выражения аспектуальности в РЖЯ. Участник проекта «Корпусное исследование морфосинтаксиса и лексики русского жестового языка (грант РФФИ № 12-06-00231-а). Участник проекта по созданию онлайн-корпуса РЖЯ.  Один из авторов первого русскоязычного учебника по лингвистике жестовых языков.'),
(6, 'Мария Викторовна Кюсева', 'МГУ', '1989-03-30', 'Автор ряда статей, посвященных лексике РЖЯ, и диссертации, посвященной анализу признаковых полей в РЖЯ в типологической перспективе.  Один из авторов первого русскоязычного учебника по лингвистике жестовых языков.'),
(7, 'Анастасия Александровна Бауэр', 'Институт славистики Кёльнского университета', '1969-03-30', 'Автор ряда статей по жестовой лингвистике. Руководитель проекта «Корпусное исследование артикуляции и дактиля в РЖЯ: описание и значение для кросс-модального контакта» (грант немецкого научно-исследовательского сообщества BA 4311/1-1).');

INSERT INTO Fragments (video_id, fragment_id, start_point, end_point) VALUES
(4, 1, '00:00:00', '00:05:00'),
(4, 2, '00:00:00', '00:03:00'),
(4, 3, '00:02:00', '00:06:00'),
(3, 4, '00:01:30', '00:04:30'),
(3, 5, '00:03:00', '00:07:00'),
(8, 6, '00:00:00', '00:02:30'),
(8, 7, '00:02:00', '00:05:00'),
(1, 8, '00:04:00', '00:09:00'),
(1, 9, '00:01:00', '00:03:30'),
(1, 10, '00:00:00', '00:06:00');


INSERT INTO VideoTexts (videotext_id, name, description) VALUES
(1, 'spontaneous', 'монологи и диалоги'),
(2, 'stimul', 'тексты, записанные на основе стимульных материалов (пересказы мультфильмов, рассказ по картинкам)'),
(3, 'elicitation', 'материалы, полученные путем элицитации');
 
INSERT INTO DeafDegree (degree_id, name, description) VALUES
(1, 'deaf', 'глухой'),
(2, 'hard of hearing', 'слабослышащий'),
(3, 'CODA', 'ребенок глухих родителей');

INSERT INTO Participants (participant_id, signer_type, birthday, sex, region) VALUES
(1, 1, '2003-02-20', 'female', 'Москва'),
(2, 2, '2000-02-20', 'female', 'Москва'),
(3, 1, '2001-02-20', 'female', 'Новосибирск'),
(4, 3, '1992-02-20', 'female', 'Москва'),
(5, 1, '1999-02-20', 'female', 'Новосибирск'),
(6, 2, '1989-02-20', 'female', 'Новосибирск'),
(7, 2, '1999-01-22', 'male', 'Москва'),
(8, 3, '2003-09-08', 'male', 'Москва'),
(9, 3, '2002-02-20', 'male', 'Новосибирск'),
(10, 1, '1985-02-20', 'male', 'Москва');

INSERT INTO Annotation (annotation_id, fragment_id, sign_lang, gloss, translation, annotator_id) VALUES
(1, 10, 'RSL', 'scjhbd-cdmnc-hc', 'привет, как дела?', 4),
(2, 9, 'ASL', 'bcshvhs-sjjs-xsj', 'я стоял там', 7),
(3, 8, 'RSL', 'shbcs-bjcj-sj', 'как тебя зовут?', 6),
(4, 7, 'RSL', 'fsa-annhsh-sm', 'вот там за дверью', 5),
(5, 5, 'ASL', 'sbsbs-skjxn-bxhh', 'около меня', 6),
(6, 8, 'RSL', 'ajkka-snndhh-nxb', 'она говорит, что ее там не было', 1),
(7, 3, 'RSL', 'whytst-sdhh-nhx', 'вечером после работы', 6),
(8, 8, 'ASL', 'wgttsfc-snxju-bsbg', 'не понимаю это слово', 8),
(9, 8, 'RSL', 'bsh-sggwvw-hxgv', 'сколько времени?', 2),
(10, 1, 'ASL', 'xjj-xhxfvw-xhh', 'да, мне тоже понравилось', 3);

INSERT INTO Participating (id, fragment_id, participant_id) VALUES
(1, 2, 3),
(2, 3, 4),
(3, 4, 5),
(4, 2, 6),
(5, 6, 7),
(6, 7, 8),
(7, 7, 9),
(8, 4, 10),
(9, 10, 1),
(10, 10, 2);

-- 3 SELECT  + фильтрация
-- поиск видео за последние два года
SELECT *
FROM Videos
WHERE date BETWEEN DATE('2022-01-01') AND DATE('2023-12-31');

-- 4 SELECT + группировка и агрегация
-- группировка по полу информантов и разброс возрастов
SELECT sex,
COUNT(participant_id) AS num_participants,
YEAR(CURDATE())-YEAR(MIN(birthday)) as mах_age,
YEAR(CURDATE())-YEAR(MAX(birthday)) as min_age
FROM db_project.Participants
GROUP BY sex;

-- 5 SELECT + вложенный запрос
-- поиск всех аннотаций, которые оставил конкретный аннотатор
SELECT *
FROM db_project.Annotation AS A
WHERE A.annotator_id = (
	SELECT Ar.annotator_id
	FROM db_project.Annotators AS Ar
	WHERE Ar.name LIKE 'Кибрик%');

-- 6 SELECT + JOIN + что-то
SELECT def, text_type, topic, GROUP_CONCAT(video_name)
FROM
	(SElECT V.name AS video_name, topic, T.name AS text_type, T.description AS def
	FROM db_project.Videos as V
	JOIN db_project.VideoTexts AS T
	ON V.videotext_type = T.videotext_id
	WHERE T.name = 'spontaneous') AS t1
GROUP BY def, text_type, topic;

-- 7 Процедура
DROP PROCEDURE IF EXISTS find_video;

DELIMITER //
CREATE PROCEDURE find_video (deaf_type VARCHAR(25))
BEGIN    
  SELECT V.name, topic, date, F.fragment_id, sex, D.name AS type, D.description
	FROM Videos AS V
	INNER JOIN Fragments AS F
	ON V.video_id = F.video_id
	INNER JOIN Participating AS Pting
	ON Pting.fragment_id = F.fragment_id
	INNER JOIN Participants AS P
	ON P.participant_id = Pting.participant_id
	INNER JOIN DeafDegree as D
	ON P.signer_type = D.degree_id
	AND D.name = deaf_type;
END//

DELIMITER ;
CALL find_video('hard of hearing');

-- 8 Триггер
DROP TRIGGER IF EXISTS`delete_users`;

DELIMITER //
CREATE TRIGGER `delete_users`
AFTER DELETE ON `Users`
FOR EACH ROW
BEGIN
	DELETE FROM Annotators
	WHERE annotator_id = OLD.user_id;
	DELETE FROM Annotation
	WHERE annotator_id = OLD.user_id;
END//

SET SQL_SAFE_UPDATES = 0;

DELIMITER ;
DELETE FROM db_project.Users
WHERE user_id = 5;

SELECT *
FROM Annotators;

SELECT *
FROM Annotation;

SELECT *
FROM Users;




