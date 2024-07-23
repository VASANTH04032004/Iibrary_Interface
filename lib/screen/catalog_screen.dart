import 'package:flutter/material.dart';

class Book {
  final String title;
  final String author;
  final String genre;

  Book({required this.title, required this.author, required this.genre});
}

class CatalogScreen extends StatefulWidget {
  @override
  CatalogScreenState createState() => CatalogScreenState();
}

class CatalogScreenState extends State<CatalogScreen> {
  List<Book> books = [
    Book(title: 'Book 1', author: 'Author A', genre: 'Fantasy'),
    Book(title: 'Book 2', author: 'Author B', genre: 'Sci-Fi'),
    Book(title: 'Book 3', author: 'Author C', genre: 'Mystery'),
    Book(title: 'Book 4', author: 'Author D', genre: 'Romance'),
    Book(title: 'Book 5', author: 'Author E', genre: 'Thriller'),
  ];

  TextEditingController searchController = TextEditingController();
  String searchText = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Book> getFilteredBooks() {
    if (searchText.isEmpty) {
      return books;
    } else {
      return books.where((book) =>
          book.title.toLowerCase().contains(searchText.toLowerCase())).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalogs of Books'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search by Title',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      searchController.clear();
                      searchText = '';
                    });
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: getFilteredBooks().length,
              itemBuilder: (BuildContext context, int index) {
                Book book = getFilteredBooks()[index];
                return ListTile(
                  title: Text(book.title),
                  subtitle: Text('by ${book.author} - ${book.genre}'),
                  // Add more details or actions here if needed
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

