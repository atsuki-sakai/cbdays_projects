import 'package:cbdyas_project/components/footer.dart';
import 'package:cbdyas_project/components/menu_drawer.dart';
import 'package:cbdyas_project/components/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CBDDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40.0,
            ),
            Text(
              'CBDについて',
              style: GoogleFonts.sawarabiMincho(
                  fontWeight: FontWeight.w500, fontSize: 42.0),
            ),
            SizedBox(
              height: 40.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                'images/description_1.jpg',
                width: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CBDとは',
                    style: GoogleFonts.sawarabiMincho(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 130,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'CBDとはカンナビジオールの略称で大麻草の２大主成分のひとつとなります。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    '様々な薬理効果、効能を持つ天然化合物として世界的に大注目されている成分です。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    'CBDは身体がダメージを受けた箇所の修復作用に及ぼす成分で、現代人の様々な不調を適正な範囲へ整えるという優れた利点があります',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'なぜ、CBDを使うのか',
                    style: GoogleFonts.sawarabiMincho(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 300,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '人体には「エンド・カンナビノイド・システム(ECS)」と呼ばれる神経・免疫バランスを調節し、食欲・痛み・免疫調節・感情抑制・運動・発達と老化・神経保護・認知と記憶など健康な身体を維持するための身体調節機能があります。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    'しかし、老化や強いストレスなどによって「カンナビノイド欠乏症」の状態となります。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    'エンド・カンナビノイド・システム機能が弱まると、疾患を発症しやすくなると言われています。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    'CBDには、ECS機能を正常に戻す作用があるため、前述した疾患に有用な万能性があるのです。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'CBDはどんな症状に効きますか',
                    style: GoogleFonts.sawarabiMincho(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 400,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'CBDは、私たちの体内に本来備わっている、心身の調節機能＝ECS(またの名をホメオスタシス維持機能)を活性化し、細胞間のコミュニケーション活動を支えています。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    'また、自律神経、循環器、体温調節、ホルモン分泌などの「生きるための機能」をも同時にサポートしてるいわば「生命維持メインシステム」に直結しています。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    'ECSの機能低下が関与していると考えられる病態は無数にあります。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    '癌、不眠症、さまざまな疼痛、嘔吐、関節症、てんかん、糖尿病、虚血性心疾患、認知症、自閉症、うつ病、アトピー、不安障害、統合失調症、炎症性腸疾患、多発性硬化症などの自己免疫疾患といったメジャーなものから、原因不明の希少疾患まで、多くの疾患にCBD利用が試みられ、効果報告の論文は2,500を超えており、数々の研究論文も発表されています。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      'images/description_2.jpg',
                      width: MediaQuery.of(context).size.width * 0.7,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    '麻の成分だけど、違法性はありますか',
                    style: GoogleFonts.sawarabiMincho(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 500,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '麻の成分となると不安になる方もいるとは思いますが、日本の法律で禁止となっているのは、麻の花穂・葉の部分となっており、その部分に多く含まれるのが向精神作用のあるTHCで、日本では現在違法となっています。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    'しかし、CBDは神社のしめ縄や洋服などに使われている産業大麻と言われる麻の種と茎から作られているため、完全合法的な成分となりますので安心して使用する事ができます。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    'ハイにはなりません。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      'images/description_3.jpg',
                      width: MediaQuery.of(context).size.width * 0.7,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
