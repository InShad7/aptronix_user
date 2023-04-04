import 'package:aaptronix/home_screen/product_details/widget/add_cart_and_buy_now_btn.dart';
import 'package:aaptronix/home_screen/product_details/widget/dropdown_list.dart';
import 'package:aaptronix/home_screen/product_details/widget/product_curosel.dart';
import 'package:aaptronix/home_screen/product_details/widget/product_name_price.dart';
import 'package:aaptronix/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/utils/colors.dart';
import 'package:aaptronix/utils/utils.dart';
import 'package:aaptronix/widget/custom_app_bar.dart';
import 'package:aaptronix/widget/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title: 'Product Details'),
      body: ListView(physics: BouncingScrollPhysics(), children: [
        ProductCurosel(),
        productNamePrice(),
        kHeight,
        DropDownList(),
        kHeight5,
        DropDownList2(),
        customTextField(
          label: 'Description',
          ht: 200,
          width: double.infinity,
          num: false,
          max: 10,
          content:
              '128 GB ROM\n15.49cm (6.1inch)Super Retina XDR display\n48MP + 12MP + 12MP|12MP Front Camera\nA16 Bionic Chip 6 Core Processor',
          readOnly: true,
        ),
        kHeight20,
      ]),
      bottomNavigationBar: addCartAndBuyNow(),
    );
  }
}
