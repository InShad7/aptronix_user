import 'dart:developer';
import 'dart:ui';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/wish_list_model.dart';
import 'package:aaptronix/view/order_summary_screen/address_screen/select_address_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FavIcon extends StatefulWidget {
  const FavIcon({super.key, this.product, this.refresh});
  final product;
  final refresh;

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    getWishList();
    if (myWishList.contains(widget.product)) {
      fav = true;
    } else {
      fav = false;
    }
    return InkWell(
      child: Icon(
        fav ? Icons.favorite : Icons.favorite_border,
        color: fav ? red : grey,
        size: 29,
      ),
      onTap: () {
        if (fav == false) {
          if (myWishList.contains(widget.product)) {
            Fluttertoast.showToast(
              msg: "Already in the wishlist !!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: red,
              textColor: Colors.white,
              fontSize: 15.0,
            );
          } else {
            myWishList.add(widget.product);

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
          }
        } else {
          myWishList.remove(widget.product);

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
        }
        log(myWishList.toString());
        if (widget.refresh != null) {
          widget.refresh();
        }

        alert();
        setState(() {
          fav = !fav;
        });
      },
    );
  }

  void alert() {
    if (fav == false) {
      Fluttertoast.showToast(
        msg: "Item added to wishlist 💜",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: blue,
        textColor: Colors.white,
        fontSize: 15.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Item removed from wishlist 💔",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: black,
        textColor: Colors.white,
        fontSize: 15.0,
      );
    }
  }
}
