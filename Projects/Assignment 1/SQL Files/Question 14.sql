-- Koby Manning
SELECT book.Book_ID, book.Book_Title
FROM book
WHERE NOT EXISTS (SELECT * FROM book_student
					WHERE (book.Book_ID = book_student.BookID));