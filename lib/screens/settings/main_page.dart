import 'package:cbdyas_project/screens/login_page/login_page.dart';
import 'package:cbdyas_project/screens/register_page/register_page.dart';
import 'package:cbdyas_project/screens/home_page/home_page.dart';
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
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
