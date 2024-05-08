SELECT First_Name, Last_Name, COUNT(book_author.AuthorID) as 'Books_Published', book_author.AuthorID
FROM author, book_author
WHERE author.Auther_ID = book_author.AuthorID
GROUP BY book_author.AuthorID
HAVING Books_Published >= 3;