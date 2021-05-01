import 'package:cbdyas_project/model/create_user_credentials.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CbdaysUser {
  CbdaysUser({
    this.uid = '',
    this.email = '',
    this.surName = '',
    this.lastName = '',
    this.surNameFurigana = '',
    this.lastNameFurigana = '',
    this.callNumber = '',
    this.birthYear = '',
    this.birthMonth = '',
    this.birthDay = '',
    this.fullBirthDay = '',
    this.isSpouce = false,
    this.haveChildren = '',
    this.createdAt,
  });

  CbdaysUser.toCredentials({required CreateUserCredentials credentials}) {
    uid = credentials.uid;
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
    createdAt = FieldValue.serverTimestamp();
  }

  late final String uid;
  late final String email;
  late final String surName;
  late final String lastName;
  late final String surNameFurigana;
  late final String lastNameFurigana;
  late final String callNumber;
  late final String birthYear;
  late final String birthMonth;
  late final String birthDay;
  late final String fullBirthDay;
  late final bool isSpouce;
  late final String haveChildren;
  late final FieldValue? createdAt;

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
      createdAt: data['createdAd']
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
      'createAd' : this.createdAt,
    };
  }

  void updateWith({
    String? email,
    String? surName,
    String? lastName,
    String? surNameFurigana,
    String? lastNameFurigana,
    String? callNumber,
    String? birthYear,
    String? birthMonth,
    String? birthDay,
    String? fullBirthDay,
    bool? isSpouce,
    String? haveChildren,
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
