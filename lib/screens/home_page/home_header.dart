import 'package:cbdyas_project/components/mobile_desctop_view.dart';
import 'package:cbdyas_project/screens/home_page/fade_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopView(
      desktopView: DesktopHomeHeader(),
      tableView: TabletHomeHeader(),
      mobileView: MobileHomeHeader(),
    );
  }
}

class MobileHomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.95,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: FadeImage(),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'PREMIUM ORGANICS HEMP',
            style: GoogleFonts.montserrat(
              fontSize: 18.0,
              fontWeight: FontWeight.w300,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'CBDAYS  Products',
            style: GoogleFonts.montserrat(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            color: Colors.green.shade600,
            thickness: 2,
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            '''CBDAYSは、特別な瞬間や忙しい日々に手軽に取り入れることで心と体を健やかに保ち、今の時代を生きてゆく上で必要不可欠な自己肯定感を高める、CBDを配合した日本発のライフスタイルブランドです。私たちは、CBDとの出会いを通じて、ひとつの自然物が健康や心の安定、ひいては人生に与える影響の偉大さを感じ、多くの人に届けたいと考えるようになりました。CBDAYSのプロダクトを通じて、多くの方にそんな新しい一日をお届けしたいと考えています。''',
            textAlign: TextAlign.start,
            style: GoogleFonts.sawarabiMincho(
              fontSize: 16.0,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }
}

class TabletHomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.95,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  Text(
                    'PREMIUM ORGANICS HEMP',
                    style: GoogleFonts.montserrat(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'CBDAYS  Products',
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    color: Colors.green.shade600,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    '''CBDAYSは、特別な瞬間や忙しい日々に手軽に取り入れることで心と体を健やかに保ち、今の時代を生きてゆく上で必要不可欠な自己肯定感を高める、CBDを配合した日本発のライフスタイルブランドです。私たちは、CBDとの出会いを通じて、ひとつの自然物が健康や心の安定、ひいては人生に与える影響の偉大さを感じ、多くの人に届けたいと考えるようになりました。CBDAYSのプロダクトを通じて、多くの方にそんな新しい一日をお届けしたいと考えています。''',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.sawarabiMincho(
                      fontSize: 14.0,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FadeImage(),
            ),
          ),
        ],
      ),
    );
  }
}

class DesktopHomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.95,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  Text(
                    'PREMIUM ORGANICS HEMP',
                    style: GoogleFonts.montserrat(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'CBDAYS  Products',
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    color: Colors.green.shade600,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    '''CBDAYSは、特別な瞬間や忙しい日々に手軽に取り入れることで心と体を健やかに保ち、今の時代を生きてゆく上で必要不可欠な自己肯定感を高める、CBDを配合した日本発のライフスタイルブランドです。私たちは、CBDとの出会いを通じて、ひとつの自然物が健康や心の安定、ひいては人生に与える影響の偉大さを感じ、多くの人に届けたいと考えるようになりました。CBDAYSのプロダクトを通じて、多くの方にそんな新しい一日をお届けしたいと考えています。''',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.sawarabiMincho(
                      fontSize: 18.0,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FadeImage(),
            ),
          ),
        ],
      ),
    );
  }
}
