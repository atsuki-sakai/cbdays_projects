import 'dart:async';
import 'package:cbdyas_project/helper/custom_exception.dart';
import 'package:cbdyas_project/screens/sign_in_page/register_page/register_model.dart';
import 'package:cbdyas_project/service/auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class RegisterBloc {
  RegisterBloc({required this.auth});

  final Auth auth;
  final _registerModelSubject =
      BehaviorSubject<RegisterModel>.seeded(RegisterModel());
  Stream<RegisterModel> get modelStream => _registerModelSubject.stream;
  StreamSink<RegisterModel> get _modelState => _registerModelSubject.sink;
  RegisterModel get _model => _registerModelSubject.value!;
  
  void dispose() {
    _registerModelSubject.close();
  }

  Future<void> submit() async {
    updateWith(isLoading: true,isSubmited: true);
    try {
      if(!_model.registerModelValid()) throw CustomException(code: '入力エラー', message: '入力値に正しい形式で入力されていない可能性があります。');
      if(!_model.passwordCheck) throw CustomException(code: 'パスワードエラー', message: 'パスワードが一致していません。');
      await auth.createUser(email: _model.email, password: _model.password, model: _model);
    } catch (e) {
      rethrow;
    }finally{
      updateWith(isLoading: false);
    }
  }

  void updateEmail(String email) => updateWith(email: email);
  void updatePassword(String password) => updateWith(password: password);
  void updateConfirmPassword(String password) => updateWith(confirmPassword: password);
  void updateSurName(String surName) => updateWith(surName: surName);
  void updateLastName(String lastName) => updateWith(lastName: lastName);
  void updateSurNameFurigana(String surNameF) => updateWith(surNameFurigana: surNameF);
  void updateLastNameFurigana(String lastNameF) => updateWith(lastNameFurigana: lastNameF);
  void updateCallNumber(String callNumber) => checkStrToNum(callNumber) ? updateWith(callNumber: callNumber, callNumberTypeError: false) : updateWith(callNumber: callNumber, callNumberTypeError: true);
  void updateBirthYear(String year) => checkStrToNum(year) ? updateWith(birthYear: year, birthYearTypeError: false) : updateWith(birthYear: year, birthYearTypeError: true);
  void updateBirthMonth(String month) => checkStrToNum(month) ? updateWith(birthMonth: month, birthMonthTypeError: false) : updateWith(birthMonth: month, birthMonthTypeError: true);
  void updateBirthDay(String day) => checkStrToNum(day) ? updateWith(birthDay: day, birthDayTypeError: false) : updateWith(birthDay: day, birthDayTypeError: true);
  void updateHaveChildren(String childCount) => updateWith(haveChildren: childCount);
  void updateIsSpouce(bool isSpouce) => updateWith(isSpouce: isSpouce);

  bool checkStrToNum(String value) {
    if(num.tryParse(value) != null){
      return true;
    }else{
      return false;
    }
  }
  
  void updateWith({
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
    _modelState.add(_model.copyWith(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      surName: surName,
      lastName: lastName,
      surNameFurigana: surNameFurigana,
      lastNameFurigana: lastNameFurigana,
      callNumber: callNumber,
      birthYear: birthYear,
      birthMonth: birthMonth,
      birthDay: birthDay,
      isSpouce: isSpouce,
      haveChildren: haveChildren,
      isLoading: isLoading,
      isSubmited: isSubmited,
      birthYearTypeError: birthYearTypeError,
      birthMonthTypeError: birthMonthTypeError,
      birthDayTypeError: birthDayTypeError,
      haveChildrenTypeError: haveChildrenTypeError,
    ));
  }
}
