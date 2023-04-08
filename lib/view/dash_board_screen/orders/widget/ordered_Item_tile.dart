import 'package:aaptronix/view/dash_board_screen/orders/order_details_screen/order_details_screen.dart';
import 'package:aaptronix/view/dash_board_screen/orders/order_list_screen.dart';
import 'package:aaptronix/view/home_screen/widget/category_item_card.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderedItemTile extends StatelessWidget {
  const OrderedItemTile({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.0, right: 17, top: 5),
      child: InkWell(
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: cardClr,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: white,
                    image: DecorationImage(
                      image: AssetImage(
                        img[index],
                      ),
                    ),
                  ),
                ),
                kWidth,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderItem[index],
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      'Delivered on 1${index}-02-2023',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(fontSize: 19),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(),
          ),
        ),
      ),
    );
  }
}