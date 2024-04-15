import 'package:dart_and_oop_project/library.dart';
// ignore: unused_import
import 'package:dart_and_oop_project/search.dart';
import 'package:dart_and_oop_project/user.dart';

void main() {
  Library library = Library();
//? first object user
  User user = User(
      firstName: "salma",
      lastName: "alhasan",
      age: 20,
      nationalId: "30312011404363",
      password: "1234");
//? SIGN UP
  user.signUp(users: library.users, user: user);
//? FORGET PASSWORD
  // user.forgetPassword(users: library.users, nationaId: "30312011404363", newPassword: "1234", confirmNewPassword: "1234");
//? LOGIN
  // user.login(users: library.users, nationalId: "30312011404363", password: "1234");
//? REMOVE USER
  // user.removeUser(users: library.users, nationalId: "30312011404363");
//? ADD BOOK TO LIBRARY
//   library.addBook(title: "book1", author: "author1", ISBN: 1, amount: 1,hasRestrictions: false);
//   library.addBook(title: "book2", author: "author2", ISBN: 2,amount: 5,hasRestrictions: false);
  // library.addBook(title: "book3", author: "author3", ISBN: 3,amount: 5,hasRestrictions: true);
  // library.addBook(title: "book4", author: "author4", ISBN: 4,amount: 5,hasRestrictions: false);
  // library.addBook(title: "book5", author: "author5", ISBN: 5,amount: 5,hasRestrictions: false);
// //? SEARCH ABOUT BOOK BY ISBN
  // library.search(objsearch: SearchWithIsbn(5));
//? SEARCH ABOUT BOOK BY TITLE
  // library.search(objsearch: SearchWithTitle("book"));
//? SEARCH ABOUT BOOK BY AUTHOR
  // library.search(objsearch: SearchWithAuthor("author1"));

//? REMOVE BOOK BY IT'S ISBN
  // library.removeBook(ISBN: 4);

//? INCREASE THE AMOUNT OF BOOK BY IT'S ISBN
  // library.increaseAmount(ISBN: 4,amount: 2);

//? BORROW A BOOK

  // library.borrowAbook(nationalId: "30312011404363",password: "1234",ISBN: 3,duration:Duration(days: 14));
  // library.borrowAbook(nationalId: "30312011404363",password: "1234",ISBN: 1,duration:Duration(days: 14));
  // library.borrowAbook(nationalId: "30312011404363",password: "1234",ISBN: 4,duration:Duration(days: 14));
  // library.borrowAbook(nationalId: "30312011404363",password: "1234",ISBN: 4,duration:Duration(days: 14));
  // library.borrowAbook(nationalId: "30312011404363",password: "1234",ISBN: 3,duration:Duration(days: 14));
  // library.borrowAbook(nationalId: "30312011404363",password: "1234",ISBN: 3,duration:Duration(days: 14));
  // library.borrowAbook(nationalId: "30312011404363",password: "1234",ISBN: 1,duration:Duration(days: 14));
  // library.borrowAbook(nationalId: "30312011404363",password: "1234",ISBN: 5,duration:Duration(days: 14));

//? RETURN THE BOOK
  // library.returnBook(nationalId: "30312011404363", password: "1234", ISBN: 5);

//? REPORT ABOUT ALL BOOKS IN LIBRARY
  // library.reportAllBooks(library.books);

//? REPORT ABOUT BOOKS BORROWED AND NOT RETURNED BACK YET
  // library.reportOverDueBooks();

//? REPORT OF MOST POPULAR BOOKS  -> THE MOST 3
  // library.reportMostPopularBooks(library.books);

//? REPORT BOOKS HAVE NOT BEEN BORROWED BEFORE
  // library.reportNotBorrowedBooks(library.books);
}
