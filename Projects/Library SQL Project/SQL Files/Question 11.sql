SELECT student.Student_ID, First_Name, Last_Name, Count(book_student.StudentID) as 'Books_Borrowed'
FROM student, book_student
WHERE student.Student_ID = book_student.StudentID AND College = 'Business'
GROUP BY student.Student_ID
HAVING Books_Borrowed >= 2;
