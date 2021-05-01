import 'dart:async';
import 'package:cbdyas_project/helper/custom_exception.dart';
import 'package:cbdyas_project/screens/sign_in_page/login_page/login_form_model.dart';
import 'package:cbdyas_project/service/auth.dart';
import 'package:rxdart/rxdart.dart';

class LoginFormBloc {
  LoginFormBloc({required this.auth});
  final Auth auth;
  final _loginModelSubject =
      BehaviorSubject<LoginFormModel>.seeded(LoginFormModel());
  Stream<LoginFormModel> get modelStream => _loginModelSubject.stream;
  StreamSink<LoginFormModel> get _modelState => _loginModelSubject.sink;
  LoginFormModel get _model => _loginModelSubject.value!;

  void dispose() {
    _loginModelSubject.close();
  }
  Future<void> login() async {
    updateWith(isSubmit: true, isLoading: true);
    if(!_model.isEmailValid && !_model.isPasswordValid) throw CustomException(code: '入力エラー', message: '入力値に誤りがあります。ご確認の上再度お試し下さい。');
    try {
      await auth.loginUser(email: _model.email, password: _model.password);
    }catch(e){
     rethrow;
    }finally{
      updateWith(isSubmit: false, isLoading: false);
    }
  }

  void updateEmail(String email) => updateWith(email: email);
  void updatePassword(String password) => updateWith(password: password);

  void updateWith({
    String? email,
    String? password,
    bool? isSubmit,
    bool? isLoading,
  }) {
    _modelState.add(
      _model.copyWith(
          email: email,
          password: password,
          isSubmited: isSubmit,
          isLoading: isLoading),
    );
  }
}
