import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key, this.fontSize = 42}) : super(key: key);
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            style: GoogleFonts.montserrat(
                fontSize: fontSize, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: 'CBD',
                style: GoogleFonts.montserrat(
                  fontSize: fontSize,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'AYS',
                style: GoogleFonts.montserrat(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 40,
          width: 2,
          color: Colors.green,
          margin: const EdgeInsets.only(left: 6),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Icon(
            Icons.science_rounded,
            size: 42,
            color: Colors.pinkAccent,
          ),
        ),
      ],
    );
  }
}
