import 'package:cbdyas_project/constants/products_data.dart';
import 'package:cbdyas_project/model/cbdays_user.dart';
import 'package:cbdyas_project/screens/product_detail/item_detail_page.dart';
import 'package:cbdyas_project/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cbdyas_project/components/hover_extension.dart';

class ProductItem extends StatelessWidget  {
  final ProductData data;
  final double fontSize;
  final double iconSize;
  final Auth auth;
  const ProductItem({
    Key? key,
    required this.auth,
    required this.data,
    this.fontSize = 22.0,
    this.iconSize = 22.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(data.imagePath),
            SizedBox(
              height: 12.0,
            ),
            Text(
              data.name,
              style: GoogleFonts.montserrat(
                  fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8.0,
            ),
            StreamBuilder<CbdaysUser?>(
                stream: auth.userStream,
                builder: (context, snapshot) {
                  final _user = snapshot.data;
                  final price = _user != null ? data.price * 0.8 : data.price;
                  return Text(
                    'Price: ${price.round().toString()}　(税込)',
                    style: GoogleFonts.montserrat(
                      fontSize: fontSize - 4,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey[600],
                    ),
                  );
                }
            ),
            SizedBox(
              height: 20.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                    colors: [
                      const Color(0xffe4a972).withOpacity(0.6),
                      const Color(0xff9941d8).withOpacity(0.6),
                    ],
                    stops: const [
                      0.0,
                      1.0,
                    ],
                  ),
                  border: Border.all(width: 3, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return ProductDetailPage(auth: auth,data: data,);
                    }));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 7.0,
                      ),
                      Icon(
                        Icons.shopping_basket_outlined,
                        color: Colors.white,
                        size: iconSize,
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        'Show Detail.',
                        style: GoogleFonts.montserrat(
                          fontSize: fontSize,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 7.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ).moveUpOnHover;
  }
}
