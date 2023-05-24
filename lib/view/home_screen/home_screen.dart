import 'dart:developer';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/home_screen/widget/category_item_card.dart';
import 'package:aaptronix/view/home_screen/widget/custom_curosel.dart';
import 'package:aaptronix/view/home_screen/widget/home_item_card.dart';
import 'package:aaptronix/view/search_screen/search_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool a = false;

  Future<void> refresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      a = updateList();
    });
  }

  @override
  Widget build(BuildContext context) {
    log('home');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'aptronix.',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 32,
              color: black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 9.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.search_rounded,
                color: black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            kHeight20,
            customCurosel(imgs: curoselImg[0]['images']),
            kHeight20,
            const CategoryItemCard(),
            kHeight5,
            const HomeItemCards(), 
          ],
        ),
      ),
    );
  }
}
