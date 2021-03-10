import 'dart:html';

import 'package:cbdyas_project/components/mobile_desctop_view.dart';
import 'package:cbdyas_project/screens/home_page/navigation_bar/navigation_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cbdyas_project/constants/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopView(
      mobileView: MobileHomeView(),
      tableView: TabletHomeView(),
      desktopView: DesktopHomeView(),
    );
  }
}

class MobileHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      children: [
        NavigationBar(
          width: 320.0,
          iconSize: 22.0,
          buttonSpace: 4.0,
        ),
      ],
    );
  }
}

class TabletHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      children: [
        NavigationBar(
          width: 520.0,
        ),
      ],
    );
  }
}

class DesktopHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      children: [
        NavigationBar(
          width: 820.0,
          textSize: 52.0,
        ),
        Container(
          child: Row(
            children: [
              Column(
                children: [
                  Text('sample hello world.'),
                  Text('sample hello world.'),
                  Text('sample hello world.'),
                ],
              ),
              Column(
                children: [
                  Text('sample hello world.'),
                  Text('sample hello world.'),
                  Text('sample hello world.'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class BaseView extends StatelessWidget {
  const BaseView({
    Key key,
    @required this.children,
    this.horizontal = 20.0,
    this.vertical = 20.0,
  }) : super(key: key);

  final List<Widget> children;
  final double horizontal;
  final double vertical;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: screenSize.width,
          padding:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}
