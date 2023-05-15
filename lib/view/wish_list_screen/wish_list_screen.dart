import 'dart:developer';
import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/widget/bottom_nav_app_bar.dart';
import 'package:aaptronix/view/wish_list_screen/widget/wish_list_card.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  void removeItem(String itemId) {
    setState(() {
      myWishList.remove(itemId);
    });
  }

  @override
  Widget build(BuildContext context) {
    log(myWishList.length.toString());
    return Scaffold(
      backgroundColor: white,
      appBar: NavScreenAppBar(title: 'Wishlist'),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        if (myWishList.isEmpty || myWishList[0] == 'no data')
          SizedBox(
            height: 580,
            child: Image.asset('assets/no data.jpeg'),
          )
        else
          ListView.builder(
              itemCount: myWishList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final filteredList = myProduct
                    .where(
                      (item) => myWishList.contains(item['id']),
                    )
                    .toList();
                log(filteredList.toString());

                final product = filteredList[index];
                return WishListCard(product: product, onRemove: removeItem);
              })
      ]),
    );
  }
}
