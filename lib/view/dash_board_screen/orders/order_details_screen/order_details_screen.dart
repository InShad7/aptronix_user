import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/cart_screen/widget/cart_card.dart';
import 'package:aaptronix/view/dash_board_screen/orders/order_details_screen/widget/delivery_status.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:aaptronix/view/widget/text_filed.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, this.product, this.index, this.data});
  final product;
  final index;
  final data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Order Details"),
      body: ListView(children: [
        kHeight20,
        CartCard(
          quantity: false,
          product: product,
          index: index,
          data: data,
        ),
        kHeight,
        CustomTextField(
          label: 'Address',
          ht: 200,
          width: mWidth!,
          num: false,
          max: 10,
          content:
              "${data['address']['name']}\n${data['address']['houseNumber']}\n${data['address']['streetName']}\n${data['address']['city']}\n${data['address']['state']}\n${data['address']['pincode']}\n${data['address']['phoneNumber']}\n",
          readOnly: true,
        ),
        CustomTextField(
          label: 'Total Amount',
          ht: 65,
          width: mWidth!,
          num: false,
          max: 1,
          content: (int.parse(product['price']) * data['count']).toString(),
          readOnly: true,
        ),
        kHeight,
        StatusPage(),
      ]),
    );
  }
}
