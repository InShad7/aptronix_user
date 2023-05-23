import 'dart:developer';
import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/wish_list_model.dart';
import 'package:aaptronix/view/cart_screen/widget/my_cart_card.dart';
import 'package:aaptronix/view/cart_screen/widget/place_order_btn.dart';
import 'package:aaptronix/view/order_summary_screen/address_screen/select_address_screen.dart';
import 'package:aaptronix/view/order_summary_screen/order_summary_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/bottom_nav_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../splash_screen.dart/spalsh_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    getWishList();
    void removeItemFromCart(String itemId) {
      setState(() {
        myCart.remove(itemId);
      });
    }

    void updatePrice() {
      setState(() {
        int sum = 0;
        if (myProductTotal.isEmpty || myProductTotal[0] == 'no data') {
          total = 0;
        } else {
          for (int i = 0; i < myProductTotal.length; i++) {
            sum = sum + int.parse(myProductTotal[i].toString());
          }
          total = sum;
        }
      });
    }

    void getRefresh(String refresh) {
      setState(() {});
    }

    updatePrice();
    log('cart ${myProductTotal.toString()}');

    return Scaffold(
        backgroundColor: white,
        appBar: NavScreenAppBar(title: 'Cart'),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            if (myCart.isEmpty || myCart[0] == 'no data')
              SizedBox(
                height: 750,
                child: Center(
                  child: Image.asset(
                    'assets/cartempty.jpeg',
                  ),
                ),
              )
            else
              ListView.builder(
                itemCount: myCart.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final filteredList = myProduct
                      .where((item) => myCart.contains(item['id']))
                      .toList()
                    ..sort((a, b) => myCart
                        .indexOf(a['id'])
                        .compareTo(myCart.indexOf(b['id'])));

                  final product = filteredList[index];
                  cartItems = filteredList;

                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const BehindMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            countList.removeAt(index);
                            myProductTotal.removeAt(index);
                            removeItemFromCart(product['id']);
                            updateFirebase();

                            Fluttertoast.showToast(
                              msg: "Item removed from cart 🛒",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: black,
                              textColor: Colors.white,
                              fontSize: 15.0,
                            );
                          },
                          backgroundColor:
                              const Color.fromARGB(255, 213, 78, 68),
                          icon: Icons.close_rounded,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: CartCard1(
                      index: index,
                      product: product,
                      onRemove: removeItemFromCart,
                      updateTotal: updatePrice,
                      buynow: false,
                    ),
                  );
                },
              ),
          ],
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Container(
            height: 90,
            width: mWidth,
            decoration: BoxDecoration(
              color: white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 160,
                    child: Text(
                      'Total :  ₹ ${total}',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 47,
                    width: 165,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (total == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Cart empty...!  Add items to cart',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(fontSize: 19),
                                ),
                              ),
                              backgroundColor: deleteRed,
                            ),
                          );
                        } else {
                          final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderSummaryScreen(),
                              ));
                          if (result == 'refresh') {
                            getRefresh('refresh');
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      child: Text(
                        'Continue',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 22,
                              color: white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
}
