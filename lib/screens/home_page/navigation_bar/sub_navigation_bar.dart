import 'package:cbdyas_project/components/neumorphism.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubNavigationBar extends StatelessWidget {
  final double barHeight = 40;
  final iconSize = 30.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: barHeight,
      child: Row(
        children: [
          IconButton(
            tooltip: 'Login',
            onPressed: () {
              Navigator.pushNamed(context, '/signin');
            },
            icon: Icon(
              Icons.person_outline,
              size: iconSize,
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: ClipOval(
                  child: Container(
                    width: 16,
                    height: 16,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: Text(
                      '0',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  tooltip: 'Cart',
                  onPressed: () {
                    //TODO - Transition cart page
                  },
                  icon: Icon(
                    Icons.shopping_basket_outlined,
                    size: iconSize,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
