import 'dart:developer';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/wish_list_model.dart';
import 'package:aaptronix/view/cart_screen/widget/my_cart_card.dart';
import 'package:aaptronix/view/cart_screen/widget/place_order_btn.dart';
import 'package:aaptronix/view/payment_screen/payment_screen.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:aaptronix/view/widget/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({super.key, this.buyNow = false});
  final buyNow;
  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  bool a = false;
  @override
  Widget build(BuildContext context) {
    getWishList();
    getRefresh(String refresh) {
      if (refresh == 'refresh') {
        setState(() {
          a = true;
        });
      }
    }

    void removeItemFromOrder(String itemId) {
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

    updatePrice();

    buyNow = myProduct.where((item) => buyNowItem == item['id']).toList();

    return Scaffold(
      appBar: MyAppBar(title: 'Order Summary'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
                label: 'Deliver to:',
                ht: 220,
                width: mWidth!,
                num: false,
                max: 7,
                content: (selectedAddress[0] == 'no data' ||
                        selectedAddress == 'no data')
                    ? 'Select an address'
                    : "${selectedAddress['name']}\n${selectedAddress['houseNumber']}\n${selectedAddress['streetName']}\n${selectedAddress['city']}\n${selectedAddress['state']}\n${selectedAddress['pincode']}\n${selectedAddress['phoneNumber']}\n",
                readOnly: true,
                btn: true,
                btnName: selectedAddress[0] == 'no data'
                    ? 'Add address'
                    : 'Change Address',
                refresh: getRefresh),
            kHeight20,
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Order Details :',
                style: GoogleFonts.roboto(
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            kHeight,
            ListView.builder(
              itemCount: widget.buyNow ? buyNow.length : myCart.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final filteredList = myProduct
                    .where((item) => myCart.contains(item['id']))
                    .toList()
                  ..sort((a, b) => myCart
                      .indexOf(a['id'])
                      .compareTo(myCart.indexOf(b['id'])));

                final buynowFiltered = myProduct
                    .where((item) => buyNowItem == item['id'])
                    .toList();

                final product =
                    widget.buyNow ? buyNow[index] : filteredList[index];

                cartItems = filteredList;
                buyNow = buynowFiltered;

                return Slidable(
                  endActionPane: ActionPane(
                    motion: const BehindMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          widget.buyNow
                              ? buyNowCount = 0
                              : countList.removeAt(index);
                          widget.buyNow
                              ? buyNowTotals = 0
                              : myProductTotal.removeAt(index);
                          widget.buyNow
                              ? buyNowItem = ''
                              : removeItemFromOrder(product['id']);
                          WishList myWishobj = WishList(
                              wishList: myWishList,
                              cart: myCart,
                              count: countList,
                              productTotal: myProductTotal,
                              address: addressList,
                              currentAddress: selectedAddress,
                              buyNow: buyNowItem,
                              buyNowCount: buyNowCount,
                              buyNowTotal: buyNowTotals,
                              );
                          myWishobj.addToWishList();
                          removeItemFromOrder(buyNowItem);

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
                        backgroundColor: const Color.fromARGB(255, 213, 78, 68),
                        icon: Icons.close_rounded,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: CartCard1(
                    index: index,
                    product: product,
                    onRemove: removeItemFromOrder,
                    updateTotal: updatePrice,
                    buynow: widget.buyNow,
                  ),
                );
              },
            ),
            kHeight15,
          ],
        ),
      ),
      bottomNavigationBar: PlaceOrderBtn(
        label: 'Continue',
        ht: 90,
        clr: true,
        buynow: widget.buyNow,
        navigateTo: PaymentScreen(buynow: widget.buyNow),
      ),
    );
  }
}
