import 'dart:async';
import 'package:cbdyas_project/constants/custom_exception.dart';
import 'package:cbdyas_project/model/create_user_credentials.dart';
import 'package:cbdyas_project/screens/sign_in_page/register_page/register_form.dart';
import 'package:cbdyas_project/screens/sign_in_page/register_page/register_model.dart';
import 'package:cbdyas_project/service/auth.dart';
import 'package:rxdart/rxdart.dart';

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

  void toggleFormType() {
    if(_model.formType == EmailSignInFormType.signIn){
      updateWith(formType: EmailSignInFormType.register);
    }else{
      updateWith(formType: EmailSignInFormType.signIn);
    }
  }

  Future<void> submit() async {
    updateWith(isLoading: true,isSubmited: true);
    CreateUserCredentials credentials = CreateUserCredentials(
        email: _model.email,
        password: _model.password,
        surName: _model.surName,
        lastName: _model.lastName,
        surNameFurigana: _model.surNameFurigana,
        lastNameFurigana: _model.lastNameFurigana,
        callNumber: int.parse(_model.callNumber),
        birthYear: int.parse(_model.callNumber),
        birthMonth: int.parse(_model.birthMonth),
        birthDay: int.parse(_model.birthDay),
        fullBirthDay:
            '${_model.birthYear}年${_model.birthMonth}月${_model.birthDay}',
        isSpouce: _model.isSpouce,
        haveChildren: _model.haveChildren);
    try {
      if(!_model.checkInputForm()) throw CustomException(code: '入力エラー', message: '入力値に誤りがあります。ご確認の上再度お試し下さい.');
      if(!_model.passwordCheck) throw CustomException(code: 'パスワードエラー', message: 'パスワードが一致していません。');
      await auth.createUser(credentials: credentials);
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
  void updateBirthYear(String year) => checkStrToNum(year) ? updateWith(callNumber: year, callNumberTypeError: false) : updateWith(callNumber: year, callNumberTypeError: true);
  void updateBirthMonth(String month) => checkStrToNum(month) ? updateWith(callNumber: month, callNumberTypeError: false) : updateWith(callNumber: month, callNumberTypeError: true);
  void updateBirthDay(String day) => checkStrToNum(day) ? updateWith(callNumber: day, callNumberTypeError: false) : updateWith(callNumber: day, callNumberTypeError: true);
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
    EmailSignInFormType? formType,
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
      formType: formType,
      birthYearTypeError: birthYearTypeError,
      birthMonthTypeError: birthMonthTypeError,
      birthDayTypeError: birthDayTypeError,
      haveChildrenTypeError: haveChildrenTypeError,
    ));
  }
}
