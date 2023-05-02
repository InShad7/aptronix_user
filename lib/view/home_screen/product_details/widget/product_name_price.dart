import 'package:aaptronix/view/home_screen/widget/fav_icon.dart';
import 'package:aaptronix/view/home_screen/widget/home_item_card.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductNamePrice extends StatelessWidget {
  const ProductNamePrice({super.key, this.product});
  final product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 340,
                child: Text(
                  product['name'],
                  // overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.roboto(
                    height: 1.6,
                    textStyle: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const Spacer(),
              FavIcon(product: product['id']),
              kWidth,
            ],
          ),
          kHeight20,
          Row(
            children: [
              Text(
                "₹ ${product['price']}",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 27,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
