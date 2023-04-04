import 'package:aaptronix/get_started/get_started.dart';
import 'package:aaptronix/home_screen/widget/category_item_card.dart';
import 'package:aaptronix/home_screen/widget/custom_curosel.dart';
import 'package:aaptronix/home_screen/widget/home_item_card.dart';
import 'package:aaptronix/utils/colors.dart';
import 'package:aaptronix/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Aptronix',
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(fontSize: 38, color: black),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 9.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_rounded,
                color: black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          kHeight20,
          const customCurosel(),
          kHeight20,
          categoryItemCard(),
          kHeight5,
          homeItemCards(context),
        ],
      ),
    );
  }
}
