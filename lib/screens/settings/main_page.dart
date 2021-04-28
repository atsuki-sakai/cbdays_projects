import 'package:cbdyas_project/constants/routes.dart';
import 'package:cbdyas_project/screens/about_us/about_us.dart';
import 'package:cbdyas_project/screens/cart/cart_page.dart';
import 'package:cbdyas_project/screens/cbd_description/cbd_description.dart';
import 'package:cbdyas_project/screens/cbd_history/cbd_history.dart';
import 'package:cbdyas_project/screens/cbd_q_and_a/cbd_q_and_a.dart';
import 'package:cbdyas_project/screens/certificate/certificate_page.dart';
import 'package:cbdyas_project/screens/shop/shop_page.dart';
import 'package:cbdyas_project/screens/sign_in_page/login_page/login_page.dart';
import 'package:cbdyas_project/service/auth.dart';
import 'package:cbdyas_project/screens/home_page/home_page.dart';
import 'package:cbdyas_project/screens/sign_in_page/register_page/register_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final auth = Auth();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      initialRoute: Routes.homePage,
      routes: {
        Routes.homePage : (context) => HomePage(auth: auth,),
        Routes.loginPage : (context) => LoginPage(auth: auth,),
        Routes.registerPage : (context) => RegisterPage(auth: auth,),
        Routes.aboutUsPage : (context) => AboutUsPage(),
        Routes.certificatePage : (context) => CertificatePage(),
        Routes.cbdDescriptionPage : (context) => CBDDescriptionPage(),
        Routes.cbdHistoryPage : (context) => CBDHistoryPage(),
        Routes.cbdQandAPage : (context) => CBDQAndAPage(),
        Routes.cartPage : (context) => CartPage(),
        Routes.shopPage: (context) => ShopPage(),
      },
    );
  }
}
