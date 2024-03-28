import 'package:dart_and_oop_project/Book.dart';

class Search {
  Book? searchAbook(List<Book> books) {
    return null;
  }
}
//!Search With Title
class SearchWithTitle extends Search {
  String? title;

  SearchWithTitle(this.title);
  @override
  Book? searchAbook(List<Book> books) {
    for (Book book in books) {
      if (book.title == title) {
        print("book is found");
        return book;
      }
    }
    print("Book is not found");
    return null;
  }
}
//!Search With Author
//TODO one auther -> multiple books
class SearchWithAuthor extends Search {
  String? author;

  SearchWithAuthor(this.author);
  @override
  Book? searchAbook(List<Book> books) {
    for (Book book in books) {
      if (book.author == author) {
        print("book is found");
        return book;
      }
    }
    print("Book is not found");
    return null;
  }
}
//!Search With Isbn
class SearchWithIsbn extends Search {
  int? ISBN;

  SearchWithIsbn(this.ISBN);
  @override
  Book? searchAbook(List<Book> books) {
    for (Book book in books) {
      if (book.ISBN == ISBN) {
        print("book is found");
        return book;
      }
    }
    print("Book is not found");
    return null;
  }
}
