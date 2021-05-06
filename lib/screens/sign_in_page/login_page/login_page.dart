
import 'package:cbdyas_project/screens/sign_in_page/login_page/login_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({required this.auth});
  final auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade50,
        shadowColor: Colors.transparent,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.black), onPressed: () {
          Navigator.pop(context);
        },),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 860,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 44),
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
                  ],
                ),
                SizedBox(
                  height: 42,
                ),
                LoginForm(auth: auth),
                SizedBox(height: 42,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
