import 'package:aaptronix/view/home_screen/widget/fav_icon.dart';
import 'package:aaptronix/view/home_screen/widget/home_item_card.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
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
                width: mWidth! / 1.3,
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "₹ ${product['price']}",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 27,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                product['quantity'] > 0
                    ? product['quantity'] <= 4
                        ? "Hurry only few left!"
                        : "In Stock"
                    : 'Out Of Stock',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontSize: 18,
                      color: product['quantity'] > 0
                          ? product['quantity'] <= 4
                              ? red
                              : Colors.green
                          : red),
                ),
              ),
              kWidth,
            ],
          ),
        ],
      ),
    );
  }
}
