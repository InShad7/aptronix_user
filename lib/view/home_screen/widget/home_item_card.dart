import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/home_screen/product_details/product_details.dart';
import 'package:aaptronix/view/home_screen/widget/fav_icon.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class HomeItemCards extends StatelessWidget {
  const HomeItemCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New Arrival",
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
                    final data = snapshot.data;
                    return snapshot.data!.isEmpty
                        ? const Center(child: Text('List empty'))
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: (2 / 2.6),
                            ),
                            itemCount: data.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final product = data[index];
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
                                        // image: DecorationImage(
                                        //     image: NetworkImage(
                                        //         product['images'][0],

                                        //         ),

                                        // fit: BoxFit.contain
                                        // ),
                                      ),
                                      child: FadeInImage.assetNetwork(
                                        placeholder: 'assets/APPRONIX.jpg',
                                        image: product['images'][0],
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
                                              FavIcon()
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
                            });
                  }
                }
                return Text('Cant fetch data');
              })
        ],
      ),
    );
  }
}
