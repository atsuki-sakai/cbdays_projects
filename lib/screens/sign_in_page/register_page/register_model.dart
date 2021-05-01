import 'package:cbdyas_project/screens/sign_in_page/register_page/register_form.dart';

class RegisterModel {
  RegisterModel({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.surName = '',
    this.surNameFurigana = '',
    this.lastName = '',
    this.lastNameFurigana = '',
    this.callNumber = '',
    this.birthYear = '',
    this.birthMonth = '',
    this.birthDay = '',
    this.isSpouce = false,
    this.haveChildren = '',
    this.isSubmited = false,
    this.isLoading = false,
    this.callNumberTypeError = false,
    this.birthYearTypeError = false,
    this.birthMonthTypeError = false,
    this.birthDayTypeError = false,
    this.haveChildrenTypeError = false,
  });

  String email;
  String password;
  String confirmPassword;
  String surName;
  String surNameFurigana;
  String lastName;
  String lastNameFurigana;
  String callNumber;
  String birthYear;
  String birthMonth;
  String birthDay;
  bool isSpouce;
  String haveChildren;
  bool isSubmited;
  bool isLoading;

  // 数字が入力されているか判別する
  bool callNumberTypeError;
  bool birthYearTypeError;
  bool birthMonthTypeError;
  bool birthDayTypeError;
  bool haveChildrenTypeError;

  bool get passwordCheck => password == confirmPassword;

  bool get passwordValid =>
      isSubmited == true &&
      (password.isEmpty || password.length < 7 || password.length > 16);

  bool get confirmPasswordValid =>
      isSubmited == true &&
      (confirmPassword.isEmpty ||
          confirmPassword.length < 7 ||
          confirmPassword.length > 16);

  bool get emailValid =>
      isSubmited == true &&
      (email.isEmpty || !email.contains('@') || email.length > 30);

  bool get surNameValid =>
      isSubmited == true && (surName.isEmpty || surName.length > 20);

  bool get lastNameValid =>
      isSubmited == true && (lastName.isEmpty || lastName.length > 20);

  bool get surNameFuriganaValid =>
      isSubmited == true &&
      (surNameFurigana.isEmpty || surNameFurigana.length > 20);

  bool get lastNameFuriganaValid =>
      isSubmited == true &&
      (lastNameFurigana.isEmpty || lastNameFurigana.length > 20);

  bool get callNumberValid =>
      isSubmited == true &&
      (callNumber.isEmpty ||
          callNumber.length > 12 ||
          int.tryParse(callNumber) == null ||
          callNumberTypeError == true);

  bool get birthYearValid =>
      isSubmited == true &&
      (birthYear.length > 4 ||
          birthYear.length < 0 ||
          int.tryParse(birthYear) == null ||
          birthYearTypeError == true);

  bool get birthMonthValid =>
      isSubmited == true &&
      (birthMonth.length > 2 ||
          birthMonth.length < 0 ||
          int.tryParse(birthMonth) == null ||
          birthMonthTypeError == true);

  bool get birthDayValid =>
      isSubmited == true &&
      (birthDay.length > 2 ||
          birthDay.length < 0 ||
          int.tryParse(birthDay) == null ||
          birthDayTypeError == true);

  bool get haveChildValid =>
      isSubmited == true &&
      isSpouce == true &&
      (haveChildren.isEmpty ||
          haveChildren.length > 15 ||
          int.tryParse(haveChildren) == null);



  bool registerModelValid() {
    if ((email.isEmpty || !email.contains('@') || email.length > 30) &&
        (password.isEmpty || password.length < 7 || password.length > 16) &&
        (confirmPassword.isEmpty ||
            confirmPassword.length < 7 ||
            confirmPassword.length > 16) &&
        (surName.isEmpty || surName.length > 20) &&
        (lastName.isEmpty || lastName.length > 209) &&
        (surNameFurigana.isEmpty || surNameFurigana.length > 20) &&
        (lastNameFurigana.isEmpty || lastNameFurigana.length > 20) &&
        (callNumber.length < 0 ||
            callNumber.length > 12 ||
            int.tryParse(callNumber) == null ||
            callNumberTypeError == true) &&
        (birthYear.length > 4 ||
            birthYear.length < 0 ||
            int.tryParse(birthYear) == null ||
            birthYearTypeError == true) &&
        (birthMonth.length > 2 ||
            birthMonth.length < 0 ||
            int.tryParse(birthMonth) == null ||
            birthMonthTypeError == true) &&
        (birthDay.length > 2 ||
            birthDay.length < 0 ||
            int.tryParse(birthDay) == null ||
            birthDayTypeError == true) &&
         (isSpouce == true &&
            (haveChildren == '' ||
                haveChildren.length > 15 ||
                int.tryParse(haveChildren) == null))
    ) {
      print('false');
      return false;
    } else {
      print('true');
      return true;
    }
  }

  RegisterModel copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    String? surName,
    String? surNameFurigana,
    String? lastName,
    String? lastNameFurigana,
    String? callNumber,
    String? birthYear,
    String? birthMonth,
    String? birthDay,
    bool? isSpouce,
    String? haveChildren,
    bool? isLoading,
    bool? isSubmited,
    bool? callNumberTypeError,
    bool? birthYearTypeError,
    bool? birthMonthTypeError,
    bool? birthDayTypeError,
    bool? haveChildrenTypeError,
  }) {
    return RegisterModel(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      surName: surName ?? this.surName,
      lastName: lastName ?? this.lastName,
      surNameFurigana: surNameFurigana ?? this.surNameFurigana,
      lastNameFurigana: lastNameFurigana ?? this.lastNameFurigana,
      callNumber: callNumber ?? this.callNumber,
      birthYear: birthYear ?? this.birthYear,
      birthMonth: birthMonth ?? this.birthMonth,
      birthDay: birthDay ?? this.birthDay,
      isSpouce: isSpouce ?? this.isSpouce,
      haveChildren: haveChildren ?? this.haveChildren,
      isLoading: isLoading ?? this.isLoading,
      isSubmited: isSubmited ?? this.isSubmited,
      birthYearTypeError: birthYearTypeError ?? this.birthYearTypeError,
      birthMonthTypeError: birthMonthTypeError ?? this.birthMonthTypeError,
      birthDayTypeError: birthDayTypeError ?? this.birthDayTypeError,
      haveChildrenTypeError:
          haveChildrenTypeError ?? this.haveChildrenTypeError,
    );
  }
}
