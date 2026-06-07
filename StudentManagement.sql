/*Create Database and Table*/

CREATE DATABASE StudentManagement; 
USE StudentManagement;

CREATE TABLE Students(
Id INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(50),
Gender VARCHAR(10),
Age INT NOT NULL,
Grade VARCHAR(10),
Math_Score INT ,
Science_Score INT,
English_Score INT );

/*Insert Sample Data*/

INSERT INTO Students VALUE (1, "Suvam Pal", "MALE",23, "A", 76, 65, 80);
INSERT INTO Students VALUE (2, "Rocky Pal", "MALE",24, "C", 56, 60, 51);
INSERT INTO Students VALUE (3, "Avijit Ghosh", "MALE",23, "B", 62, 79, 67);
INSERT INTO Students VALUE (4, "Saloni Kumari", "FIMALE",22, "A+", 85, 98, 90);
INSERT INTO Students VALUE (5, "Rupa Roy", "FIMALE",23, "A", 78, 80, 87);
INSERT INTO Students VALUE (6, "Amit Pul", "MALE",22, "B", 65, 78, 69);
INSERT INTO Students VALUE (7, "Riju Pal", "MALE",24, "A", 75, 89, 90);
INSERT INTO Students VALUE (8, "Riya Ghosh", "FIMALE",22, "D", 55, 49, 68);
INSERT INTO Students VALUE (9, "Prinka Roy", "FIMALE",22, "A", 83, 79, 88);
INSERT INTO Students VALUE (10, "Riju Pal", "MALE",26, "A", 48, 54, 70);

/*isplay All Students and Their Details*/

SELECT * FROM Students;

/*Average Score for Each Subject*/

SELECT
    AVG(Math_Score) AS Average_Math,
    AVG(Science_Score) AS Average_Science,
    AVG(English_Score) AS Average_English
FROM Students;    

/*Student with the Highest Total Score*/

SELECT
    ID,
    Name,
    Gender,
    Age,
    (Math_Score + Science_Score + English_Score) AS Total_Score
FROM Students
WHERE (Math_Score + Science_Score + English_Score) =
(
    SELECT MAX(Math_Score + Science_Score + English_Score)
    FROM Students
);

/*Count the Number of Students in Each Grade*/

SELECT
   Grade,
   COUNT(*) AS NumberOfStudents
FROM Students
GROUP BY Grade
ORDER BY Grade; 

/*The Average Score for Male and Female Students*/
SELECT
    Gender,
    AVG(Math_Score) AS AvgMath,
    AVG(Science_Score) AS AvgScience,
    AVG(English_Score) AS AvgEnglish,
    AVG(Math_Score + Science_Score + English_Score) AS AvgTotalScore
FROM Students
GROUP BY Gender;

/*Students Whose Math Score is Above 80*/

SELECT
    Id,
    Name,
    Gender,
    Age,
    Math_Score
FROM Students
WHERE Math_Score >80
ORDER BY Math_Score DESC;    

/*Update the Grade of a Student with a Specific Student ID*/

UPDATE Students
SET Grade="A"
Where ID=3;

/*Verify the Update*/

SELECT
    ID,
    Name,
    Grade
FROM Students
WHERE ID = 3;