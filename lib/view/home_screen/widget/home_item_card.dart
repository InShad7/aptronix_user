import 'dart:developer';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/home_screen/product_details/product_details.dart';
import 'package:aaptronix/view/home_screen/widget/fav_icon.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class HomeItemCards extends StatefulWidget {
  const HomeItemCards({super.key, this.search = false});
  final search;

  @override
  State<HomeItemCards> createState() => _HomeItemCardsState();
}

class _HomeItemCardsState extends State<HomeItemCards> {
  bool a = false;
  void getUpdate(String refresh) {
    setState(() {
      if (refresh == 'refresh') {
        a = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (buyNow.isNotEmpty) {
      buyNow.clear();
      buyNowItem = '';
      log('buy from build ${buyNow}');
      log('buy from build ${buyNowItem}');
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.search ? '' : "New Arrival",
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          kHeight,
          StreamBuilder(
              stream: getProducts(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: 600,
                    child: Center(
                        child: SizedBox(
                      height: 50,
                      width: 50,
                      child: LoadingIndicator(
                        indicatorType: Indicator.circleStrokeSpin,
                        colors: [blue],
                        strokeWidth: 1,
                      ),
                    )),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done ||
                    snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    iphoneList = data
                        .where((item) => 'iPhone' == item['category'])
                        .toList();
                    ipadList = data
                        .where((item) => 'iPad' == item['category'])
                        .toList();
                    watchList = data
                        .where((item) => 'iWatch' == item['category'])
                        .toList();
                    macList = data
                        .where((item) => 'MacBook' == item['category'])
                        .toList();
                    buyNow = myProduct
                        .where((item) => buyNowItem == item['id'])
                        .toList();
                    log('buy from home ${buyNow}');
                    categoryList = myProduct = data;

                    return (widget.search ? searchList.length : data.length) > 0
                        // snapshot.data!.isEmpty
                        // ? const Center(child: Text('List empty')):
                        ? GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: (2 / 2.6),
                            ),
                            itemCount:
                                widget.search ? searchList.length : data.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final product = widget.search
                                  ? searchList[index]
                                  : data[index];
                              log(searchList.length.toString());
                              return Container(
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: grey)),
                                child: Column(children: [
                                  InkWell(
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 12),
                                      height: 150,
                                      width: 150,
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
                                          builder: (context) =>
                                              ProductDetailsScreen(
                                                  product: product),
                                        ),
                                      );
                                      if (result == 'refresh') {
                                        getUpdate('refresh');
                                      }
                                    },
                                  ),
                                  kHeight15,
                                  Container(
                                    height: 60,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          kHeight,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Flexible(
                                                child: InkWell(
                                                  child: Text(
                                                    product['name'],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.roboto(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProductDetailsScreen(
                                                                product:
                                                                    product),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              kWidth,
                                              kWidth5,
                                              FavIcon(product: product['id'])
                                            ],
                                          ),
                                          InkWell(
                                            child: Text(
                                              '₹ ${product['price']}',
                                              style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                    fontSize: 18),
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductDetailsScreen(
                                                          product: product),
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
                              // : null;
                            })
                        : Center(
                            child: Image.asset('assets/nomatchfound.jpeg'));
                  }
                }
                return Text('Cant fetch data');
              })
        ],
      ),
    );
  }
}
