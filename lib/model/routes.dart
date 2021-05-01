
import 'package:flutter/material.dart';

class Routes {
  static const String homePage = 'home';
  static const String loginPage = 'login';
  static const String registerPage = 'register';
  static const String aboutUsPage = 'aboutus';
  static const String certificatePage = 'certificate';
  static const String cbdDescriptionPage = 'desrition';
  static const String cbdHistoryPage = 'history';
  static const String cbdQandAPage = 'question';
  static const String shopPage = 'shop';
  static const String cartPage = 'cart';
  static const String privacyAndPoricyPage = 'privacyandproricy';

  static void pushRoute(BuildContext context ,{required String route}) => Navigator.of(context).pushNamed(route);

}