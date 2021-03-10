import 'package:flutter/material.dart';

class LoagingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          child: SizedBox(
              height: 220, width: 220, child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
