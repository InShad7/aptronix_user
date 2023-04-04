import 'package:aaptronix/cart_screen/cart_screen.dart';
import 'package:aaptronix/category_screen/category_screen.dart';
import 'package:aaptronix/dash_board_screen/dash_board_screen.dart';
import 'package:aaptronix/home_screen/home_screen.dart';
import 'package:aaptronix/utils/colors.dart';
import 'package:aaptronix/wish_list_screen/wish_list_screen.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});
  int currentIndex = 0;

  List pages = [
    HomeScreen(),
   const CategoryScreen(),
   const CartScreen(),
   const WishListScreen(),
   const DashBoardScreen()
  ];

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widget.pages[widget.currentIndex],
      bottomNavigationBar: BottomBarDefault(
        animated: true,
        iconSize: 24,
        paddingVertical: 18,
        color: grey,
        backgroundColor: Colors.white,
        colorSelected: blue,
        borderRadius: BorderRadius.circular(0),
        indexSelected: widget.currentIndex,
        onTap: (index) => setState(() {
          widget.currentIndex = index;
        }),
        items:const <TabItem>[
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
