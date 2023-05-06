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
              ),
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
                          WishList myWishobj = WishList(
                            wishList: myWishList,
                            cart: myCart,
                            count: countList,
                            productTotal: myProductTotal,
                            address: addressList,
                            currentAddress: selectedAddress,buyNow: buyNowList,
                          );
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
                    onRemove: removeItemFromCart,
                    updateTotal: updatePrice,
                  ),
                );
              },
            ),
          ],
        ),
        bottomSheet: PlaceOrderBtn(
          label: 'Place Order',
          ht: 140,
          botomSpace: 58,
          clr: false,
          navigateTo: const OrderSummaryScreen(),
        ));
  }
}
