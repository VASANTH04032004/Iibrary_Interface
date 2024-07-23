import 'package:flutter/material.dart';
import 'account_screen.dart';
import 'borrowed_books_screen.dart';
import 'catalog_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Library System',
            textAlign: TextAlign.center,
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Catalog'),
              Tab(text: 'Borrowed Books'),
              Tab(text: 'Account'),
            ],
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontSize: 14.0),
          ),
        ),
        body: TabBarView(
          children: [
            CatalogScreen(),
            BorrowedBooksScreen(),
            AccountScreen(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>HomeScreen()
                      )
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>BorrowedBooksScreen()
                      )
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>AccountScreen()
                      )
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
