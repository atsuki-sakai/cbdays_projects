import 'package:cbdyas_project/components/email_sign_in_form.dart';
import 'package:flutter/material.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 320.0,
          child: Card(
            child: EmailSignInForm(),
          ),
        ),
      ),
    );
  }
}
