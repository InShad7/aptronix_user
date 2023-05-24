import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartCard extends StatelessWidget {
  const CartCard(
      {super.key, this.quantity = true, this.data, this.product, this.index});
  final data;
  final bool quantity;
  final product;
  final index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5),
      child: Container(
        height: 110,
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
              kWidth,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 280,
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
                        '₹ ${product['price']} ',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 150),
                        child: Row(
                          children: [
                            Text(
                              'Qty:',
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(fontSize: 17),
                              ),
                            ),
                            kWidth,
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: blue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  data['count'].toString(),
                                  style: GoogleFonts.roboto(
                                    textStyle:
                                        TextStyle(fontSize: 18, color: white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
