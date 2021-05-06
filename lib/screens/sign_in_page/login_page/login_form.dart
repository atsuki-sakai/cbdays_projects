import 'package:cbdyas_project/components/mobile_desctop_view.dart';
import 'package:cbdyas_project/helper/custom_exception.dart';
import 'package:cbdyas_project/helper/validators.dart';
import 'package:cbdyas_project/model/routes.dart';
import 'package:cbdyas_project/screens/sign_in_page/login_page/login_form_bloc.dart';
import 'package:cbdyas_project/screens/sign_in_page/login_page/login_form_model.dart';
import 'package:cbdyas_project/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// FIXME - 他画面対応する

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key, required this.auth})
      : super(key: key);
  final Auth auth;
  @override
  Widget build(BuildContext context) {
    return MobileDesktopView(
        mobileView: MobileLoginForm.create(context, auth: auth),
        tableView: DeskTopLoginForm.create(context, auth: auth),
        desktopView: DeskTopLoginForm.create(context, auth: auth),
    );
  }
}

class DeskTopLoginForm extends StatefulWidget {
  const DeskTopLoginForm({Key? key, required this.auth, required this.bloc})
      : super(key: key);
  final Auth auth;
  final LoginFormBloc bloc;

  static Widget create(BuildContext context, {required Auth auth}) {
    return Provider<LoginFormBloc>(
      create: (_) => LoginFormBloc(auth: auth),
      dispose: (_, bloc) => bloc.dispose(),
      child: Consumer<LoginFormBloc>(builder: (_, bloc, __) {
        return DeskTopLoginForm(auth: auth, bloc: bloc);
      }),
    );
  }

  @override
  _DeskTopLoginFormState createState() => _DeskTopLoginFormState();
}

class _DeskTopLoginFormState extends State<DeskTopLoginForm>
    with InputFormValidators {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  Future<void> _login() async {
    try {
      await widget.bloc.login();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login success!!'),
        duration: Duration(seconds: 2),
      ));
      Navigator.pop(context);
    } on CustomException catch (e) {
      print(e.message);
      // FIXME - エラーハンドを日本語化 showAlertを呼ぶとエラーになるので、原因追求する
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text(
                  e.code,
                  style: GoogleFonts.notoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent.shade400),
                ),
                content: Text(
                  e.message,
                  style: GoogleFonts.notoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade500),
                ),
                actions: [
                  TextButton(
                      child: Text('OK',
                          style: GoogleFonts.notoSans(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      onPressed: () => Navigator.pop(context))
                ]);
          });
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text(
                  '入力エラー',
                  style: GoogleFonts.notoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent.shade400),
                ),
                content: Text(
                  '入力値が正しくありません。確認の上再度お試し下さい。',
                  style: GoogleFonts.notoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade500),
                ),
                actions: [
                  TextButton(
                      child: Text('OK',
                          style: GoogleFonts.notoSans(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      onPressed: () => Navigator.pop(context))
                ]);
          });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LoginFormModel>(
        stream: widget.bloc.modelStream,
        builder: (context, snapshot) {
          final model = snapshot.data;
          if (model == null) return Center(child: CircularProgressIndicator());
          return Column(
            children: [
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'メールアドレスとパスワード',
                        style: GoogleFonts.notoSans(
                            fontSize: 18.0, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 12,),
                          Icon(
                            Icons.email_outlined,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(child: _buildEmailTextField(model: model)),
                          SizedBox(width: 12,),
                          Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(child: _buildPasswordTextField(model: model)),
                          SizedBox(width: 12,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 44,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async => await _login(),
                  child: Text(
                    'ログイン',
                    style: GoogleFonts.sawarabiGothic(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                ),
              ),
              SizedBox(height: 32,),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.registerPage);
                  },
                  child: Text(
                    'アカウントをお持ちで無い方はこちらへ。',
                    style: GoogleFonts.montserrat(
                        color: Colors.blue, fontSize: 16),
                  )),
            ],
          );
        });
  }

  TextField _buildPasswordTextField({required LoginFormModel model}) {
    bool isPasswordValid = model.password.isEmpty && model.isSubmited == true;
    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      obscureText: true,
      onChanged: widget.bloc.updatePassword,
      onEditingComplete: () => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        hintText: '(７文字以上、１６文字未満)',
        labelText: 'パスワード',
        errorText: isPasswordValid ? passwordErrorText : null,
      ),
    );
  }

  TextField _buildEmailTextField({required LoginFormModel model}) {
    bool isEmailValid = model.email.isEmpty && model.isSubmited == true;
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      onChanged: widget.bloc.updateEmail,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_passwordFocusNode),
      decoration: InputDecoration(
        hintText: 'sample@email.com',
        labelText: 'メールアドレス',
        errorText: isEmailValid ? emailErrorText : null,
      ),
    );
  }
}

class MobileLoginForm extends StatefulWidget {
  const MobileLoginForm({Key? key, required this.auth, required this.bloc})
      : super(key: key);
  final Auth auth;
  final LoginFormBloc bloc;

  static Widget create(BuildContext context, {required Auth auth}) {
    return Provider<LoginFormBloc>(
      create: (_) => LoginFormBloc(auth: auth),
      dispose: (_, bloc) => bloc.dispose(),
      child: Consumer<LoginFormBloc>(builder: (_, bloc, __) {
        return MobileLoginForm(auth: auth, bloc: bloc);
      }),
    );
  }

  @override
  _MobileLoginFormState createState() => _MobileLoginFormState();
}

class _MobileLoginFormState extends State<MobileLoginForm>
    with InputFormValidators {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  Future<void> _login() async {
    try {
      await widget.bloc.login();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login success!!'),
        duration: Duration(seconds: 3),
      ));
      Navigator.pop(context);
    } on CustomException catch (e) {
      print(e.message);
      // FIXME - エラーハンドを日本語化 showAlertを呼ぶとエラーになるので、原因追求する
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text(
                  e.code,
                  style: GoogleFonts.notoSans(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent.shade400),
                ),
                content: Text(
                  e.message,
                  style: GoogleFonts.notoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade500),
                ),
                actions: [
                  TextButton(
                      child: Text('OK',
                          style: GoogleFonts.notoSans(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      onPressed: () => Navigator.pop(context))
                ]);
          });
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text(
                  '入力エラー',
                  style: GoogleFonts.notoSans(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent.shade400),
                ),
                content: Text(
                  '入力値が正しくありません。確認の上再度お試し下さい。',
                  style: GoogleFonts.notoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade500),
                ),
                actions: [
                  TextButton(
                      child: Text('OK',
                          style: GoogleFonts.notoSans(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      onPressed: () => Navigator.pop(context))
                ]);
          });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LoginFormModel>(
        stream: widget.bloc.modelStream,
        builder: (context, snapshot) {
          final model = snapshot.data;
          if (model == null) return Center(child: CircularProgressIndicator());
          return Column(
            children: [
              Card(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'メールアドレスとパスワード',
                        style: GoogleFonts.notoSans(
                            fontSize: 14.0, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 12,),
                          Icon(
                            Icons.email_outlined,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Expanded(
                            child: _buildEmailTextField(model: model),
                          ),
                          SizedBox(width: 12,),
                        ],
                      ),
                      Row(children: [
                        SizedBox(width: 12,),
                        Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: _buildPasswordTextField(model: model),
                        ),
                        SizedBox(width: 12,),
                      ],),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async => await _login(),
                  child: Text(
                    'ログイン',
                    style: GoogleFonts.sawarabiGothic(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.registerPage);
                  },
                  child: Text(
                    'アカウントをお持ちで無い方はこちらへ。',
                    style: GoogleFonts.montserrat(
                        color: Colors.blue, fontSize: 15),
                  )),
            ],
          );
        });
  }

  TextField _buildPasswordTextField({required LoginFormModel model}) {
    bool isPasswordValid = model.password.isEmpty && model.isSubmited == true;
    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      obscureText: true,
      onChanged: widget.bloc.updatePassword,
      onEditingComplete: () => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        hintText: '(７文字以上、１６文字未満)',
        labelText: 'パスワード',
        errorText: isPasswordValid ? passwordErrorText : null,
      ),
    );
  }

  TextField _buildEmailTextField({required LoginFormModel model}) {
    bool isEmailValid = model.email.isEmpty && model.isSubmited == true;
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      onChanged: widget.bloc.updateEmail,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(_passwordFocusNode),
      decoration: InputDecoration(
        hintText: 'sample@email.com',
        labelText: 'メールアドレス',
        errorText: isEmailValid ? emailErrorText : null,
      ),
    );
  }
}
