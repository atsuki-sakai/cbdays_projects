
import 'package:cbdyas_project/constants/routes.dart';
import 'package:flutter/material.dart';


class SubNavigationBar extends StatelessWidget {
  const SubNavigationBar({this.iconSize = 28});
  final iconSize;

  void pushRoute(BuildContext context ,{required String route}) {
    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          tooltip: 'Login',
          onPressed: () => pushRoute(context, route: Routes.loginPage),
          icon: Icon(
            Icons.person,
            size: iconSize,
          ),
        ),
        SizedBox(
          width: 12.0,
        ),
        Stack(
          children: [
            Container(
              width: 16,
              height: 16,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                // TODO - cartに入っている商品の数を表示
                '0',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              tooltip: 'Cart',
              onPressed: () => pushRoute(context, route: Routes.cartPage),
              icon: Icon(
                Icons.shopping_basket_outlined,
                size: iconSize,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
