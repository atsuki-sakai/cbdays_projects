import 'package:cbdyas_project/model/routes.dart';
import 'package:cbdyas_project/screens/utils/privacy_policy_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2,),
            TextButton(
              child: Text(
                'プライバシーポリシー',
                style: GoogleFonts.sawarabiMincho(
                    fontSize: 14.0, color: Colors.grey),
              ),
              onPressed: () => Routes.pushRoute(context, route: Routes.privacyAndPoricyPage),
            ),
            Spacer(flex: 1,),
            TextButton(
              child: Text('特定商取引法に基づく表記',
                  style: GoogleFonts.sawarabiMincho(
                      fontSize: 14.0, color: Colors.grey)),
              onPressed: () => Routes.pushRoute(context, route: Routes.privacyAndPoricyPage),
            ),
            Spacer(flex: 2,),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          thickness: 3,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Copyright © 2021 CBDAYS.',
          style: GoogleFonts.montserrat(fontSize: 14.0, color: Colors.grey),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
