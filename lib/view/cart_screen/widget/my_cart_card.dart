import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/cart_screen/widget/quantity_counter.dart';
import 'package:aaptronix/view/get_started/get_started.dart';
import 'package:aaptronix/view/home_screen/product_details/product_details.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartCard1 extends StatelessWidget {
  const CartCard1({
    super.key,
    this.product,
    this.onRemove,
    this.updateTotal,
    this.index,
    this.buynow,
  });
  final product;
  final onRemove;
  final updateTotal;
  final index;
  final buynow;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5),
      child: InkWell(
        child: Container(
          height: (mHeight! > 925) ? 119 : 123,
          width: mWidth! / 1.1,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              width: 1,
              color: grey,
            ),
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
                    SizedBox(
                      width: mWidth! / 1.7,
                      child: Text(
                        product['name'],
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                      ),
                    ),
                    kHeight,
                    Text(
                      '${product['size']} GB',
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(fontSize: 17)),
                    ),
                    SizedBox(
                      width: mWidth! / 1.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: mWidth! / 6,
                            child: Text(
                              '₹ ${product['price']}',
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          QuantityCounter(
                            index: index,
                            product: product,
                            onRemove: onRemove,
                            updateTotal: updateTotal,
                            buynow: buynow,
                          )
                        ],
                      ),
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
