import 'package:dart_and_oop_project/Book.dart';
import 'package:dart_and_oop_project/borrow.dart';
import 'package:dart_and_oop_project/search.dart';
import 'package:dart_and_oop_project/report.dart';
import 'package:dart_and_oop_project/user.dart';

class Library extends Report {
  List<User> users = [];

//! add book
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

//! increase the amount of a book already exists in the library
  void increaseAmount({required int ISBN,required int amount}) {
    for (Book book in books) {
      if (book.ISBN == ISBN) {
        book.amount += amount;
        print("Book ${book.title} is increased by $amount");
        return;
      }
    }
    print("This ISBN does not exist , add the book instead");
    return;
  }

//! remove book

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

//! search book

  Book? search({required Search? objsearch}) {
    // if (objsearch is SearchWithTitle)
    return objsearch!.searchAbook(books);
  }

//! borrow book
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
// //todo add new borrow process
    BorrowProcess newProcess =
        BorrowProcess(user: user, book: book, duration: duration);
    processesOfBorrowing.add(newProcess);
    book.amount--;
    book.numOfBorrow++;
    user.numOfBooksBorrowed++;
    print(
        "process done you must return the book by ${newProcess.returningDate} or you will pay fees");
  }
//! return book

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
// //TODO make sure that user has borrowed this book before
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
