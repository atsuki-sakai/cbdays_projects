import 'package:cbdyas_project/components/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(),
      body: Center(
        child: Container(
          child: Text('Shop'),
        ),
      ),
    );
  }
}