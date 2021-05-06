import 'package:cbdyas_project/components/footer.dart';
import 'package:cbdyas_project/components/mobile_desctop_view.dart';
import 'package:cbdyas_project/constants/products_data.dart';
import 'package:cbdyas_project/model/cbdays_user.dart';
import 'package:cbdyas_project/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle nameTextStyle() {
  return GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.bold);
}

TextStyle descriptionTextStyle() {
  return GoogleFonts.montserrat(
      fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey);
}

TextStyle priceTextStyle() {
  return GoogleFonts.montserrat(
      fontSize: 22, fontWeight: FontWeight.w700, color: Colors.blue);
}

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key, required this.auth, this.data})
      : super(key: key);
  final Auth auth;
  final ProductData? data;

  @override
  Widget build(BuildContext context) {
    return MobileDesktopView(
      mobileView: MobileItemDetailPage(
        auth: auth,
        data: data!,
      ),
      tableView: MobileItemDetailPage(
        auth: auth,
        data: data!,
      ),
      desktopView: DesktopItemDetailPage(
        auth: auth,
        data: data!,
      ),
    );
  }
}

class MobileItemDetailPage extends StatelessWidget {
  MobileItemDetailPage({Key? key, required this.auth, required this.data})
      : super(key: key);
  final Auth auth;
  final ProductData data;
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 42),
        child: SingleChildScrollView(
          child: StreamBuilder<CbdaysUser?>(
              stream: auth.userStream,
              builder: (context, snapshot) {
                final _user = snapshot.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      data.name,
                      style: nameTextStyle(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      data.imagePath,
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      data.description,
                      style: descriptionTextStyle(),
                    ),
                    SizedBox(
                      height: 42,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          '¥ ${(_user != null ? data.price * 0.8 : data.price).round().toString()}',
                          style: priceTextStyle(),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Text(
                          '個数',
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        AmountTextField(onChanged: (amount) {
                          this.amount = amount;
                        }),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton.icon(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('商品をカートに追加しますか?'),
                                        content: Text(
                                            '${data.name}を$amount個カートに追加します。よろしいですか?'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                // TODO - Add To Cart
                                                print(
                                                    '${data.name}を$amount個購入します。合計金額は¥${((_user != null ? data.price * 0.8 : data.price) * amount).toInt().toString()}です。');
                                                Navigator.pop(context);
                                              },
                                              child: Text('OK')),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Cancel'))
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.add_shopping_cart),
                              label: Text('Add')),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    Footer(),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class DesktopItemDetailPage extends StatelessWidget {
  DesktopItemDetailPage({Key? key, required this.auth, required this.data})
      : super(key: key);
  final Auth auth;
  final ProductData data;
  int amount = 1;

  // double get price => auth.currentUser == null ? data.price : data.price * 0.8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 42),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: StreamBuilder<CbdaysUser?>(
                stream: auth.userStream,
                builder: (context, snapshot) {
                  final _user = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        data.name,
                        style: nameTextStyle(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        data.imagePath,
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Text(
                        data.description,
                        style: descriptionTextStyle(),
                      ),
                      SizedBox(
                        height: 42,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Spacer(
                            flex: 1,
                          ),
                          Text(
                            '¥ ${(_user != null ? data.price * 0.8 : data.price).round().toString()}',
                            style: priceTextStyle(),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          Text(
                            '注文個数',
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          AmountTextField(onChanged: (amount) {
                            this.amount = amount;
                          }),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton.icon(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('商品をカートに追加しますか?'),
                                          content: Text(
                                              '${data.name}を$amount個カートに追加します。よろしいですか?'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  // TODO - Add To Cart
                                                  print(
                                                      '${data.name}を$amount個購入します。合計金額は¥${((_user != null ? data.price * 0.8 : data.price) * amount).toInt().toString()}です。');
                                                  Navigator.pop(context);
                                                },
                                                child: Text('OK')),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Cancel'))
                                          ],
                                        );
                                      });
                                },
                                icon: Icon(Icons.add_shopping_cart),
                                label: Text('Add')),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      Footer(),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class AmountTextField extends StatefulWidget {
  final Function(int) onChanged;

  const AmountTextField({Key? key, required this.onChanged}) : super(key: key);

  @override
  _AmountTextFieldState createState() => _AmountTextFieldState();
}

class _AmountTextFieldState extends State<AmountTextField> {
  final _amountTextController = TextEditingController();

  bool get isValid =>
      int.tryParse(_amountTextController.text) != null ? true : false;

  int get amount => int.tryParse(_amountTextController.text) == null
      ? 1
      : int.parse(_amountTextController.text);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _amountTextController.text = 1.toString();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _amountTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 60,
      child: TextField(
        controller: _amountTextController,
        decoration: InputDecoration(
            hintText: '数字のみ', errorText: isValid ? null : '数字を入力して下さい。'),
        onChanged: (_) {
          widget.onChanged(amount);
        },
      ),
    );
  }
}
