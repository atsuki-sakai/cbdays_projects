import 'package:cbdyas_project/components/footer.dart';
import 'package:cbdyas_project/screens/home_page/Products_Contents.dart';
import 'package:cbdyas_project/screens/home_page/home_header.dart';
import 'package:cbdyas_project/screens/home_page/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'menu_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseHomeView(children: [
      NavigationBar(),
      SizedBox(
        height: 22.0,
      ),
      HomeHeader(),
      SizedBox(
        height: 60,
      ),
      ProductsContents(),
      Footer(),
    ]);
  }
}

class BaseHomeView extends StatelessWidget {
  const BaseHomeView({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;


    return Scaffold(
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: screenSize.width,
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}
