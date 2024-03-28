import 'package:dart_and_oop_project/Book.dart';
// import 'package:dart_and_oop_project/library.dart';
import 'package:dart_and_oop_project/user.dart';
// import 'package:dart_and_oop_project/search.dart';

class BorrowProcess {
  DateTime? _borrowingDate;
  DateTime? _returningDate;
  User? _userBorrowing;
  Book? _bookBorrowed;
  Duration? _duration;
  bool? _bookHasBeenReturned;

  set borrowingDate(DateTime date) {
    _borrowingDate = date;
  }

  set returningDate(DateTime date) {
    _returningDate = date;
  }

  set userBorrowing(User user) {
    _userBorrowing = user;
  }

  set bookBorrowed(Book book) {
    if (book.amount>0) {
      _bookBorrowed = book;
    }
  }

  set bookHasBeenReturned(bool bookHasBeenReturned) {
    _bookHasBeenReturned = bookHasBeenReturned;
  }

  set duration(Duration duration) {
    _duration = duration;
  }

  DateTime get borrowingDate => _borrowingDate!;
  DateTime get returningDate => _returningDate!;
  User get userBorrowing => _userBorrowing!;
  Book get bookBorrowed => _bookBorrowed!;
  bool get bookHasBeenReturned => _bookHasBeenReturned!;
  Duration get duration => _duration!;

//TODO constructor
  BorrowProcess(
      {DateTime? date,
      DateTime? date2,
      required User user,
      required Book book,
      required Duration duration}) {
    _bookBorrowed = book;
    _userBorrowing = user;
    _bookHasBeenReturned = false;
    _duration = duration;
    _borrowingDate = DateTime.now();
    _returningDate = DateTime.now().add(duration);
  }

}
