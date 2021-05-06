import 'dart:ui';
import 'package:cbdyas_project/components/app_logo.dart';
import 'package:cbdyas_project/components/navigation_bar/navigation_bar.dart';
import 'package:cbdyas_project/model/routes.dart';
import 'package:cbdyas_project/screens/about_us/about_us.dart';
import 'package:cbdyas_project/screens/cbd_description/cbd_description.dart';
import 'package:cbdyas_project/screens/cbd_history/cbd_history.dart';
import 'package:cbdyas_project/screens/cbd_q_and_a/cbd_q_and_a.dart';
import 'package:cbdyas_project/screens/certificate/certificate_page.dart';
import 'package:cbdyas_project/screens/home_page/home_page.dart';
import 'package:cbdyas_project/screens/shop/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuDrawer extends StatelessWidget {
  List<String> menuItems = [
    'Home',
    'SHOP',
    'ABOUT US',
    '成分分析証明',
    'CBDについて',
    'CBDの始まり',
    'CBD Q&A',
  ];
  List<IconData> menuIcons = [
    Icons.home_outlined,
    Icons.shopping_cart_outlined,
    Icons.article_outlined,
    Icons.description_outlined,
    Icons.science_outlined,
    Icons.wb_sunny_outlined,
    Icons.question_answer,
  ];

  static void transitionToMenuItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamedAndRemoveUntil(context, Routes.homePage, (route) => false);
        break;
      case 1:
        Navigator.pushNamedAndRemoveUntil(context, Routes.shopPage, (route) => false);
        break;
      case 2:
        Navigator.pushNamedAndRemoveUntil(context, Routes.aboutUsPage, (route) => false);
        break;
      case 3:
        Navigator.pushNamedAndRemoveUntil(context, Routes.certificatePage, (route) => false);
        break;
      case 4:
        Navigator.pushNamedAndRemoveUntil(context, Routes.cbdDescriptionPage, (route) => false);
        break;
      case 5:
        Navigator.pushNamedAndRemoveUntil(context, Routes.cbdHistoryPage, (route) => false);
        break;
      case 6:
        Navigator.pushNamedAndRemoveUntil(context, Routes.cbdQandAPage, (route) => false);
        break;
      default:
        Navigator.pushNamedAndRemoveUntil(context, Routes.homePage, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 800 ? true : false;
    return Drawer(
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) return _buildDrawerHeader(isSmall);
          if (index == menuItems.length + 1) return _closeDrawerButton(context);
          return SizedBox(
            width: isSmall ? 60 : 120,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              leading: Icon(menuIcons[index - 1],color: Colors.indigo,),
              trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
              title: Text(
                menuItems[index - 1],
                style: GoogleFonts.montserrat(
                    fontSize: 15.0, fontWeight: FontWeight.w500),
              ),
              onTap: () => transitionToMenuItem(context, index - 1),
            ),
          );
        },
        itemCount: menuItems.length + 2,
      ),
    );
  }

  Widget _buildDrawerHeader( bool isSmall) {
    return Container(
      alignment: Alignment.center,
      height:  isSmall ? 60 : 120,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppLogo(fontSize: isSmall ? 20 : 28.0),
        ],
      ),
    );
  }

  Widget _closeDrawerButton(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 20.0),
        child: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
