
import 'package:cbdyas_project/components/show_alert.dart';
import 'package:cbdyas_project/model/cbdays_user.dart';
import 'package:cbdyas_project/model/routes.dart';
import 'package:cbdyas_project/screens/sign_in_page/login_page/login_page.dart';
import 'package:cbdyas_project/service/auth.dart';
import 'package:flutter/material.dart';


class SubNavigationBar extends StatelessWidget {
  const SubNavigationBar({required this.auth,this.iconSize = 28});
  final iconSize;
  final Auth auth;

  void pushLoginPage(BuildContext context) {
    print('login');
    Navigator.pushNamed(context, Routes.loginPage);
  }
  void signOut(BuildContext context) async {
    print('logout');
    if(auth.currentUser != null){
      try {
        await auth.logOut(uid: auth.currentUser!.uid);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Log Out.'), duration: Duration(seconds: 3),));
      }catch(e){
        print(e);
      }
    }
  }
  void pushCartPage(BuildContext context) {
    Navigator.pushNamed(context, Routes.cartPage);
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CbdaysUser?>(
      stream: auth.userStream,
      builder: (context, snapshot) {
        final user = snapshot.data;
        return Row(
          children: [
            Stack(
              children: [
                if(user != null)...{
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      height: 12,
                      width: 12,
                      color: Colors.green,
                    ),
                  )
                },
                IconButton(
                  tooltip: user == null ? 'Login' : 'Logout',
                  onPressed: user == null ? () => pushLoginPage(context) : () => signOut(context),
                  icon: Icon(
                    user == null ? Icons.login : Icons.logout,
                    size: iconSize,
                  ),
                ),
              ],
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
                  onPressed: () => pushCartPage,
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
    );
  }
}
