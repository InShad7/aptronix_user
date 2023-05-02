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
  @override
  Widget build(BuildContext context) {
    void removeItem(String itemId) {
      setState(() {
        myWishList.remove(itemId);
      });
    }

    log(myWishList.length.toString());
    return Scaffold(
      backgroundColor: white,
      appBar: NavScreenAppBar(title: 'Wishlist'),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        StreamBuilder(
            stream: getProducts(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: 700,
                  child: Center(
                      child: SizedBox(
                    height: 50,
                    width: 50,
                    child: LoadingIndicator(
                      indicatorType: Indicator.circleStrokeSpin,
                      colors: [blue],
                      strokeWidth: 1,
                    ),
                  )),
                );
              }
              if (snapshot.connectionState == ConnectionState.done ||
                  snapshot.connectionState == ConnectionState.active) {
                if (myWishList.isEmpty || myWishList[0] == 'no data') {
                  return SizedBox(
                    height: 580,
                    child: Image.asset('assets/no data.jpeg'),
                  );
                }
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  return snapshot.data!.isEmpty
                      ? const Center(child: Text('List empty'))
                      : ListView.builder(
                          itemCount: myWishList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final filteredList = data
                                .where(
                                  (item) => myWishList.contains(item['id']),
                                )
                                .toList();
                            log(filteredList.toString());

                            final product = filteredList[index];
                            return WishListCard(
                                product: product, onRemove: removeItem);
                          });
                }
              }
              return const Center(child: Text('Cant fetch items'));
            })
      ]),
    );
  }
}
