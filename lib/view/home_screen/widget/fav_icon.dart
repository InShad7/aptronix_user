import 'dart:developer';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/wish_list_model.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FavIcon extends StatefulWidget {
  const FavIcon({super.key, this.product});
  final product;

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
          myWishList.add(widget.product);

          WishList myWishobj = WishList(wishList: myWishList);
          myWishobj.addToWishList();
        } else {
          myWishList.remove(widget.product);

          WishList myWishobj = WishList(wishList: myWishList);
          myWishobj.addToWishList();
        }
        log(myWishList.toString());

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
        msg: "Added to WishList 💜",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.pinkAccent,
        textColor: Colors.white,
        fontSize: 15.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Removed from WishList 💔",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.purple[400],
        textColor: Colors.white,
        fontSize: 15.0,
      );
    }
  }
}
