
import 'package:cbdyas_project/components/mobile_desctop_view.dart';
import 'package:cbdyas_project/components/validators.dart';
import 'package:cbdyas_project/screens/sign_in_page/login_page/login_form_bloc.dart';
import 'package:cbdyas_project/screens/sign_in_page/login_page/login_form_model.dart';
import 'package:cbdyas_project/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key, required this.auth, required this.bloc})
      : super(key: key);
  final Auth auth;
  final LoginFormBloc bloc;

  static Widget create(BuildContext context, {required Auth auth}) {
    return Provider<LoginFormBloc>(
      create: (_) => LoginFormBloc(auth: auth),
      dispose: (_, bloc) => bloc.dispose(),
      child: Consumer<LoginFormBloc>(builder: (_, bloc, __) {
        return LoginForm(auth: auth, bloc: bloc);
      }),
    );
  }

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with InputFormValidators {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  Future<void> _login() async {
    try {
      await widget.bloc.login();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login success!!')));
      Navigator.pop(context);
    }catch(e) {
      // FIXME - エラーハンドを日本語化 showAlertを呼ぶとエラーになるので、原因追求する
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('入力エラー',style: GoogleFonts.notoSans(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.redAccent.shade400),),
          content: Text('入力値が正しくありません。確認の上再度お試し下さい。',style: GoogleFonts.notoSans(fontSize: 18, fontWeight: FontWeight.w300,color: Colors.grey.shade500),),
          actions: [
            TextButton(
              child: Text('OK', style: GoogleFonts.notoSans(fontSize: 22, fontWeight: FontWeight.bold)),
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
        if(model == null) return Center(child: CircularProgressIndicator());
        return Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                child: Column(
                  children: [
                    Text(
                      'メールアドレスとパスワード',
                      style: GoogleFonts.notoSans(
                          fontSize: 20.0, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 42,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SizedBox(
                          width: 300,
                          child: _buildEmailTextField(model: model),
                        ),
                        Spacer(),
                        Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SizedBox(
                          width: 300,
                          child: _buildPasswordTextField(model: model),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 64,
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () async => await _login(),
                child: Text(
                  'ログイン',
                  style: GoogleFonts.sawarabiGothic(
                      fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 2),
                ),
              ),
            ),
          ],
        );
      }
    );
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
