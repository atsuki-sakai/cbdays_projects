import 'package:cbdyas_project/components/footer.dart';
import 'package:cbdyas_project/screens/home_page/menu_drawer.dart';
import 'package:cbdyas_project/screens/home_page/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CertificatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavigationBar(),
            SizedBox(
              height: 40,
            ),
            Text(
              '成分分析証明書',
              style: GoogleFonts.sawarabiMincho(
                  fontWeight: FontWeight.w500, fontSize: 42.0),
            ),
            SizedBox(
              height: 40,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                'images/certificate_1.jpg',
                width: MediaQuery.of(context).size.width * 0.6,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('《CBDAYSが輸入したCBDは、日本の法律に導守し許可を得て正式に販売しています。》', style: GoogleFonts.sawarabiMincho(
                      fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black87)),
                  SizedBox(height: 20.0,),
                  Text('・厚生労働省への確認許可', style: GoogleFonts.sawarabiMincho(
                      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.black87)),
                  SizedBox(height: 12.0,),
                  Text('・検疫所への食品等輸入届出書などの提出', style: GoogleFonts.sawarabiMincho(
                      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.black87)),
                  SizedBox(height: 12.0,),
                  Text('・税関への成分分析証明、安全性データシート、製造工程表、', style: GoogleFonts.sawarabiMincho(
                      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.black87)),
                  SizedBox(height: 12.0,),
                  Text('・食品等輸入届出書、宣誓書などの提出や製品検査', style: GoogleFonts.sawarabiMincho(
                      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.black87)),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                'images/certificate_2.jpg',
                width: MediaQuery.of(context).size.width * 0.7,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                'images/certificate_3.jpg',
                width: MediaQuery.of(context).size.width * 0.7,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                'images/certificate_4.jpg',
                width: MediaQuery.of(context).size.width * 0.6,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: 40,),
            Footer(),
          ],
        ),
      ),
    );
  }
}
