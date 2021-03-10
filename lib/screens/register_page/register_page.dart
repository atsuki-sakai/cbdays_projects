import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final tellFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(22.0),
        alignment: Alignment.center,
        child: Card(
          child: Container(
            width: screenSize.width * 0.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 32.0,
                ),
                Text(
                  'Register',
                  style: GoogleFonts.notoSans(
                    fontSize: 22.0,
                  ),
                ),
                SizedBox(height: 50.0),
                SizedBox(
                    width: 220,
                    child: CustomFormField(
                        name: 'user name',
                        node: nameFocusNode,
                        nextFocus: emailFocusNode)),
                SizedBox(
                    width: 220,
                    child: CustomFormField(
                        name: 'email',
                        node: emailFocusNode,
                        nextFocus: tellFocusNode)),
                SizedBox(
                  width: 220,
                  child: CustomFormField(name: 'Tell', node: tellFocusNode),
                ),
                SizedBox(
                  height: 12.0,
                ),
                ElevatedButton(onPressed: () {}, child: Text('Register')),
                SizedBox(
                  height: 12.0,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    'Already have an account??',
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
}

TextFormField CustomFormField(
    {BuildContext context,
    String name,
    FocusNode node,
    FocusNode nextFocus,
    bool isSecure = false}) {
  return TextFormField(
    obscureText: isSecure ? true : false,
    textInputAction: TextInputAction.next,
    autofocus: true,
    decoration: InputDecoration(
      labelText: name.toUpperCase(),
      hintText: name.toLowerCase(),
    ),
    focusNode: node,
    onFieldSubmitted: (v) {
      if (nextFocus != null)
        return FocusScope.of(context).requestFocus(nextFocus);
      FocusScope.of(context).unfocus();
    },
    validator: (value) {
      if (value.isEmpty) {
        return 'テキストを入力して下さい。';
      }
    },
    onSaved: (value) {},
  );
}
