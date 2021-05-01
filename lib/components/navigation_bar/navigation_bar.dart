import 'package:cbdyas_project/components/app_logo.dart';
import 'package:cbdyas_project/components/menu_drawer.dart';
import 'package:cbdyas_project/components/mobile_desctop_view.dart';
import 'package:cbdyas_project/components/navigation_bar/sub_navigation_bar.dart';
import 'package:cbdyas_project/components/neumorphism.dart';
import 'package:cbdyas_project/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const List<String> navigationItems = [
  // READ -  一番初めの要素が大きくピンク色に表示される。
  'Home',
  'SHOP',
  'ABOUT US',
  '成分分析証明',
  'CBDについて',
  'CBDの始まり',
  'CBD Q&A',
];

class NavigationBar extends StatelessWidget with PreferredSizeWidget {
  const NavigationBar({Key? key, required this.auth}) : super(key: key);
  final Auth auth;

  @override
  Widget build(BuildContext context) {
    return MobileDesktopView(
      desktopView: DesktopNavigationBar(
        auth: auth,
      ),
      tableView: TabletNavigationBar(
        auth: auth,
      ),
      mobileView: MobileNavigationBar(auth: auth),
    );
  }

  // NavigationBar の高さ
  @override
  Size get preferredSize => Size(double.infinity, 140);
}

class MobileNavigationBar extends StatelessWidget {
  final double iconSize = 22.0;
  final double buttonSpace = 8.0;
  final double titleSize = 28.0;
  final double navHeight = 60;
  final double buttonTextSize = 12.0;
  final double buttonWidth = 90;
  final double buttonHeight = 30;
  final Auth auth;

  const MobileNavigationBar({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: navHeight,
      child: Row(
        children: [
          SizedBox(
            width: 12.0,
          ),
          AppLogo(fontSize: titleSize),
          Spacer(),
          SubNavigationBar(auth: auth),
          SizedBox(width: 12,),
          NMIconButton(
            hoverMessage: 'Menu Open',
            icon: Icons.menu,
            iconColor: Colors.black87,
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          SizedBox(width: 12,)
        ],
      ),
    );
  }
}

class TabletNavigationBar extends StatelessWidget {
  final double titleSize = 28.0;
  final double navHeight = 100;

  final Auth auth;

  const TabletNavigationBar({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: navHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 12.0),
      child: Column(
        children: [
          Row(
            children: [
              AppLogo(fontSize: titleSize),
              Spacer(),
              SubNavigationBar(auth: auth),
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
        ],
      ),
    );
  }
}

class DesktopNavigationBar extends StatelessWidget {
  final double iconSize = 38.0;
  final double buttonSpace = 10.0;
  final double titleSize = 32.0;
  final double navHeight = 100;
  final Auth auth;

  const DesktopNavigationBar({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: navHeight,
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Row(
            children: [
              AppLogo(fontSize: titleSize),
              Spacer(),
              for (var index = 0; index < navigationItems.length; index++) ...{
                if (index == 0) ...{
                  NMLabel(
                    width: 90,
                    child: Text(
                      navigationItems[index],
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 15.0),
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
                      navigationItems[index],
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
            SubNavigationBar(auth: auth),
            SizedBox(
              width: 40.0,
            ),
          ],
        ),
      ],
    );
  }
}
