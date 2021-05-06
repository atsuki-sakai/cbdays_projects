import 'package:cbdyas_project/components/footer.dart';
import 'package:cbdyas_project/components/navigation_bar/navigation_bar.dart';
import 'package:cbdyas_project/screens/home_page/Products_Contents.dart';
import 'package:cbdyas_project/screens/home_page/home_header.dart';
import 'package:flutter/material.dart';
import '../../components/menu_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.auth});
  final auth;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: NavigationBar(auth: auth,),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: screenSize.width,
          child: Column(
            children: [
              SizedBox(
                height: 22.0,
              ),
              HomeHeader(),
              SizedBox(
                height: 60,
              ),
              ProductsContents(auth: auth,),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
