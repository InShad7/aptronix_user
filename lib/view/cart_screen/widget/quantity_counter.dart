import 'dart:developer';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/wish_list_model.dart';
import 'package:aaptronix/view/order_summary_screen/address_screen/select_address_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class QuantityCounter extends StatefulWidget {
  QuantityCounter({
    super.key,
    this.product,
    this.onRemove,
    required this.updateTotal,
    this.index,
    this.orderSummary,
  });
  final product;
  final onRemove;
  final updateTotal;
  final index;
  final orderSummary;
  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  @override
  Widget build(BuildContext context) {
    int count = countList[widget.index];
    return Padding(
      padding: const EdgeInsets.only(left: 86.5),
      child: Row(
        children: [
          kWidth,
          IconButton(
            onPressed: () {
              setState(() {
                if (count == 1) {
                  widget.onRemove(widget.product['id']);
                  countList.removeAt(widget.index);
                  myProductTotal.removeAt(widget.index);
                  // myProductTotal.clear();
                  WishList myWishobj = WishList(
                    wishList: myWishList,
                    cart: myCart,
                    count: countList,
                    productTotal: myProductTotal,
                    address: addressList,
                    currentAddress: selectedAddress,
                    buyNow: buyNowList,
                  );
                  myWishobj.addToWishList();
                  widget.updateTotal();

                  Fluttertoast.showToast(
                    msg: "Item removed from cart 🛒",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: black,
                    textColor: Colors.white,
                    fontSize: 15.0,
                  );

                  // print('remove');
                } else {
                  count--;
                  countList[widget.index] = count;
                  myProductTotal[widget.index] =
                      count * int.parse(widget.product['price']);

                  WishList my = WishList(
                    wishList: myWishList,
                    cart: myCart,
                    count: countList,
                    productTotal: myProductTotal,
                    address: addressList,
                    currentAddress: selectedAddress,
                    buyNow: buyNowList,
                  );
                  my.addToWishList();
                  widget.updateTotal();

                  log(count.toString());
                }
              });
            },
            icon: const Icon(Icons.remove),
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
                '${count}',
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
                  countList[widget.index] = count;
                  myProductTotal[widget.index] =
                      count * int.parse(widget.product['price']);
                  WishList my = WishList(
                    wishList: myWishList,
                    cart: myCart,
                    count: countList,
                    productTotal: myProductTotal,
                    address: addressList,
                    currentAddress: selectedAddress,
                    buyNow: buyNowList,
                  );
                  my.addToWishList();
                  widget.updateTotal();
                }

                log(count.toString());
              });

              // print('add');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
