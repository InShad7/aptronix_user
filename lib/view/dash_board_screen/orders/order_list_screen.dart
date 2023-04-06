import 'package:aaptronix/view/dash_board_screen/orders/widget/ordered_Item_tile.dart';
import 'package:aaptronix/view/home_screen/widget/category_item_card.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List orderItem = ['iPhone 12', 'iPad Pro', 'Mac air', 'iWatch 7'];

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, title: "Orders"),
      body: ListView.builder(
        itemCount: orderItem.length,
        itemBuilder: (context, index) => orderedItemTile(index),
      ),
    );
  }

}
