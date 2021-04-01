import 'package:cbdyas_project/components/footer.dart';
import 'package:cbdyas_project/screens/home_page/menu_drawer.dart';
import 'package:cbdyas_project/screens/home_page/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavigationBar(),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'ABOUT US',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500, fontSize: 42.0),
            ),
            SizedBox(
              height: 40.0,
            ),
            _buildConntents(context),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Text(
                'Company',
                style: GoogleFonts.montserrat(
                    fontSize: 42.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            buildCompanyDetailCard(context),
            SizedBox(
              height: 40,
            ),
            Footer(),
          ],
        ),
      ),
    );
  }

  Container buildCompanyDetailCard(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildCompanyDetail(title: '会社名', value: 'CBDAYS'),
              SizedBox(
                height: 12.0,
              ),
              buildCompanyDetail(title: '設立年月日', value: '2019年11月11日'),
              SizedBox(
                height: 12.0,
              ),
              buildCompanyDetail(
                  title: '所在地',
                  value: '〒600-8028 京都府京都市下京区植松町717 幸兵2F 株式会社TSS'),
              SizedBox(
                height: 12.0,
              ),
              buildCompanyDetail(title: '業務内容', value: 'CBD販売・卸CBD販売促進その他'),
              SizedBox(
                height: 12.0,
              ),
              buildCompanyDetail(title: 'メールアドレス', value: 'hello@cbdayslab.jp'),
            ],
          ),
        ),
      ),
    );
  }

  Row buildCompanyDetail({@required String title, @required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: SelectableText('$title　：',
                style: GoogleFonts.sawarabiMincho(
                    fontSize: 22.0, fontWeight: FontWeight.w500))),
        Expanded(
            child: SelectableText(
          value,
          style: GoogleFonts.sawarabiMincho(
              fontSize: 18.0, fontWeight: FontWeight.w400),
        )),
      ],
    );
  }
}


Widget _buildConntents(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return Container(
    // padding: EdgeInsets.symmetric(horizontal: 120.0, vertical: 40.0),
    width: width * 0.7,
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            'images/about_us.jpg',
            width: width * 0.6,
          ),
        ),
        SizedBox(
          height: 40.0,
        ),
        SelectableText(
          '''CBDAYSは、ヨーロッパで栽培されたカンナビスに由来するCBD原料の輸出、卸売、安定供給、製品開発、サポート、物流管理を行っています。Made in Japan 世界最高品質を目指します。''',
          style: defaultTextStyle(),
        ),
        SizedBox(
          height: 24.0,
        ),
        SelectableText(
            '''お客様の製品や使用用途に適した形態のCBD原料をご提案致します。原料から、最終製品がお客様の手に届くまでの製造流通において成分分析を厳格に行います。第三者試験機関において、検査試験を行い、濃度や汚染物質など徹底した品質管理を行っています。''',
            style: defaultTextStyle()),
        SizedBox(
          height: 24.0,
        ),
        SelectableText(
            '''ナチュラルでオーガニックであることはもちろん、厳しい品質試験を通され、厚生労働省に許可を得た、完全に合法化されたCBD原料、オイル製品づくりをモットーとしています。お気軽にお問合せ下さい。''',
            style: defaultTextStyle()),
        SizedBox(
          height: 40.0,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            'images/about_us_2.jpg',
            width: width * 0.7,
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(
          height: 40.0,
        ),
        SizedBox(
          child: Divider(thickness: 3),
          width: width * 0.7,
        ),
      ],
    ),
  );
}

TextStyle defaultTextStyle() {
  return GoogleFonts.sawarabiMincho(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.black87);
}
