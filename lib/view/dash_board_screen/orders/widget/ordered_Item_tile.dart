import 'package:aaptronix/view/dash_board_screen/orders/order_details_screen/order_details_screen.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderedItemTile extends StatelessWidget {
  const OrderedItemTile(
      {super.key, required this.index, this.product, this.data, this.refresh});
  final int index;
  final product;
  final data;
  final refresh;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.0, right: 17, top: 5),
      child: InkWell(
          child: Container(
            height: 110,
            width: mWidth! / 1.1,
            decoration: BoxDecoration(
              color: cardClr,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 90,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: white,
                    ),
                    child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          Image.asset('assets/APPRONIX.jpg'),
                      imageUrl: product['images'][0],
                    ),
                  ),
                  kWidth,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: mWidth! / 1.7,
                        child: Text(
                          product['name'],
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        data['status'],
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 19,
                              color: data['status'] == 'Ordered'
                                  ? black
                                  : data['status'] == 'Shipped'
                                      ? blue1
                                      : data['status'] == 'Cancelled'
                                          ? red
                                          : data['status'] == 'Out Of Delivery'
                                              ? yellow
                                              : Colors.green),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderDetailsScreen(
                    product: product, index: index, data: data),
              ),
            );
            if (result == 'refresh') {
              refresh();
            }
          }),
    );
  }
}
