import 'package:aaptronix/view/home_screen/product_details/product_details.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/wish_list_screen/widget/remove_btn.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishListCard extends StatelessWidget {
  const WishListCard(
      {super.key, required this.product, required this.onRemove});
  final product;
  final onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5),
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
                      borderRadius: BorderRadius.circular(8),
                      color: white,
                    ),
                    child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          Image.asset('assets/APPRONIX.jpg'),
                      imageUrl: product['images'][0],
                    ),
                  ),
                  kWidth15,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: mWidth! / 2,
                        child: Text(
                          product['name'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Text(
                        '${product['size'].toString()} GB',
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(fontSize: 17)),
                      ),
                      Text(
                        '₹ ${product['price'].toString()}',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  WhishlistRemoveBtn(product: product, onRemove: onRemove),

                  // kWidth,
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(product: product),
              ),
            );
          }),
    );
  }
}
