import 'dart:async';

import 'package:cbdyas_project/helper/custom_exception.dart';
import 'package:cbdyas_project/model/cbdays_user.dart';
import 'package:cbdyas_project/model/create_user_credentials.dart';
import 'package:cbdyas_project/screens/sign_in_page/register_page/register_model.dart';
import 'package:cbdyas_project/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseAuth {
  Future<void> createUser(
      {required String email,
      required String password,
      required RegisterModel model});

  Future<void> loginUser({required String email, required String password});
}

class Auth implements BaseAuth {
  Auth() {
    _checkLoginStates();
  }

  final database = Database();
  final _auth = FirebaseAuth.instance;

  final _userSubject = BehaviorSubject<CbdaysUser?>.seeded(null);

  StreamSink<CbdaysUser?> get _userLoginState => _userSubject.sink;

  Stream<CbdaysUser?> get userStream => _userSubject.stream;

  CbdaysUser? get currentUser => _userSubject.value!;

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
  Future<void> createUser(
      {required String email,
      required String password,
      required RegisterModel model}) async {
    final _credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    //FIXME - firebase auth だけ保存される場合がある NetWork Error
    await sendEmail();
    final credential = CreateUserCredentials(
        uid: _credential.user!.uid,
        email: email,
        password: password,
        surName: model.surName,
        lastName: model.lastName,
        surNameFurigana: model.surNameFurigana,
        lastNameFurigana: model.lastNameFurigana,
        callNumber: model.callNumber,
        birthYear: model.birthYear,
        birthMonth: model.birthMonth,
        birthDay: model.birthDay,
        fullBirthDay:
            '${model.birthYear}年${model.birthMonth}月${model.birthDay}日',
        isSpouce: model.isSpouce,
        haveChildren: model.haveChildren);
    final CbdaysUser user = CbdaysUser.toCredentials(credentials: credential);
    await database.setUser(user: user);
    _userSubject.sink.add(user);
  }

  @override
  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      final _userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (_userCredential.user == null)
        throw CustomException(
            code: 'ログインエラー', message: '予期せぬエラーが発生しました。時間を空けて再度お試しください。');
      print(_userCredential.user!.uid);
      if (_userCredential.user!.emailVerified == false)
        throw CustomException(
          code: 'メール認証エラー',
          message:
              '初回ログイン時のみ、メールアドレスの認証が必要です登録したメールアドレスに認証用のメールを送信しました、ご確認ください。',
        );
      final user = await database.fetchUser(userId: _userCredential.user!.uid);
      print('login user => ${user == null ? 'null' : user.email}');
      _userSubject.sink.add(user);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> sendEmail({String? email}) async {
    if (_auth.currentUser == null) {
      final ActionCodeSettings actionCodeSettings =
          ActionCodeSettings(url: 'CBDAYS@cbdays-a3ed5.firebaseapp.com');
      if (email == null) return;
      await _auth.sendSignInLinkToEmail(
          email: email, actionCodeSettings: actionCodeSettings);
    }
    await _auth.currentUser!.sendEmailVerification();
  }

  Future<void> logOut({required String uid}) async {
    await _auth.signOut();
    _userLoginState.add(null);
  }
}
