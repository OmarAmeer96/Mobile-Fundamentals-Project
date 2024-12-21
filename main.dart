// Create a simple library system that manages borrowed and returned books.
/*
Task 1
Title: Library system
Description : Create a simple library system that manages borrowed and returned books.

Requirements: 
1- Books Class has attributes (id, title, borrowed), and displayInfo method.
2- Userd Class has attributes (id, name), and displayInfo method.
3- Library Class has attributes (list of books, list of users), and methods (addBook, return book, borrowBook, displayInfo).
4- Add books, and users and perform some operations then display the final state.
*/

void main() {
  Library library = Library();

  // Adding books
  library.addBook(Book(1, "Clean Code by Robert C. Martin"));
  library.addBook(Book(2, "The Da Vinci Code by Dan Brown"));
  library.addBook(Book(3, "Interstellar"));

  // Adding users
  library.addUser(User(1, "Omar Ameer"));
  library.addUser(User(2, "Ameer Mohamed"));

  // Borrowing a book
  library.borrowBook(
    bookId: 3,
    userId: 1,
  );

  library.borrowBook(
    bookId: 1,
    userId: 2,
  );

  // Return a book
  library.returnBook(
    bookId: 1,
    userId: 2,
  );

  // Display the final state
  library.displayInfo();
}

// Book class with id, title, borrowed attributes and displayInfo method
class Book {
  int id;
  String title;
  bool borrowed;

  Book(
    this.id,
    this.title, {
    this.borrowed = false,
  });

  void displayInfo() {
    print(
      "Book ID: $id, Title: $title, " +
          (borrowed ? "Borrowed" : "Not Borrowed"),
    );
  }
}

// User class with id, name attributes and displayInfo method
class User {
  int id;
  String name;

  User(
    this.id,
    this.name,
  );

  void displayInfo() {
    print("User ID: $id, Name: $name");
  }
}

// Library class with list of books, list of users attributes and addBook, return book, borrowBook, displayInfo methods
class Library {
  List<Book> books = [];
  List<User> users = [];

  void addBook(Book book) {
    books.add(book);
  }

  void addUser(User user) {
    users.add(user);
  }

  void borrowBook({
    required int bookId,
    required int userId,
  }) {
    Book book = books.firstWhere((book) => book.id == bookId);
    book.borrowed = true;
  }

  void returnBook({
    required int bookId,
    required int userId,
  }) {
    Book book = books.firstWhere((book) => book.id == bookId);
    book.borrowed = false;
  }

  void displayInfo() {
    print("\nTotal Books:------------------------");
    books.forEach((book) => book.displayInfo());
    print("\nTotal Users:------------------------");
    users.forEach((user) => user.displayInfo());
  }
}
