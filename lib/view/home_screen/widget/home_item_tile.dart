import 'package:aaptronix/view/home_screen/widget/fav_icon.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/utils.dart';
import '../product_details/product_details.dart';

Widget homeItemTile({product, context, getUpdate}) {
  return Container(
    decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: grey)),
    width: 200,
    child: Column(children: [
      InkWell(
        child: Container(
          margin: const EdgeInsets.only(top: 12),
          height: mHeight! / 6,
          width: mHeight! / 6,
          decoration: BoxDecoration(
            // color: white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CachedNetworkImage(
            placeholder: (context, url) => Image.asset(
                'assets/APPRONIX.jpg'), // Add whatever you want to display.
            imageUrl: product['images'][0],
          ),
        ),
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(product: product),
            ),
          );
          if (result == 'refresh') {
            getUpdate('refresh');
          }
        },
      ),
      const Spacer(),
      Container(
        height: mHeight! / 12,
        width: 170,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: InkWell(
                      child: Text(
                        product['name'],
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsScreen(product: product),
                          ),
                        );
                      },
                    ),
                  ),
                  kWidth,
                  kWidth,
                  FavIcon(product: product['id'])
                ],
              ),
              kHeight5,
              InkWell(
                child: Text(
                  '₹ ${product['price']}',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsScreen(product: product),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      )
      
    ]),
  );
}
