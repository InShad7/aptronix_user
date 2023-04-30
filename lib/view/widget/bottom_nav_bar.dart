import 'package:aaptronix/view/cart_screen/cart_screen.dart';
import 'package:aaptronix/view/category_screen/category_screen.dart';
import 'package:aaptronix/view/dash_board_screen/dash_board_screen.dart';
import 'package:aaptronix/view/home_screen/home_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/wish_list_screen/wish_list_screen.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    super.key,
    this.state = false,
    this.cart = false,
  });

  final bool state;
  final bool cart;
  late int currentIndex = 0;

  List pages = [
    HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const WishListScreen(),
    DashBoardScreen()
  ];

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    widget.currentIndex = widget.state ? 1 : 0;
    if (widget.cart == true) {
      widget.currentIndex = 2;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      extendBody: true,
      body: widget.pages[widget.currentIndex],
      bottomNavigationBar: BottomBarDefault(
        animated: true,
        iconSize: 24,
        paddingVertical: 18,
        color: grey1,
        backgroundColor: Colors.white,
        colorSelected: blue,
        borderRadius: BorderRadius.circular(0),
        indexSelected: widget.currentIndex,
        onTap: (index) => setState(() {
          widget.currentIndex = index;
        }),
        items: const <TabItem>[
          TabItem(icon: Icons.home_filled),
          TabItem(icon: Icons.widgets_rounded),
          TabItem(icon: Icons.shopping_bag_rounded),
          TabItem(icon: Icons.favorite),
          TabItem(icon: Icons.person),
        ],
      ),
    );
  }
}
