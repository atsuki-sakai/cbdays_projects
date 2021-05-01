import 'package:cbdyas_project/screens/sign_in_page/register_page/register_form.dart';
import 'package:cbdyas_project/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({required this.auth});
  final Auth auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 860,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 54),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Create Account',
                      style: GoogleFonts.montserrat(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          letterSpacing: 0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 42,
                ),
                RegisterForm(auth: auth,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}