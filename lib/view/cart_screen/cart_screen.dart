import 'package:aaptronix/view/cart_screen/widget/cart_card.dart';
import 'package:aaptronix/view/cart_screen/widget/place_order_btn.dart';
import 'package:aaptronix/view/order_summary_screen/order_summary_screen.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/bottom_nav_app_bar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navScreenAppBar(title: 'Cart'),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        ListView.builder(
          itemCount: 8,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => cartCard(),
        ),
        kHeight100,
      ]),
      bottomSheet: placeOrderBtn(
        context: context,
        label: 'Place Order',
        ht: 140,
        botomSpace: 58,
        clr: false,
        navigateTo: OrderSummaryScreen(),
      ),
    );
  }
}
