import 'package:cbdyas_project/model/create_user_credentials.dart';
import 'package:uuid/uuid.dart';

class CbdaysUser {
  CbdaysUser({
    this.uid = '',
    this.email = '',
    this.surName = '',
    this.lastName = '',
    this.surNameFurigana = '',
    this.lastNameFurigana = '',
    this.callNumber = 0,
    this.birthYear = 0,
    this.birthMonth = 0,
    this.birthDay = 0,
    this.fullBirthDay = '',
    this.isSpouce = false,
    this.haveChildren = 0,
  });

  CbdaysUser.toCredentials({required CreateUserCredentials credentials}) {
    uid = Uuid().v4();
    email = credentials.email;
    surName = credentials.surName;
    lastName = credentials.lastName;
    surNameFurigana = credentials.surNameFurigana;
    lastNameFurigana = credentials.lastNameFurigana;
    callNumber = credentials.callNumber;
    birthYear = credentials.birthYear;
    birthMonth = credentials.birthMonth;
    birthDay = credentials.birthDay;
    fullBirthDay = credentials.fullBirthDay;
    isSpouce = credentials.isSpouce;
    haveChildren = credentials.haveChildren;
  }

  late final String uid;
  late final String email;
  late final String surName;
  late final String lastName;
  late final String surNameFurigana;
  late final String lastNameFurigana;
  late final int callNumber;
  late final int birthYear;
  late final int birthMonth;
  late final int birthDay;
  late final String fullBirthDay;
  late final bool isSpouce;
  late final int haveChildren;

  factory CbdaysUser.fromMap(Map<String, dynamic> data) {
    return CbdaysUser(
      uid: data['uid'],
      email: data['email'],
      surName: data['surName'],
      lastName: data['lastName'],
      surNameFurigana: data['surNameFurigana'],
      lastNameFurigana: data['lastNameFurigana'],
      callNumber: data['callNumber'],
      birthYear: data['birthYear'],
      birthMonth: data['birthMonth'],
      birthDay: data['birthDay'],
      fullBirthDay: data['fullBirthDay'],
      isSpouce: data['isSpouce'],
      haveChildren: data['haveChildren'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': this.uid,
      'email': this.email,
      'surName': this.surName,
      'lastName': this.lastName,
      'surNameFurigana': this.surNameFurigana,
      'lastNameFurigana': this.lastNameFurigana,
      'callNumber': this.callNumber,
      'birthYear': this.birthYear,
      'birthMonth': this.birthMonth,
      'birthDay': this.birthDay,
      'fullBirthDay': this.fullBirthDay,
      'isSpouce': this.isSpouce,
      'haveChildren': this.haveChildren,
    };
  }

  void updateWith({
    String? email,
    String? surName,
    String? lastName,
    String? surNameFurigana,
    String? lastNameFurigana,
    int? callNumber,
    int? birthYear,
    int? birthMonth,
    int? birthDay,
    String? fullBirthDay,
    bool? isSpouce,
    int? haveChildren,
  }) {
    this.email = email ?? this.email;
    this.surName = surName ?? this.surName;
    this.lastName = lastName ?? this.lastName;
    this.surNameFurigana = surNameFurigana ?? this.surNameFurigana;
    this.lastNameFurigana = lastNameFurigana ?? this.lastNameFurigana;
    this.callNumber = callNumber ?? this.callNumber;
    this.birthYear = birthYear ?? this.birthYear;
    this.birthMonth = birthMonth ?? this.birthMonth;
    this.birthDay = birthDay ?? this.birthDay;
    this.fullBirthDay = fullBirthDay ?? this.fullBirthDay;
    this.isSpouce = isSpouce ?? this.isSpouce;
    this.haveChildren = haveChildren ?? this.haveChildren;
  }
}
