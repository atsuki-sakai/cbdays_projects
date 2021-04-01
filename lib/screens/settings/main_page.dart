import 'package:cbdyas_project/screens/home_page/home_page.dart';
import 'package:cbdyas_project/screens/sign_in_page/email_sign_in_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/signin': (context) => EmailSignInPage(),
      },
    );
  }
}
