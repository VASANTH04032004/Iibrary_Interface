import 'package:flutter/material.dart';

class Book {
  final String title;
  final String author;
  final String borrower;
  final DateTime borrowedDate;

  Book({
    required this.title,
    required this.author,
    required this.borrower,
    required this.borrowedDate,
  });
}

class BorrowedBooksScreen extends StatelessWidget {
  // Example list of borrowed books (replace with actual data or fetch from API)
  final List<Book> borrowedBooks = [
    Book(
      title: 'Book 1',
      author: 'Author A',
      borrower: 'John Doe',
      borrowedDate: DateTime(2024, 7, 15),
    ),
    Book(
      title: 'Book 2',
      author: 'Author B',
      borrower: 'Jane Smith',
      borrowedDate: DateTime(2024, 7, 10),
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Borrowed Books'),
      ),
      body: ListView.builder(
        itemCount: borrowedBooks.length,
        itemBuilder: (context, index) {
          Book book = borrowedBooks[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text('by ${book.author}'),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text('Borrowed by: ${book.borrower}'),
                Text('Borrowed on: ${book.borrowedDate.toString().substring(0, 10)}'),
              ],
            ),
            // Add more details or actions here if needed
          );
        },
      ),
    );
  }
}
