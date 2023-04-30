import 'dart:developer';
import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/wish_list_model.dart';
import 'package:aaptronix/view/home_screen/product_details/product_details.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/bottom_nav_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    log(myWishList.length.toString());
    return Scaffold(
      backgroundColor: white,
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
                if (myWishList.isEmpty || myWishList[0] == 'no data') {
                  return SizedBox(
                    height: 750,
                    child: Image.asset('assets/no data.jpeg'),
                  );
                }
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  return snapshot.data!.isEmpty
                      ? const Center(child: Text('List empty'))
                      : ListView.builder(
                          itemCount: myWishList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final filteredList = data
                                .where(
                                  (item) => myWishList.contains(item['id']),
                                )
                                .toList();
                            log(filteredList.toString());

                            final product = filteredList[index];
                            return WishListCard(product);
                          });
                }
              }
              return const Center(child: Text('Cant fetch items'));
            })
      ]),
    );
  }

  Padding WishListCard(product) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5),
      child: InkWell(
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
                  kWidth15,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          product['name'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${product['size'].toString()} GB',
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(fontSize: 17)),
                          ),
                          // const Spacer(),
                          // FavIcon()
                        ],
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
                  wishlistRemoveBtn(product),
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

  IconButton wishlistRemoveBtn(product) {
    return IconButton(
      onPressed: () {
        setState(() {
          myWishList.remove(product['id']);

          WishList myWishobj = WishList(wishList: myWishList,cart: myCart);
          myWishobj.addToWishList();

          Fluttertoast.showToast(
            msg: "Item removed from whishlist 💔",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: black,
            textColor: Colors.white,
            fontSize: 15.0,
          );
        });
      },
      icon: Icon(
        Icons.favorite,
        color: red,
      ),
    );
  }
}
