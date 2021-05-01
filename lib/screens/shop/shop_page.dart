import 'package:cbdyas_project/components/navigation_bar/navigation_bar.dart';
import 'package:cbdyas_project/service/auth.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  final Auth auth;

  const ShopPage({Key? key,required this.auth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(auth: auth,),
      body: Center(
        child: Container(
          child: Text('Shop'),
        ),
      ),
    );
  }
}