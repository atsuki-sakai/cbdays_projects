import 'package:cbdyas_project/components/mobile_desctop_view.dart';
import 'package:cbdyas_project/constants/products_data.dart';
import 'package:cbdyas_project/screens/home_page/product_item.dart';
import 'package:cbdyas_project/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsContents extends StatelessWidget {
  final Auth auth;
  const ProductsContents({Key? key,required this.auth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MobileDesktopView(
      mobileView: MobileProductsContents(auth: auth,),
      tableView: TabletProductsContents(auth: auth,),
      desktopView: DesktopProductsContents(auth: auth,),
    );
  }
}

class MobileProductsContents extends StatelessWidget {
  final Auth auth;
  const MobileProductsContents({Key? key,required this.auth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 70,
          width: 2,
          color: Colors.black,
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'Products',
          style: GoogleFonts.montserrat(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          children: [
            for(var product in productDatas)...{
              ProductItem(data: product, auth: auth,),
              SizedBox(
                height: 20,
              ),
            },
          ],
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class TabletProductsContents extends StatelessWidget {
  final Auth auth;

  const TabletProductsContents({Key? key,required this.auth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 100,
          width: 2,
          color: Colors.black,
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          'Products',
          style: GoogleFonts.montserrat(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              for(var data in productDatas)...{
                Expanded(
                  child: ProductItem(data: data,auth: auth,),
                ),
              },
            ],
          ),
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
  }
}

class DesktopProductsContents extends StatelessWidget {
  final Auth auth;
  const DesktopProductsContents({Key? key,required this.auth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 120,
          width: 2,
          color: Colors.black,
        ),
        SizedBox(
          height: 60,
        ),
        Text(
          'Products',
          style: GoogleFonts.montserrat(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              for(var data in productDatas)...{
                Expanded(
                  child: ProductItem(data: data,auth: auth,),
                ),
              },
            ],
          ),
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
