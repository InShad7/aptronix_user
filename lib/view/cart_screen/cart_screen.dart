import 'dart:developer';
import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/wish_list_model.dart';
import 'package:aaptronix/view/cart_screen/widget/place_order_btn.dart';
import 'package:aaptronix/view/order_summary_screen/order_summary_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/bottom_nav_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    getWishList();
    return Scaffold(
      backgroundColor: white,
      appBar: NavScreenAppBar(title: 'Cart'),
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
                if (myCart.isEmpty || myCart[0] == 'no data') {
                  return SizedBox(
                    height: 750,
                    child: Image.asset(
                      'assets/cart1.jpeg',
                    ),
                  );
                }
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  return snapshot.data!.isEmpty
                      ? const Center(child: Text('List empty'))
                      : ListView.builder(
                          itemCount: myCart.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final filteredList = data
                                .where(
                                  (item) => myCart.contains(item['id']),
                                )
                                .toList();
                            log(myCart.toString());
                            final product = filteredList[index];
                            return Slidable(
                              endActionPane: ActionPane(
                                motion: const BehindMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {},
                                    backgroundColor:
                                        const Color.fromARGB(255, 213, 78, 68),
                                    icon: Icons.close_rounded,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: CartCard1(product: product),
                            );
                          });
                }
              }
              return const Center(child: Text('Cant fetch items'));
            }),
        kHeight100,
      ]),
      bottomSheet: PlaceOrderBtn(
        label: 'Place Order',
        ht: 140,
        botomSpace: 58,
        clr: false,
        navigateTo: const OrderSummaryScreen(),
      ),
    );
  }

  Widget CartCard1({required product}) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5),
      child: Container(
        height: 115,
        decoration: BoxDecoration(
          color: cardClr,
          borderRadius: BorderRadius.circular(18),
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
                  Row(
                    children: [
                      SizedBox(
                        width: 280,
                        child: Text(
                          product['name'],
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  ),
                  kHeight,
                  Text(
                    '${product['size']} GB',
                    style:
                        GoogleFonts.roboto(textStyle: TextStyle(fontSize: 17)),
                  ),
                  Row(
                    children: [
                      Text(
                        '₹ ${product['price']}',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(fontSize: 20),
                        ),
                      ),
                      QuantityCounter(product: product)
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

class QuantityCounter extends StatefulWidget {
  QuantityCounter({super.key, this.product});
  final product;
  

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 86.5),
      child: Row(
        children: [
          kWidth,
          IconButton(
            onPressed: () {
              setState(() {
                if (count == 0) {
                  myCart.remove(widget.product['id']);

                  WishList myWishobj = WishList(wishList: myCart, cart: myCart);
                  myWishobj.addToWishList();

                  Fluttertoast.showToast(
                    msg: "Item removed from cart 🛒",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: black,
                    textColor: Colors.white,
                    fontSize: 15.0,
                  );

                  print('remove');
                } else {
                  count--;
                  log(count.toString());
                }
              });
            },
            icon: Icon(Icons.remove),
          ),
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                '${count + 1}',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(fontSize: 18, color: white),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                if (widget.product['quantity'] == count) {
                  Fluttertoast.showToast(
                    msg: "Limit exceeded 🛒",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: red,
                    textColor: Colors.white,
                    fontSize: 15.0,
                  );
                } else {
                  count++;
                }

                log(count.toString());
              });

              print('add');
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
