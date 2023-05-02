import 'dart:developer';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/cart_screen/widget/quantity_counter.dart';
import 'package:aaptronix/view/home_screen/product_details/product_details.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartCard1 extends StatelessWidget {
  const CartCard1(
      {super.key,
      required this.product,
      required this.onRemove,
      required this.updateTotal,
      this.index});
  final product;
  final onRemove;
  final updateTotal;
  final index;
  @override
  Widget build(BuildContext context) {
    

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5),
      child: InkWell(
        child: Container(
          height: 115,
          decoration: BoxDecoration(
            color: cardClr,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 95,
                  width: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 250,
                          child: Text(
                            product['name'],
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ],
                    ),
                    kHeight,
                    Text(
                      '${product['size']} GB',
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(fontSize: 17)),
                    ),
                    Row(
                      children: [
                        Text(
                          '₹ ${product['price']}',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                        ),
                        QuantityCounter(
                            index: index,
                            product: product,
                            onRemove: onRemove,
                            updateTotal: updateTotal)
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(product: product),
            )),
      ),
    );
  }
}
