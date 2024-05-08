-- Koby Manning
SELECT First_Name, Last_Name, book_student.BookID, book.Book_Title
FROM student
LEFT JOIN book_student ON (student.Student_ID = book_student.StudentID)
LEFT JOIN book ON (book_student.BookID = book.Book_ID);
