import 'package:cbdyas_project/components/footer.dart';
import 'package:cbdyas_project/components/menu_drawer.dart';
import 'package:cbdyas_project/components/navigation_bar/navigation_bar.dart';
import 'package:cbdyas_project/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CBDQAndAPage extends StatelessWidget {
  final Auth auth;

  const CBDQAndAPage({Key? key,required this.auth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(auth: auth,),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.0,
            ),
            Text(
              'CBD C&A',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500, fontSize: 42.0),
            ),
            SizedBox(
              height: 40.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                'images/q_and_a.jpg',
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
                  questionLabel(
                      questionText: 'アイソレートに味や匂いはありますか？',
                      answerText: 'アイソレートパウダーは無味無臭です。'),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Q',
                        style: GoogleFonts.sawarabiMincho(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        ' : アイソレートの使用方法は？',
                        style: GoogleFonts.sawarabiMincho(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  useCBDLabel(text: 'VAPEリキッドに追加'),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'CBDリキッドとして販売されている商品に、CBDアイソレートの粉末を溶かすことでCBD濃度をアップさせることができます。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  useCBDLabel(text: 'CBDリキッドを自作'),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'プロピレングリコール（PG）やベジタブルグリセリン（VG）にCBDの結晶を溶かすとCBDリキッドが自作できます。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  useCBDLabel(text: '吸引'),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'CBDアイソレートを加熱して気化したものを吸う方法で、ダビング（Dabbing）と言います。専用のガラスパイプがあれば簡単に吸えます。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  useCBDLabel(text: 'CBDオイルをを自作'),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'CBDアイソレートを食用油に溶かすことで、オリジナルオイルが作れます。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    '主に使用されるのはMCTオイルです。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    'MCTオイルは中鎖脂肪酸なので、吸収速度がとても早いです。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    'その他に使える油',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    ' - ココナッツオイル',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    ' - シアバター',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    ' - ココアバター',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    ' - オリーブオイル',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    'オイルを食べてもいいですし、美容目的で肌に塗ることも可能です。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  useCBDLabel(text: 'そのまま食べる・舌下'),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'CBDの粉末結晶はそのまま口に含んで食べることも可能です。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    '吸収効率を考えるのであれば、舌の下にしばらく含んで粘膜から成分を摂取する舌下摂取の方が良いでしょう。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  useCBDLabel(text: '食べ物・飲み物に入れる'),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'CBDは脂溶性であり水には溶けないため、脂肪分のある料理との相性が良いと言われています。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  Text(
                    'パンケーキ/シロップと一緒に。ヨーグルトなどに混ぜて。CBDは味に影響しないので、グラノーラやサラダ等にふりかけてもいただけます。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  useCBDLabel(text: '紙巻きタバコに混ぜる'),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'タバコの葉を巻く時にCBDの粉末を少し加えれば、CBD入りのタバコが作れます。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'CBDアイソレート(パウダー)は様々な使い方に用いることができる、便利なタイプのCBDです。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  Text(
                    '一般的にCBD初心者には手を出しづらい製品ではありますが、生活に合った方法を見つけ、上手く活用してみてください。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Footer(),
          ],
        ),
      ),
    );
  }

  Text useCBDLabel({required String text}) {
    return Text('<< $text >>',
        style: GoogleFonts.sawarabiMincho(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ));
  }

  Column questionLabel(
      {required String questionText, required String answerText}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Q',
              style: GoogleFonts.sawarabiMincho(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              ' : $questionText',
              style: GoogleFonts.sawarabiMincho(
                fontSize: 22.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12.0,
        ),
        Row(
          children: [
            Text(
              'A',
              style: GoogleFonts.sawarabiMincho(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Text(' : $answerText',
                style: GoogleFonts.sawarabiMincho(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400,
                )),
          ],
        ),
      ],
    );
  }
}
