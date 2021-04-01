import 'dart:async';

import 'package:flutter/material.dart';

class FadeImage extends StatefulWidget {
  @override
  _FadeImageState createState() => _FadeImageState();
}

class _FadeImageState extends State<FadeImage> {
  Timer crossFadeTimer;
  CrossFadeState crossFadeState = CrossFadeState.showFirst;

  @override
  void initState() {
    crossFadeTimer = Timer.periodic(Duration(milliseconds: 8000), (timer) {
      setState(() {
        if (crossFadeState == CrossFadeState.showFirst) {
          crossFadeState = CrossFadeState.showSecond;
        } else {
          crossFadeState = CrossFadeState.showFirst;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    if (crossFadeTimer != null) {
      crossFadeTimer.cancel();
      crossFadeTimer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Image.asset('images/header_1.jpeg'),
      secondChild: Image.asset('images/header_2.jpeg'),
      duration: Duration(seconds: 1),
      crossFadeState: crossFadeState == CrossFadeState.showFirst
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
    );
  }
}
