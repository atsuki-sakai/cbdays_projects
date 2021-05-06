import 'package:cbdyas_project/components/footer.dart';
import 'package:cbdyas_project/components/menu_drawer.dart';
import 'package:cbdyas_project/components/navigation_bar/navigation_bar.dart';
import 'package:cbdyas_project/service/auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';


class CBDHistoryPage extends StatelessWidget {
  final Auth auth;

  const CBDHistoryPage({Key? key,required this.auth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 800 ? true: false;
    return Scaffold(
      appBar: NavigationBar(auth: auth,),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: isSmall ? 32.0 : 40.0,
            ),
            Container(
              width: isSmall ? MediaQuery.of(context).size.width * 0.9 : MediaQuery.of(context).size.width * 0.7,
              child: Column(
                children: [
                  Text(
                    'CBDの始まり',
                    style: GoogleFonts.sawarabiMincho(
                        fontWeight: FontWeight.w500, fontSize: isSmall ? 32.0 : 42.0),
                  ),
                  SizedBox(
                    height: isSmall ? 32.0 : 40.0,
                  ),
                  Text(
                    '時代は、1940年代。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: isSmall ? 17.0 : 20.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'ハーバード大学卒業のアメリカの科学者ロジャー・アダムスが、CBD化合物を初めて単離させたことから歴史は始まりました。しかしこの時、大麻草からCBD単体を抽出することに成功していたにもかかわらず、その化合物を抽出したことに彼自身気づいていなかったのです。数年後になって、ロジャー・アダムス科学者らが、当時の事実に気づき、CBDのもたらす潜在的可能性について研究をスタートさせました。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: isSmall ? 16.0 : 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'そして、2013年にアメリカのCNNが放送した「シャーロット・フィギ（Charlotte Figi）」のドキュメンタリー番組によって、多くの人が驚愕し、CBDオイルが広く世の中に知れ渡ることとなりました。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: isSmall ? 16.0 : 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'この「シャーロット・フィギ」の物語は、てんかんを患う子供が、CBDによって劇的に発作を減少させたことを公表するものでした。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: isSmall ? 16.0 : 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '子供の希少型てんかんであるドラべ症候群を患うシャーロットは、生まれてわずか3ヶ月後に最初の発作を経験し、5歳になる時には、1週間に300回を超える激しい発作に苦しんでいました。医学による効果的治療も使い尽くされ、小さな体は、完全に衰弱し、心臓も何度も止まる中、最後の望みをかけたのが、大麻由来のCBDオイルだったのです。その結果はすぐに顕著に表れました。シャーロットの発作は、月2、3回と劇的に減り、健康的な普通の生活を送れるようになったのです。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: isSmall ? 16.0 : 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'シャーロットのCBDオイル物語により、助けられた子供の話は増え続け、大麻の使用を合法化する医師や研究者も増え、CBDが処方薬に伴う副作用なく、てんかん発作を調節できることを示す科学的研究も増えています。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: isSmall ? 16.0 : 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '科学的および医学的研究の発展とともに、2003年に米国政府は、神経保護剤として使用されてる最初のCBDベースの特許を取得しました。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: isSmall ? 16.0 : 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'そして、2017年にFDA（アメリカ食品医薬品局）は、医療用CBDを承認するための第一歩を踏み出し、CBDが初めてアメリカの医薬品として2018年に承認されました。それが、CBDを主成分とするてんかん治療薬 「エピディオレックス」です。これは、イギリスの製薬会社 GWファーマシューティカルズにより開発された、子供の希少疾患であるドラべ症候群の治療を目的とした医薬品です。',
                    style: GoogleFonts.sawarabiMincho(
                        fontSize: isSmall ? 16.0 : 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    '〜シャーロット・フィギの物語〜',
                    style: GoogleFonts.sawarabiMincho(
                      fontSize: isSmall ? 16.0 :  26.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: isSmall ? 32.0 : 40,
                  ),
                ],
              ),
            ),
            VideoPlayer(),
            SizedBox(
              height: 40,
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class VideoPlayer extends StatefulWidget {
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'GR6ibJnC0rs',
    params: YoutubePlayerParams(
      startAt: Duration(seconds: 0),
      showControls: true,
      showFullscreenButton: true,
    ),
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: YoutubePlayerControllerProvider(
          controller: _controller,
          child: YoutubePlayerIFrame(
            aspectRatio: 16 / 9,
          )),
    );
  }
}
