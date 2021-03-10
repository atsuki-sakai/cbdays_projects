import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  var email = '';
  var password = '';

  void _updateEmail(String email) {
    email = email;
  }

  void _updatePass(String pass) {
    password = pass;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
        alignment: Alignment.center,
        child: Card(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 32.0,
                ),
                Text(
                  'login Page',
                  style: GoogleFonts.notoSans(
                    fontSize: 22.0,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width: 220,
                  child: emailFormField(context),
                ),
                SizedBox(
                  height: 12.0,
                ),
                SizedBox(
                  width: 220,
                  child: passwordFormField(context),
                ),
                SizedBox(
                  height: 32.0,
                ),
                SizedBox(
                  height: 40,
                  width: 80,
                  child: ElevatedButton(
                      onPressed: () {
                        print(email);
                        print(password);
                      },
                      child: Text('Login', style: TextStyle(fontSize: 18.0))),
                ),
                SizedBox(
                  height: 32.0,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    'Create an account??',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text(
                    'Home',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField emailFormField(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'sample@email.com',
      ),
      focusNode: emailFocus,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(passwordFocus);
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'テキストを入力して下さい。';
        }
      },
      onSaved: (value) {
        _updateEmail(value);
      },
    );
  }

  TextFormField passwordFormField(BuildContext context) {
    return TextFormField(
      obscureText: true,
      textInputAction: TextInputAction.next,
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'PassWord',
        hintText: 'pass word',
      ),
      focusNode: passwordFocus,
      onFieldSubmitted: (v) {
        FocusScope.of(context).unfocus();
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'テキストを入力して下さい。';
        }
      },
      onSaved: (value) {
        _updatePass(value);
      },
    );
  }
}
