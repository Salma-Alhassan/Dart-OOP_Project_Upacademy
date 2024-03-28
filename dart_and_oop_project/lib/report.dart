import 'package:dart_and_oop_project/borrow.dart';
import 'package:dart_and_oop_project/Book.dart';

class Report {
  List<Book> books = [];
  List<BorrowProcess> processesOfBorrowing = [];

  void reportAllBooks(List<Book> books) {
    if (books.isNotEmpty) {
      print("The books in our library:");
      for (var element in books) {
        print(
            "the book ${element.title} has ISBN ${element.ISBN} and wrote by the author ${element.author}");
      }
    } else {
      print("No Books in library");
    }
  }

  void reportNotBorrowedBooks(List<Book> books) {
    if (processesOfBorrowing.isNotEmpty) {
      print("The books borrowed:");
      for (Book element in books) {
        if (element.numOfBorrow == 0) {
          print(
              "the book ${element.title} has ISBN ${element.ISBN} wrote by the author ${element.author}");
        }
      }
    } else {
      print("No Books have been borrowed yet!");
    }
  }

  void reportMostPopularBooks(List<Book> books) {
    if (books.isNotEmpty) {
      books.sort((a, b) => b.numOfBorrow.compareTo(a.numOfBorrow));
      print("The most popular books in our library:");
      int cnt = 1;
      for (var element in books) {
        print(
            "the book ${element.title} has ISBN ${element.ISBN} wrote by the author ${element.author} and has been borrowed ${element.numOfBorrow} times");
        cnt++;
        if (cnt == 4) break;
      }
    } else {
      print("No Books");
    }
  }

  void ReportOverDueBooks(){
    if (processesOfBorrowing.isNotEmpty) {
      print("The books not returned yet:");
      for (BorrowProcess element in processesOfBorrowing) {
        if(element.bookHasBeenReturned==false) {
          print(
            "the book ${element.bookBorrowed.title} has ISBN ${element.bookBorrowed.ISBN} borrowed by ${element.userBorrowing.firstName} ${element.userBorrowing.lastName} whose national id is ${element.userBorrowing.nationalId}");
        }
      }
    } else {
      print("No Books borrowed");
    }
  }
}
