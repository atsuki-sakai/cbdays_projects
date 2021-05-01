import 'package:cbdyas_project/components/footer.dart';
import 'package:cbdyas_project/components/menu_drawer.dart';
import 'package:cbdyas_project/components/mobile_desctop_view.dart';
import 'package:cbdyas_project/components/navigation_bar/navigation_bar.dart';
import 'package:cbdyas_project/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CertificatePage extends StatelessWidget {
  final Auth auth;

  const CertificatePage({Key? key,required this.auth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MobileDesktopView(
      mobileView: MobileCertificatePage(auth: auth,),
      tableView: TabletCertificatePage(auth: auth,),
      desktopView: DeskTopCertificatePage(auth: auth,),
    );
  }
}

class MobileCertificatePage extends StatelessWidget {
  final double contentPadding = 20.0;
  final double titleSize = 32.0;
  final double widthParams = 0.9;
  final double defaultTextSize = 14.0;
  final Auth auth;

  const MobileCertificatePage({Key? key,required this.auth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width * widthParams;
    return Scaffold(
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavigationBar(auth: auth,),
            SizedBox(
              height: contentPadding,
            ),
            Text(
              '成分分析証明書',
              style: GoogleFonts.sawarabiMincho(
                  fontWeight: FontWeight.w500, fontSize: titleSize),
            ),
            SizedBox(
              height: contentPadding,
            ),
            _buildBorderImage(
              width: contextWidth,
              path: 'images/certificate_1.jpg',
            ),
            SizedBox(
              height: contentPadding,
            ),
            Container(
              width: contextWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('《CBDAYSが輸入したCBDは、日本の法律に導守し許可を得て正式に販売しています。》',
                      style: GoogleFonts.sawarabiMincho(
                          fontSize: titleSize / 2,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87)),
                  SizedBox(
                    height: contentPadding / 2,
                  ),
                  _buildDescriptionLabel(text: '厚生労働省への確認許可'),
                  SizedBox(
                    height: contentPadding / 3,
                  ),
                  _buildDescriptionLabel(text: '検疫所への食品等輸入届出書などの提出'),
                  SizedBox(
                    height: contentPadding / 3,
                  ),
                  _buildDescriptionLabel(text: '税関への成分分析証明、安全性データシート、製造工程表、'),
                  SizedBox(
                    height: contentPadding / 3,
                  ),
                  _buildDescriptionLabel(text: '食品等輸入届出書、宣誓書などの提出や製品検査'),
                ],
              ),
            ),
            _buildBorderImage(
              width: contextWidth,
              path: 'images/certificate_2.jpg',
            ),
            _buildBorderImage(
              width: contextWidth,
              path: 'images/certificate_3.jpg',
            ),
            _buildBorderImage(
                width: contextWidth, path: 'images/certificate_4.jpg'),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class TabletCertificatePage extends StatelessWidget {
  final double contentPadding = 20.0;
  final double titleSize = 36.0;
  final double widthParams = 0.8;
  final double defaultTextSize = 14.0;
  final Auth auth;

  const TabletCertificatePage({Key? key,required this.auth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width * widthParams;
    return Scaffold(
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavigationBar(auth: auth,),
            SizedBox(
              height: contentPadding,
            ),
            Text(
              '成分分析証明書',
              style: GoogleFonts.sawarabiMincho(
                  fontWeight: FontWeight.w500, fontSize: titleSize),
            ),
            SizedBox(
              height: contentPadding,
            ),
            _buildBorderImage(
              width: contextWidth,
              path: 'images/certificate_1.jpg',
            ),
            SizedBox(
              height: contentPadding,
            ),
            Container(
              width: contextWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('《CBDAYSが輸入したCBDは、日本の法律に導守し許可を得て正式に販売しています。》',
                      style: GoogleFonts.sawarabiMincho(
                          fontSize: titleSize / 2,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87)),
                  SizedBox(
                    height: contentPadding / 2,
                  ),
                  _buildDescriptionLabel(
                      text: '厚生労働省への確認許可', fontSize: defaultTextSize),
                  SizedBox(
                    height: contentPadding / 3,
                  ),
                  _buildDescriptionLabel(
                      text: '検疫所への食品等輸入届出書などの提出', fontSize: defaultTextSize),
                  SizedBox(
                    height: contentPadding / 3,
                  ),
                  _buildDescriptionLabel(
                      text: '税関への成分分析証明、安全性データシート、製造工程表、',
                      fontSize: defaultTextSize),
                  SizedBox(
                    height: contentPadding / 3,
                  ),
                  _buildDescriptionLabel(
                      text: '食品等輸入届出書、宣誓書などの提出や製品検査',
                      fontSize: defaultTextSize),
                ],
              ),
            ),
            _buildBorderImage(
              width: contextWidth,
              path: 'images/certificate_2.jpg',
            ),
            _buildBorderImage(
              width: contextWidth,
              path: 'images/certificate_3.jpg',
            ),
            _buildBorderImage(
                width: contextWidth, path: 'images/certificate_4.jpg'),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class DeskTopCertificatePage extends StatelessWidget {
  final double contentPadding = 40.0;
  final double titleSize = 42.0;
  final double widthParams = 0.7;
  final Auth auth;

  const DeskTopCertificatePage({Key? key,required this.auth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width * widthParams;
    return Scaffold(
      appBar: NavigationBar(auth: auth,),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: contentPadding,
            ),
            Text(
              '成分分析証明書',
              style: GoogleFonts.sawarabiMincho(
                  fontWeight: FontWeight.w500, fontSize: titleSize),
            ),
            SizedBox(
              height: contentPadding,
            ),
            _buildBorderImage(
              width: contextWidth,
              path: 'images/certificate_1.jpg',
            ),
            SizedBox(
              height: contentPadding,
            ),
            Container(
              width: contextWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('《CBDAYSが輸入したCBDは、日本の法律に導守し許可を得て正式に販売しています。》',
                      style: GoogleFonts.sawarabiMincho(
                          fontSize: titleSize / 2,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87)),
                  SizedBox(
                    height: contentPadding / 2,
                  ),
                  _buildDescriptionLabel(text: '厚生労働省への確認許可'),
                  SizedBox(
                    height: contentPadding / 3,
                  ),
                  _buildDescriptionLabel(text: '検疫所への食品等輸入届出書などの提出'),
                  SizedBox(
                    height: contentPadding / 3,
                  ),
                  _buildDescriptionLabel(text: '税関への成分分析証明、安全性データシート、製造工程表、'),
                  SizedBox(
                    height: contentPadding / 3,
                  ),
                  _buildDescriptionLabel(text: '食品等輸入届出書、宣誓書などの提出や製品検査'),
                ],
              ),
            ),
            _buildBorderImage(
              width: contextWidth,
              path: 'images/certificate_2.jpg',
            ),
            _buildBorderImage(
              width: contextWidth,
              path: 'images/certificate_3.jpg',
            ),
            _buildBorderImage(
                width: contextWidth, path: 'images/certificate_4.jpg'),
            Footer(),
          ],
        ),
      ),
    );
  }
}

Text _buildDescriptionLabel({required String text, double fontSize = 18.0}) {
  return Text('・$text',
      style: GoogleFonts.sawarabiMincho(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: Colors.black87));
}

Padding _buildBorderImage({required double width,required String path}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.asset(
        path,
        width: width,
        fit: BoxFit.fitWidth,
      ),
    ),
  );
}
