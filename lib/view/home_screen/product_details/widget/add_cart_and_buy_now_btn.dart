import 'dart:developer';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/wish_list_model.dart';
import 'package:aaptronix/view/order_summary_screen/address_screen/select_address_screen.dart';
import 'package:aaptronix/view/order_summary_screen/order_summary_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCartAndBuyNow extends StatelessWidget {
  const AddCartAndBuyNow({super.key, required this.product});
  final product;
  @override
  Widget build(BuildContext context) {
    getWishList();
    if (myProductTotal.isEmpty || myProductTotal[0] == 'no data') {
      total = 0;
    } else {
      int sum = 0;
      for (int i = 0; i < myProductTotal.length; i++) {
        sum = sum + int.parse(myProductTotal[i].toString());
      }
      total = sum;
    }
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
        color: blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () async {
              if (product['quantity'] == 0) {
                Fluttertoast.showToast(
                    msg: 'Out of stock', backgroundColor: deleteRed);
              } else {
                if (myCart.contains(product['id'])) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavBar(cart: true),
                    ),
                  );
                  Fluttertoast.showToast(
                    msg: "Already in the cart !!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: red,
                    textColor: Colors.white,
                    fontSize: 15.0,
                  );
                } else {
                  await getWishList();
                  myCart.add(product['id']);
                  countList.add(1);
                  myProductTotal.add(int.parse(product['price']) * 1);
                  updateFirebase();
                  log(myCart.toString());
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavBar(cart: true),
                    ),
                  );

                  Fluttertoast.showToast(
                    msg: "Added to Cart 🛒",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 15.0,
                  );
                }
              }
            },
            child: Text(
              myCart.contains(product['id']) ? 'Go to Cart' : 'Add to Cart',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(fontSize: 22, color: white),
              ),
            ),
          ),
          SizedBox(
            height: 48,
            width: 180,
            child: ElevatedButton(
              onPressed: () {
                if (product['quantity'] == 0) {
                  Fluttertoast.showToast(
                      msg: 'Out of stock', backgroundColor: deleteRed);
                } else {
                  buyNowItem = product['id'];
                  buyNowCount = 1;
                  buyNowTotals = int.parse(product['price']) * 1;
                  updateFirebase();
                  log(buyNowItem.toString());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderSummaryScreen(buyNow: true),
                    ),
                  );

                  Fluttertoast.showToast(
                    msg: "Ready to purchase",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 15.0,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Text(
                'Buy Now',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 22,
                    color: black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
