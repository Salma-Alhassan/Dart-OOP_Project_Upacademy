bool loged = false;

class User {
  String? _firstName;
  String? _lastName;
  int? _age;
  String? _nationalId;
  String? _password;
  int? _numOfBooksBorrowed;

  set firstName(firstName) {
    if (firstName.isNotEmpty()) {
      _firstName = firstName;
    } else {
      print("enter valid data,please");
    }
  }

  set lastName(String lastName) {
    if (lastName.isNotEmpty) {
      _lastName = lastName;
    } else {
      print("enter valid data,please");
    }
  }

  set age(int? age) {
    if (age! > 10 && age < 100) {
      _age = age;
    } else {
      print("enter valid data,please");
    }
  }

  set nationalId(String? nationalId) {
    if (nationalId!.length == 14) {
      _nationalId = nationalId;
    } else {
      print("enter valid data,please");
    }
  }

  set password(String? password) {
    if (password!.length >= 4) {
      _password = password;
    } else {
      print("enter valid data,please");
    }
  }

  set numOfBooksBorrowed(int? numOfBooksBorrowed) {
    _numOfBooksBorrowed = numOfBooksBorrowed;
  }

//TODO constructor

  User(
      {String? firstName,
      String? lastName,
      int? age,
      required String nationalId,
      required String password}) {
    _firstName = firstName;
    _lastName = lastName;
    _age = age;

    if (nationalId.length == 14) {
      _nationalId = nationalId;
    } else {
      print("enter valid data,please");
    }
    if (password.length >= 4) {
      _password = password;
    } else {
      print("enter valid data,please");
    }
    numOfBooksBorrowed = 0;
  }

  String get firstName => _firstName!;

  String get lastName => _lastName!;

  int get age => _age!;

  String get nationalId => _nationalId!;

  String get password => _password!;

  int get numOfBooksBorrowed => _numOfBooksBorrowed!;

  User? login(
      {required List<User> users, String? nationalId, String? password}) {
    for (User person in users) {
      if (person._nationalId == nationalId && person._password == password) {
        print("Login succeded");
        print("Welcome ${person._firstName} ${person._lastName}");
        loged = true;
        return person;
      }
    }
    print("Login again or sign up if you don't have an account");
    return null;
  }

  void signUp({required List<User> users, User? user}) {
    if (_firstName != null &&
        _lastName != null &&
        _age != null &&
        _age! > 0 &&
        _age! <= 100 &&
        _nationalId != null &&
        _password != null) {
      users.add(user!);
      print("sign up succedded");
    } else {
      print("sign up failed");
    }
  }

  void forgetPassword(
      {required List<User> users,
      required String nationaId,
      required String newPassword,
      required String confirmNewPassword}) {
    for (User user in users) {
      if (user._nationalId == nationaId) {
        if (newPassword == confirmNewPassword && newPassword.length >= 4) {
          user._password = newPassword;
          print("password changed");
        } else {
          print("enter valid password with at least 4 characters 2 times");
        }
      }
    }
  }

  void removeUser({required List<User> users, required String nationalId}) {
    for (User user in users) {
      if (user._nationalId == nationalId) {
        users.remove(user);
        print("user ${user._firstName} ${user._lastName} is deleted");
        return;
      }
    }
    print("This user does not exist");
    return;
// users.removeWhere((user) => user.nationalId == nationaId);
  }
}
