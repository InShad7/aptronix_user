import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/wish_list_model.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WhishlistRemoveBtn extends StatelessWidget {
  const WhishlistRemoveBtn({super.key, this.product, this.onRemove});
  final product;
  final onRemove;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onRemove(product['id']);
        myWishList.remove(product['id']);

        WishList myWishobj =
            WishList(wishList: myWishList, cart: myCart, count: countList,productTotal: myProductTotal);
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
      },
      icon: Icon(
        Icons.favorite,
        color: red,
      ),
    );
    ;
  }
}
