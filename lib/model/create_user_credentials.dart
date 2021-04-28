class CreateUserCredentials {
  CreateUserCredentials({
    required this.email,
    required this.password,
    required this.surName,
    required this.lastName,
    required this.surNameFurigana,
    required this.lastNameFurigana,
    required this.callNumber,
    required this.birthYear,
    required this.birthMonth,
    required this.birthDay,
    required this.fullBirthDay,
    required this.isSpouce,
    required this.haveChildren,
  });
  final String email;
  final String password;
  final String surName;
  final String lastName;
  final String surNameFurigana;
  final String lastNameFurigana;
  final int callNumber;
  final int birthYear;
  final int birthMonth;
  final int birthDay;
  final String fullBirthDay;
  final bool isSpouce;
  final haveChildren;
}