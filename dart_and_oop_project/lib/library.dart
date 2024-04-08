import 'package:dart_and_oop_project/Book.dart';
import 'package:dart_and_oop_project/borrow.dart';
import 'package:dart_and_oop_project/search.dart';
import 'package:dart_and_oop_project/report.dart';
import 'package:dart_and_oop_project/user.dart';

class Library extends Report {
  List<User> users = [];

  void addBook(
      {required String title,
      required String author,
      required int ISBN,
      required int amount,
      required bool hasRestrictions}) {
    Book book = Book(
        title: title,
        author: author,
        ISBN: ISBN,
        hasRestrictions: hasRestrictions);
    if (book.title.isNotEmpty &&
        book.author.isNotEmpty &&
        book.ISBN != -1 &&
        amount > 0) {
      books.add(book);
      book.amount = amount;
      book.numOfBorrow = 0;
      print(
          "The book ${book.title} is added successfuly to the library with amount $amount");
    } else {
      print("the book has not been added to library");
    }
  }

  void removeBook({required int ISBN}) {
    for (Book book in books) {
      if (book.ISBN == ISBN) {
        books.remove(book);
        print("Book ${book.title} is deleted");
        return;
      }
    }
    print("This ISBN does not exist");
    return;
// books.removeWhere((book) => book.ISBN == ISBN);
  }

  Book? search({required Search? objsearch}) {
    if (objsearch is SearchWithTitle) {
      return objsearch.searchAbook(books);
    } else if (objsearch is SearchWithAuthor) {
      return objsearch.searchAbook(books);
    } else if (objsearch is SearchWithIsbn) {
      return objsearch.searchAbook(books);
    }
    return null;
  }

  void borrowAbook(
      {required String nationalId,
      required String password,
      required int ISBN,
      required Duration duration}) {
    // //TODO make sure that user loged in
    User? user = User(nationalId: nationalId, password: password);
    user = user.login(users: users, nationalId: nationalId, password: password);
    if (user == null) {
      print("You are not able to borrow a book");
      return;
    } else if (user.numOfBooksBorrowed == 5) {
      print("You are not able to borrow a book as you already borrowed 5");
      return;
    }

    //TODO make sure that book exists and available
    Book? book = search(objsearch: SearchWithIsbn(ISBN));
    if (book == null) {
      print("There is NO Book with this ISBN");
      return;
    }
    if (book.amount < 1) {
      print("Sorry, This book is not available now");
      return;
    }
    if (book.hasRestrictions == true) {
      print("Sorry, This book is just for reading in the library");
      return;
    }
    BorrowProcess newProcess =
        BorrowProcess(user: user, book: book, duration: duration);
    processesOfBorrowing.add(newProcess);
    book.amount--;
    book.numOfBorrow++;
    user.numOfBooksBorrowed++;
    print(
        "process done you must return the book by ${newProcess.returningDate} or you will pay fees");
  }

  void returnBook({
    required String nationalId,
    required String password,
    required int ISBN,
  }) {
    bool flag = false;
// //TODO make sure that user loged in
    User? user = User(nationalId: nationalId, password: password);
    user = user.login(users: users, nationalId: nationalId, password: password);
    if (user == null) {
      print("You are not able to borrow a book");
      return;
    }
    if (processesOfBorrowing.isNotEmpty) {
      for (BorrowProcess oldProcess in processesOfBorrowing) {
        if (oldProcess.bookBorrowed.ISBN == ISBN &&
            oldProcess.bookHasBeenReturned == false &&
            oldProcess.userBorrowing.nationalId == nationalId) {
          if (oldProcess.returningDate.compareTo(DateTime.now()) == -1) {
            int days =
                (oldProcess.returningDate).difference(DateTime.now()).inDays;
            double fees = 10.0 * days;
            print(
                "You are late with $days days and you have to pay fees : $fees pounds");
            flag = true;
          } else {
            print("Thank you and we wish you liked this book");
            flag = true;
          }
          oldProcess.bookBorrowed.amount++;
          oldProcess.bookHasBeenReturned = true;
          oldProcess.userBorrowing.numOfBooksBorrowed--;
        }
      }
    }
    if (flag == false) {
      print("This user has not borrowed this book");
    }
  }
}
