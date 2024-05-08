USE coursemanagementsystem;
SHOW TABLES;

DESCRIBE STUDENTS;
DESCRIBE STUDENTCOURSES;
DESCRIBE COURSES;
DESCRIBE INSTRUCTORCOURSES;
DESCRIBE INSTRUCTORS;

-- Question 3
CREATE TABLE COURSES(
COURSE_ID CHAR(5) PRIMARY KEY NOT NULL,
TITLE VARCHAR(50),
CREDIT TINYINT,
DEPARTMENT VARCHAR(30),
DELIVERY_MODE CHAR(1)
);
DESCRIBE COURSES;

CREATE TABLE STUDENTS(
STUDENT_ID CHAR(6) PRIMARY KEY NOT NULL,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
LEVEL CHAR(1),
DEPARTMENT VARCHAR(30)
);
DESCRIBE STUDENTS;

CREATE TABLE INSTRUCTORS(
INSTRUCTOR_ID CHAR(6) PRIMARY KEY NOT NULL,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
DEPARTMENT VARCHAR(30),
EXPERIENCE TINYINT
);
DESCRIBE INSTRUCTORS;

CREATE TABLE STUDENTCOURSES(
STUDENT_ID CHAR(6) NOT NULL,
COURSE_ID CHAR(5) NOT NULL
);
ALTER TABLE STUDENTCOURSES
	ADD PRIMARY KEY (STUDENT_ID, COURSE_ID);
ALTER TABLE STUDENTCOURSES
    ADD FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS(STUDENT_ID);
ALTER TABLE STUDENTCOURSES
    ADD FOREIGN KEY(COURSE_ID) REFERENCES COURSES(COURSE_ID);
DESCRIBE STUDENTCOURSES;

CREATE TABLE INSTRUCTORCOURSES(
INSTRUCTOR_ID CHAR(6) NOT NULL,
COURSE_ID CHAR(6) NOT NULL
);
ALTER TABLE INSTRUCTORCOURSES
	ADD PRIMARY KEY(INSTRUCTOR_ID, COURSE_ID);
ALTER TABLE INSTRUCTORCOURSES
	ADD FOREIGN KEY (INSTRUCTOR_ID) REFERENCES INSTRUCTORS(INSTRUCTOR_ID);
ALTER TABLE INSTRUCTORCOURSES
	ADD FOREIGN KEY (COURSE_ID) REFERENCES COURSES(COURSE_ID);
DESCRIBE INSTRUCTORCOURSES;

-- QUESTION 4
-- used table wizard to insert data into 3 main tables
SELECT * FROM STUDENTS;
SELECT * FROM INSTRUCTORS;
SELECT * FROM COURSES;


-- QUESTION 5
UPDATE COURSES
	SET TITLE = "Advanced Mathematical Methods in Physics"
		WHERE TITLE = "Mathematical Methods in Physics";
SELECT * FROM COURSES;

-- QUESTION 6 
DELETE FROM STUDENTS
	WHERE STUDENT_ID = 104888 OR STUDENT_ID = 155661;
SELECT * FROM STUDENTS;

-- QUESTION 7
INSERT INTO INSTRUCTORS VALUES(
'681247',
'Hunter',
'White',
'Natural Sciences and Mathematics',
'2');
SELECT * FROM INSTRUCTORS;

-- QUESTION 8
SELECT * FROM INSTRUCTORS
	WHERE INSTRUCTOR_ID IN 
    (SELECT INSTRUCTOR_ID FROM INSTRUCTORCOURSES
		GROUP BY INSTRUCTOR_ID
		HAVING COUNT(INSTRUCTOR_ID) > 1);

-- QUESTION 9
CREATE VIEW COURSESVIEW AS
	(SELECT * FROM COURSES WHERE DEPARTMENT = 'Physics');
SELECT * FROM COURSESVIEW;
	
CREATE VIEW INSTRUCTORCOURSESVIEW AS
	(SELECT * FROM INSTRUCTORCOURSES WHERE INSTRUCTOR_ID = '983686');
SELECT * FROM INSTRUCTORCOURSESVIEW;

CREATE VIEW INSTRUCTORSVIEW AS
	(SELECT * FROM INSTRUCTORS WHERE DEPARTMENT = 'Natural Sciences and Mathematics');
    SELECT * FROM INSTRUCTORSVIEW;
    
CREATE VIEW STUDENTCOURSESVIEW AS
	(SELECT * FROM STUDENTCOURSES WHERE COURSE_ID = '27794');
	SELECT * FROM STUDENTCOURSESVIEW;
    
CREATE VIEW STUDENTSVIEW AS
	(SELECT * FROM STUDENTS WHERE DEPARTMENT = 'Humanities');
    SELECT * FROM STUDENTSVIEW;
    
-- QUESTION 10
SELECT STUDENTCOURSES.STUDENT_ID, FIRST_NAME, LAST_NAME, TITLE
FROM STUDENTS, STUDENTCOURSES, COURSES
WHERE STUDENTS.STUDENT_ID = STUDENTCOURSES.STUDENT_ID AND COURSES.COURSE_ID = STUDENTCOURSES.COURSE_ID;

-- QUESTION 11
SELECT INSTRUCTORCOURSES.INSTRUCTOR_ID, FIRST_NAME, LAST_NAME, COUNT(DISTINCT(STUDENT_ID))
	FROM INSTRUCTORS, INSTRUCTORCOURSES, STUDENTCOURSES
		WHERE INSTRUCTORS.INSTRUCTOR_ID = INSTRUCTORCOURSES.INSTRUCTOR_ID AND
			INSTRUCTORCOURSES.COURSE_ID = STUDENTCOURSES.COURSE_ID
            GROUP BY INSTRUCTORCOURSES.INSTRUCTOR_ID;




