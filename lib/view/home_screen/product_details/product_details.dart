import 'package:aaptronix/view/home_screen/product_details/widget/add_cart_and_buy_now_btn.dart';
import 'package:aaptronix/view/home_screen/product_details/widget/dropdown_list.dart';
import 'package:aaptronix/view/home_screen/product_details/widget/product_curosel.dart';
import 'package:aaptronix/view/home_screen/product_details/widget/product_name_price.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:aaptronix/view/widget/text_filed.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, this.product});
  final product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Product Details'),
      body: ListView(
          // shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            ProductCurosel(imgs: product['images']),
            ProductNamePrice(product: product),
            kHeight,
            CustomTextField(
              num: false,
              max: 1,
              content: product['color'],
              readOnly: true,
              label: 'Color',
            ),
            CustomTextField(
              num: true,
              max: 1,
              content: product['size'].toString(),
              readOnly: true,
              label: 'Size',
            ),
            kHeight5,
            CustomTextField(
              label: 'About this product',
              num: false,
              max: 20,
              content: product['description'],
              readOnly: true,
            ),
            kHeight20,
          ]),
      bottomNavigationBar:  AddCartAndBuyNow(product: product),
    );
  }
}
