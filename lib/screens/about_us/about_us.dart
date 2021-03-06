import 'package:cbdyas_project/components/footer.dart';
import 'package:cbdyas_project/components/menu_drawer.dart';
import 'package:cbdyas_project/components/navigation_bar/navigation_bar.dart';
import 'package:cbdyas_project/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key, required this.auth}) : super(key: key);
  final Auth auth;
  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 800 ? true : false;
    return Scaffold(
      appBar: NavigationBar(auth: auth,),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text(
              'ABOUT US',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500, fontSize: isSmall ? 32.0 : 42.0),
            ),
            SizedBox(
              height: 40.0,
            ),
            _buildConntents(context,isSmall: isSmall,),
            SizedBox(
              height: isSmall ? 30.0 : 40,
            ),
            Container(
              child: Text(
                'Company',
                style: GoogleFonts.montserrat(
                    fontSize: isSmall ? 32.0 : 42.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: isSmall ? 30.0 : 40,
            ),
            buildCompanyDetailCard(context),
            SizedBox(
              height: isSmall ? 30.0 : 40,
            ),
            Footer(),
          ],
        ),
      ),
    );
  }

  Container buildCompanyDetailCard(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 800 ? true : false;
    return Container(
      width: isSmall ? MediaQuery.of(context).size.width * 0.9 : MediaQuery.of(context).size.width * 0.7,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildCompanyDetail(isSmall: isSmall,title: '会社名', value: 'CBDAYS'),
              SizedBox(
                height: 12.0,
              ),
              buildCompanyDetail(isSmall: isSmall,title: '設立年月日', value: '2019年11月11日'),
              SizedBox(
                height: 12.0,
              ),
              buildCompanyDetail(isSmall: isSmall,
                  title: '所在地',
                  value: '〒600-8028 京都府京都市下京区植松町717 幸兵2F 株式会社TSS'),
              SizedBox(
                height: 12.0,
              ),
              buildCompanyDetail(isSmall: isSmall,title: '業務内容', value: 'CBD販売・卸CBD販売促進その他'),
              SizedBox(
                height: 12.0,
              ),
              buildCompanyDetail(isSmall: isSmall,title: 'メールアドレス', value: 'hello@cbdayslab.jp'),
            ],
          ),
        ),
      ),
    );
  }

  Row buildCompanyDetail({required bool isSmall,required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: SelectableText('$title　：',
                style: GoogleFonts.sawarabiMincho(
                    fontSize: isSmall ? 16: 22.0, fontWeight: FontWeight.w500))),
        Expanded(
            child: SelectableText(
          value,
          style: GoogleFonts.sawarabiMincho(
              fontSize: isSmall ? 14: 18.0, fontWeight: FontWeight.w400),
        )),
      ],
    );
  }
}

Widget _buildConntents(BuildContext context, {required bool isSmall}) {
  final width = MediaQuery.of(context).size.width;
  return Container(
    width: isSmall ?width * 0.9 : width * 0.7,
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            'images/about_us.jpg',
            width: isSmall ?width * 0.9 : width * 0.6,
          ),
        ),
        SizedBox(
          height: isSmall ? 20.0: 40.0,
        ),
        SelectableText(
          '''CBDAYSは、ヨーロッパで栽培されたカンナビスに由来するCBD原料の輸出、卸売、安定供給、製品開発、サポート、物流管理を行っています。Made in Japan 世界最高品質を目指します。''',
          style: defaultTextStyle(),
        ),
        SizedBox(
          height: isSmall ? 12.0: 24.0,
        ),
        SelectableText(
            '''お客様の製品や使用用途に適した形態のCBD原料をご提案致します。原料から、最終製品がお客様の手に届くまでの製造流通において成分分析を厳格に行います。第三者試験機関において、検査試験を行い、濃度や汚染物質など徹底した品質管理を行っています。''',
            style: defaultTextStyle()),
        SizedBox(
          height: isSmall ? 12.0: 24.0,
        ),
        SelectableText(
            '''ナチュラルでオーガニックであることはもちろん、厳しい品質試験を通され、厚生労働省に許可を得た、完全に合法化されたCBD原料、オイル製品づくりをモットーとしています。お気軽にお問合せ下さい。''',
            style: defaultTextStyle()),
        SizedBox(
          height: isSmall ? 20.0: 40.0,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            'images/about_us_2.jpg',
            width: isSmall ?width * 0.9 : width * 0.7,
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(
          height: isSmall ? 20.0: 40.0,
        ),
        SizedBox(
          child: Divider(thickness: 3),
          width: isSmall ?width * 0.9 : width * 0.7,
        ),
      ],
    ),
  );
}

TextStyle defaultTextStyle() {
  return GoogleFonts.sawarabiMincho(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.black87);
}
