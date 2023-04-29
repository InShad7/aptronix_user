import 'dart:developer';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/home_screen/widget/fav_icon.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/bottom_nav_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavScreenAppBar(title: 'Wishlist'),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        StreamBuilder(
            stream: getProducts(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: SizedBox(
                  height: 50,
                  width: 50,
                  child: LoadingIndicator(
                    indicatorType: Indicator.circleStrokeSpin,
                    colors: [blue],
                    strokeWidth: 1,
                  ),
                ));
              }
              if (snapshot.connectionState == ConnectionState.done ||
                  snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  return snapshot.data!.isEmpty
                      ? const Center(child: Text('List empty'))
                      : ListView.builder(
                          itemCount: myWishList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final product1 = [];
                            for (int i = 0; i < myWishList.length; i++) {
                              for (int j = 0; j < data.length; j++) {
                                if (myWishList[i] == data[j]['id']) {
                                  product1.add(data[j]);
                                }
                              }
                            }
                            log(product1.toString());
                            final product = product1[index];

                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16, top: 5),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: white,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              product['images'][0],
                                            ),
                                          ),
                                        ),
                                      ),
                                      kWidth15,
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 240,
                                            child: Text(
                                              product['name'],
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '${product['size'].toString()} GB',
                                                style: GoogleFonts.roboto(
                                                    textStyle: const TextStyle(
                                                        fontSize: 17)),
                                              ),
                                              // const Spacer(),
                                              // FavIcon()
                                            ],
                                          ),
                                          Text(
                                            '₹ ${product['price'].toString()}',
                                            style: GoogleFonts.roboto(
                                              textStyle:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      FavIcon(),
                                      kWidth,
                                    ],
                                  ),
                                ),
                              ),
                            );

                            // WishListCard(product: product);
                          });
                }
              }
              return const Center(child: Text('Cant fetch items'));
            })
      ]),
    );
  }
}
