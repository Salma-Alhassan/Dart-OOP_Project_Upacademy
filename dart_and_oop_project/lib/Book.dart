//*class1---------------------------------------------------
class Book {
  //TODO attributes
  String? _title;
  String? _author;
  int _ISBN = -1;
  int? _amount;
  int? _numOfBorrow = 0;
  bool? _hasRestrictions;


//TODO set functions
  set title(String title) {
    if (title.isNotEmpty) {
      _title = title;
    } else {
      print("enter valid data,please");
    }
  }

  set author(String author) {
    if (author.isNotEmpty) {
      _author = author;
    } else {
      print("enter valid data,please");
    }
  }

  set ISBN(int ISBN) {
    if (ISBN >= 1) {
      _ISBN = ISBN;
    } else {
      print("enter valid data,please");
    }
  }

  set amount(int amount) {
    _amount = amount;
  }

  set numOfBorrow(int numOfBorrow) {
    _numOfBorrow = numOfBorrow;
  }
  set hasRestrictions(bool hasRestrictions){
    _hasRestrictions=hasRestrictions;
  }

//TODO constructor
  Book({required String title, required String author, required int ISBN,required bool hasRestrictions}) {
    if (title.isNotEmpty) {
      _title = title;
    } else {
      print("enter valid data,please");
    }
    if (author.isNotEmpty) {
      _author = author;
    } else {
      print("enter valid data,please");
    }
    if (ISBN >= 1) {
      _ISBN = ISBN;
    } else {
      print("enter valid data,please");
    }
  }

//TODO get functions
  String get title => _title!;
  String get author => _author!;
  int get ISBN => _ISBN;
  int get amount => _amount!;
  int get numOfBorrow => _numOfBorrow!;
  bool get hasRestrictions => _hasRestrictions!;

}