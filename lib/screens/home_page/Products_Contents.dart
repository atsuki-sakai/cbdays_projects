import 'package:cbdyas_project/components/mobile_desctop_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cbdyas_project/components/hover_extension.dart';

class ProductsContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopView(
      mobileView: MobileProductsContents(),
      tableView: TabletProductsContents(),
      desktopView: DesktopProductsContents(),
    );
  }
}

class MobileProductsContents extends StatelessWidget {
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
        Column(
          children: [
            ProductItem(
              name: 'CBD Hand Cream',
              imagePath: 'images/header_1.jpeg',
              price: 4980.0,
              onTap: () {
                print('CBD Hand Cream Taped');
              },
            ),
            SizedBox(
              height: 20,
            ),
            ProductItem(
              name: 'CBD OIL',
              imagePath: 'images/header_2.jpeg',
              price: 3880.0,
              onTap: () {
                print('CBD OIL Taped');
              },
            ),
            SizedBox(
              height: 20,
            ),
            ProductItem(
              name: 'CBD Vape',
              imagePath: 'images/header_1.jpeg',
              price: 6980.0,
              onTap: () {
                print('CBDVApe Taped');
              },
            ),
          ],
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
  }
}

class TabletProductsContents extends StatelessWidget {
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
              Expanded(
                child: ProductItem(
                  fontSize: 17.0,
                  iconSize: 17.0,
                  name: 'CBD Hand Cream',
                  imagePath: 'images/header_1.jpeg',
                  price: 4980.0,
                  onTap: () {
                    print('CBD Hand Cream Taped');
                  },
                ),
              ),
              Expanded(
                child: ProductItem(
                  fontSize: 17.0,
                  iconSize: 17.0,
                  name: 'CBD OIL',
                  imagePath: 'images/header_2.jpeg',
                  price: 3880.0,
                  onTap: () {
                    print('CBD OIL Taped');
                  },
                ),
              ),
              Expanded(
                child: ProductItem(
                  fontSize: 17.0,
                  iconSize: 17.0,
                  name: 'CBD Vape',
                  imagePath: 'images/header_1.jpeg',
                  price: 6980.0,
                  onTap: () {
                    print('CBDVApe Taped');
                  },
                ),
              ),
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
              Expanded(
                child: ProductItem(
                  name: 'CBD Hand Cream',
                  imagePath: 'images/header_1.jpeg',
                  price: 4980.0,
                  onTap: () {
                    print('CBD Hand Cream Taped');
                  },
                ),
              ),
              Expanded(
                child: ProductItem(
                  name: 'CBD OIL',
                  imagePath: 'images/header_2.jpeg',
                  price: 3880.0,
                  onTap: () {
                    print('CBD OIL Taped');
                  },
                ),
              ),
              Expanded(
                child: ProductItem(
                  name: 'CBD Vape',
                  imagePath: 'images/header_1.jpeg',
                  price: 6980.0,
                  onTap: () {
                    print('CBDVApe Taped');
                  },
                ),
              ),
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

class ProductItem extends StatelessWidget {
  final String imagePath;
  final double fontSize;
  final String name;
  final double price;
  final Function onTap;
  final double iconSize;
  const ProductItem({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.onTap,
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
            Image.asset(imagePath),
            SizedBox(
              height: 12.0,
            ),
            Text(
              name,
              style: GoogleFonts.montserrat(
                  fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Price : ${price.round()}¥　(税込)',
              style: GoogleFonts.montserrat(
                fontSize: fontSize - 4,
                fontWeight: FontWeight.w300,
                color: Colors.grey[600],
              ),
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
                  onTap: onTap(),
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
                        'Add to Cart.',
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
