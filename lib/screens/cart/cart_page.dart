import 'package:cbdyas_project/components/navigation_bar/navigation_bar.dart';
import 'package:cbdyas_project/service/auth.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final Auth auth;

  const CartPage({Key? key,required this.auth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(auth: auth,),
      body: Center(
        child: Text('Cart'),
      ),
    );
  }
}

