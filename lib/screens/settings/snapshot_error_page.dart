import 'package:flutter/material.dart';

class SnapShotErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: double.infinity,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Loading Error',
                    style:
                        TextStyle(fontSize: 42.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    'url is not found...',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey[400]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
