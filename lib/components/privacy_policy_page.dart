import 'package:cbdyas_project/screens/home_page/menu_drawer.dart';
import 'package:cbdyas_project/screens/home_page/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavigationBar(),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'プライバシーポリシー',
              style: GoogleFonts.sawarabiMincho(
                  fontWeight: FontWeight.w600, fontSize: 26.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '当社では、お客様の個人情報について以下のとおり取り扱い、サービスを提供いたします。',
              style: GoogleFonts.sawarabiMincho(
                  fontWeight: FontWeight.w300,
                  fontSize: 18.0,
                  color: Colors.black87),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  _detailLabel(
                      title: '個人情報取り扱い事業者 (当社) の名称', subTitle: 'CBDAYS'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _detailLabel({String title, String subTitle}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.sawarabiMincho(
                fontWeight: FontWeight.w500, fontSize: 22.0),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            subTitle,
            style: GoogleFonts.sawarabiMincho(
                fontWeight: FontWeight.w300, fontSize: 18.0),
          )
        ],
      ),
    );
  }
}
