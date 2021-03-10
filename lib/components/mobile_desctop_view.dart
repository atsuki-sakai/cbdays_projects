import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MobileDesktopView extends StatelessWidget {
  const MobileDesktopView({this.mobileView, this.tableView, this.desktopView});

  final Widget mobileView;
  final Widget tableView;
  final Widget desktopView;
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizeInfo) {
        if (sizeInfo.isMobile) {
          return mobileView;
        } else if (sizeInfo.isTablet) {
          return tableView;
        } else {
          return desktopView;
        }
      },
    );
  }
}
