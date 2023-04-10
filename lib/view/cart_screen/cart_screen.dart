import 'package:aaptronix/view/cart_screen/widget/cart_card.dart';
import 'package:aaptronix/view/cart_screen/widget/place_order_btn.dart';
import 'package:aaptronix/view/order_summary_screen/order_summary_screen.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/bottom_nav_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavScreenAppBar(title: 'Cart'),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        ListView.builder(
          itemCount: 8,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Slidable(
            endActionPane: ActionPane(
              motion:const BehindMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {},
                  backgroundColor:const Color.fromARGB(255, 213, 78, 68),
                  icon: Icons.close_rounded,
                  label: 'Delete',
                ),
              ],
            ),
            child:const CartCard(),
          ),
        ),
        kHeight100,
      ]),
      bottomSheet: PlaceOrderBtn(
        label: 'Place Order',
        ht: 140,
        botomSpace: 58,
        clr: false,
        navigateTo:const OrderSummaryScreen(),
      ),
    );
  }
}
