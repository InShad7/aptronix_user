import 'package:aaptronix/view/widget/bottom_nav_app_bar.dart';
import 'package:aaptronix/view/wish_list_screen/widget/wish_list_card.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavScreenAppBar(title: 'Wishlist'),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        ListView.builder(
          itemCount: 8,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => WishListCard(index: index),
        ),
      ]),
    );
  }
}
