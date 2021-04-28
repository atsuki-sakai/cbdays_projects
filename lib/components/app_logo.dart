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
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'AYS',
                style: GoogleFonts.montserrat(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Icon(
            Icons.local_cafe_outlined,
            size: 42,
            color: Colors.black,
          ),
        ),
        Text.rich(
          TextSpan(
            style: GoogleFonts.montserrat(
                fontSize: fontSize, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: 'C',
                style: GoogleFonts.montserrat(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: 'OFF',
                style: GoogleFonts.montserrat(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700,
                ),
              ),
              TextSpan(
                text: 'EE',
                style: GoogleFonts.montserrat(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
