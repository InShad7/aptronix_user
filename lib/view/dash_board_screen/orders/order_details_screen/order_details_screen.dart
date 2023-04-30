import 'package:aaptronix/view/cart_screen/widget/cart_card.dart';
import 'package:aaptronix/view/dash_board_screen/orders/order_details_screen/widget/delivery_status.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:aaptronix/view/widget/text_filed.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Order Details"),
      body: ListView(children: [
        kHeight20,
        CartCard(quantity: false),
        kHeight,
        CustomTextField(
          label: 'Address',
          ht: 200,
          width: mWidth!,
          num: false,
          max: 10,
          content:
              'address 1\nadmin house /Building /appartment\nArea,street,village\nLandmark\npincode\nPhone number',
          readOnly: true,
        ),
        CustomTextField(
          label: 'Payment',
          ht: 65,
          width: mWidth!,
          num: false,
          max: 1,
          content: 'Credit / Debit Card',
          readOnly: true,
        ),
        kHeight,
        StatusPage(),
      ]),
    );
  }
}
