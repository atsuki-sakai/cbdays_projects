import 'dart:async';

import 'package:cbdyas_project/constants/custom_exception.dart';
import 'package:cbdyas_project/model/cbdays_user.dart';
import 'package:cbdyas_project/model/create_user_credentials.dart';
import 'package:cbdyas_project/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseAuth {
  Future<void> createUser({required CreateUserCredentials credentials});
  Future<void> loginUser({required String email,required String password});
}

class Auth implements BaseAuth {

  Auth() {
    _checkLoginStates();
  }

  final database = Database();
  final _auth = FirebaseAuth.instance;

  final _userSubject = BehaviorSubject<CbdaysUser?>.seeded(CbdaysUser());
  StreamSink<CbdaysUser?> get _userLoginState => _userSubject.sink;
  Stream<CbdaysUser?> get userStream => _userSubject.stream;
  CbdaysUser? get _currentUser => _userSubject.value!;

  void dispose() {
    _userSubject.close();
  }

  Future<void> _checkLoginStates() async {
    if (_auth.currentUser != null) {
      final user = await database.fetchUser(userId: _auth.currentUser!.uid);
      _userLoginState.add(user);
    } else {
      _userLoginState.add(null);
    }
  }
  
  @override
  Future<void> createUser({required CreateUserCredentials credentials}) async {
    await _auth.createUserWithEmailAndPassword(
        email: credentials.email,
        password: credentials.password);
    await sendEmail();
    final CbdaysUser user = CbdaysUser.toCredentials(credentials: credentials);
    await database.setUser(user: user);
    _userSubject.sink.add(user);
  }

  @override
  Future<void> loginUser({required String email,required String password}) async {
    try {
      final _userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if(_userCredential.user == null) throw CustomException(code: 'ログインエラー', message: '予期せぬエラーが発生しました。時間を空けて再度お試しください。');
      if (!_userCredential.user!.emailVerified) throw CustomException(code: 'メール認証エラー', message: '初回ログイン時のみ、メールアドレスの認証が必要です登録したメールアドレスに認証用のメールを送信しました、ご確認ください。',);
      final user = await database.fetchUser(userId: _userCredential.user!.uid);
      _userSubject.sink.add(user);
    }catch(e){
      rethrow;
    }
  }

  Future<void> sendEmail() async {
    if (_auth.currentUser == null) return;
    await _auth.currentUser!.sendEmailVerification();
  }

  Future<void> logOut({required String uid}) async {
    await _auth.signOut();
    _userLoginState.add(null);
  }
}
