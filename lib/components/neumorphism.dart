import 'package:flutter/material.dart';
import 'hover_extension.dart';

Color mC = Colors.grey.shade100;
Color mCL = Colors.white;
Color mCD = Colors.black.withOpacity(0.075);
Color mCC = Colors.green.withOpacity(0.65);
Color fCD = Colors.grey.shade700;
Color fCL = Colors.grey;

BoxDecoration nMbox = BoxDecoration(
  borderRadius: BorderRadius.circular(15.0),
  color: mC,
  boxShadow: [
    BoxShadow(
      color: mCD,
      offset: Offset(10, 10),
      blurRadius: 10,
    ),
    BoxShadow(
      color: mCL,
      offset: Offset(-10, -10),
      blurRadius: 10,
    )
  ],
);

BoxDecoration nMboxInVert = BoxDecoration(
  borderRadius: BorderRadius.circular(15.0),
  color: mCD,
  boxShadow: [
    BoxShadow(
      color: mCL,
      offset: Offset(3, 3),
      blurRadius: 3,
      spreadRadius: -3,
    ),
  ],
);
BoxDecoration nMboxInvertActive = nMboxInVert.copyWith(color: mCC);

BoxDecoration nmbtn = BoxDecoration(
  borderRadius: BorderRadius.circular(15.0),
  color: mC,
  boxShadow: [
    BoxShadow(
      color: mCD,
      offset: Offset(2, 2),
      blurRadius: 2,
    )
  ],
);

class NMIconButton extends StatelessWidget {
  final IconData icon;
  final String hoverMessage;
  final VoidCallback? onTap;
  final double height;
  final double width;
  final Color iconColor;

  const NMIconButton({
    required this.icon,
    this.iconColor = Colors.green,
    required this.hoverMessage,
    this.onTap,
    this.height = 55,
    this.width = 55,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: nMbox,
      child: Tooltip(
        message: hoverMessage,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: onTap,
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    ).moveUpOnHover;
  }
}

class NMLabel extends StatelessWidget {
  double? width;
  final double height;
  final VoidCallback? onTap;
  final double radius;
  final Widget child;
  Color? color;
  NMLabel({
    this.onTap,
    this.height = 40.0,
    this.width,
    this.radius = 15.0,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: color == null ? nMbox : nMbox.copyWith(color: color),
        child: child,
      ),
    ).moveUpOnHover;
  }
}
