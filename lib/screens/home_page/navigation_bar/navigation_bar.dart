import 'package:cbdyas_project/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationBar extends StatelessWidget {
  final double width;
  final double textSize;
  final double iconSize;
  final double buttonSpace;

  const NavigationBar({
    Key key,
    this.width = 980,
    this.textSize = 42.0,
    this.iconSize = 32.0,
    this.buttonSpace = 22.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        children: [
          Row(
            children: [
              navigationTitle(fontSize: textSize),
              Spacer(),
              IconButton(
                icon: Icon(
                  FontAwesome.instagram,
                  size: iconSize,
                  color: Colors.pink,
                ),
                onPressed: () async {
                  if (await canLaunch(instagramUrl)) {
                    launch(instagramUrl);
                  }
                },
              ),
              SizedBox(
                width: buttonSpace,
              ),
              IconButton(
                icon: Icon(
                  MaterialIcons.person_outline,
                  color: Colors.black,
                  size: iconSize,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
          LayoutBuilder(builder: (context, constants) {
            return SizedBox(
              width: constants.maxWidth,
              child: Divider(
                thickness: 3,
                color: Colors.grey[300],
              ),
            );
          }),
        ],
      ),
    );
  }
}

Text navigationTitle({double fontSize = 42.0}) {
  return Text.rich(
    TextSpan(
      style:
          GoogleFonts.aBeeZee(fontSize: fontSize, fontWeight: FontWeight.bold),
      children: [
        TextSpan(text: 'CB'),
        TextSpan(
            text: 'D',
            style: GoogleFonts.aBeeZee(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            )),
        TextSpan(text: 'AYS'),
        // TextSpan(
        //     text: '.',
        //     style: GoogleFonts.aBeeZee(
        //         fontSize: fontSize,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.orangeAccent)),
      ],
    ),
  );
}
