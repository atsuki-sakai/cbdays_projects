import 'package:cbdyas_project/components/mobile_desctop_view.dart';
import 'package:cbdyas_project/components/neumorphism.dart';
import 'package:cbdyas_project/screens/home_page/menu_drawer.dart';
import 'package:cbdyas_project/screens/home_page/navigation_bar/sub_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopView(
      desktopView: DesktopNavigationBar(),
      tableView: TabletNavigationBar(),
      mobileView: MobileNavigationBar(),
    );
  }
}

class MobileNavigationBar extends StatelessWidget {
  final double iconSize = 22.0;
  final double buttonSpace = 8.0;
  final double titleSize = 28.0;
  final double navHeight = 60;
  final double buttonTextSize = 12.0;
  final double buttonWidth = 90;
  final double buttonHeight = 30;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: navHeight,
          child: Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              navigationTitle(fontSize: titleSize),
              SizedBox(
                width: 12.0,
              ),
              Container(
                width: 5,
                height: navHeight / 2,
                color: Colors.green.shade600,
              ),
              Spacer(),
              NMIconButton(
                hoverMessage: 'Menu Open',
                icon: Icons.menu,
                iconColor: Colors.black87,
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        Row(
          children: [
            Spacer(),
            SubNavigationBar(),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ],
    );
  }
}

class TabletNavigationBar extends StatelessWidget {
  final double titleSize = 28.0;
  final double navHeight = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: navHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          navigationTitle(fontSize: titleSize),
          SizedBox(
            width: 8.0,
          ),
          Container(
            width: 5,
            height: navHeight / 2,
            color: Colors.green.shade600,
          ),
          Spacer(),
          SubNavigationBar(),
          SizedBox(
            width: 20.0,
          ),
          NMIconButton(
            iconColor: Colors.black87,
            icon: Icons.menu,
            hoverMessage: 'Menu',
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
    );
  }
}

class DesktopNavigationBar extends StatelessWidget {
  final double iconSize = 38.0;
  final double buttonSpace = 12.0;
  final double titleSize = 32.0;
  final double navHeight = 100;

  List<String> menuItems = [
    'Home',
    'SHOP',
    'ABOUT US',
    '成分分析証明',
    'CBDについて',
    'CBDの始まり',
    'CBD Q&A',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: navHeight,
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            children: [
              navigationTitle(fontSize: titleSize),
              SizedBox(
                width: 6.0,
              ),
              Container(
                width: 5,
                height: navHeight / 2,
                color: Colors.green.shade600,
              ),
              Spacer(),
              for (var index = 0; index < menuItems.length; index++) ...{
                if (index == 0) ...{
                  NMLabel(
                    width: 90,
                    child: Text(
                      menuItems[index],
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 18.0),
                    ),
                    color: Colors.pinkAccent.shade200,
                    onTap: () =>
                        MenuDrawer.transitionToMenuItem(context, index),
                  ),
                  SizedBox(
                    width: buttonSpace,
                  ),
                } else ...{
                  NMLabel(
                    child: Text(
                      menuItems[index],
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w700),
                    ),
                    onTap: () =>
                        MenuDrawer.transitionToMenuItem(context, index),
                  ),
                  SizedBox(
                    width: buttonSpace,
                  ),
                }
              },
            ],
          ),
        ),
        Row(
          children: [
            Spacer(),
            SubNavigationBar(),
            SizedBox(
              width: 40.0,
            ),
          ],
        ),
      ],
    );
  }
}

Text navigationTitle({double fontSize = 42.0}) {
  return Text.rich(
    TextSpan(
      style: GoogleFonts.montserrat(
          fontSize: fontSize, fontWeight: FontWeight.bold),
      children: [
        TextSpan(text: 'CB'),
        TextSpan(
          text: 'D',
          style: GoogleFonts.montserrat(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade600,
          ),
        ),
        TextSpan(
          text: 'AYS',
          style: GoogleFonts.montserrat(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
