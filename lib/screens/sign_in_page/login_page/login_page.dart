

import 'package:cbdyas_project/screens/sign_in_page/login_page/login_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({required this.auth});
  final auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 860,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 54),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Login',
                    style: GoogleFonts.montserrat(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        letterSpacing: 0),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'register');
                      },
                      child: Text(
                        'アカウントをお持ちで無い方はこちらへ。',
                        style: GoogleFonts.montserrat(
                            color: Colors.blue, fontSize: 16),
                      )),
                ],
              ),
              SizedBox(
                height: 42,
              ),
              LoginForm.create(context, auth: auth),
              SizedBox(height: 42,),
            ],
          ),
        ),
      ),
    );
  }
}
