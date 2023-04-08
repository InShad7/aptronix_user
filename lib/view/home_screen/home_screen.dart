
import 'package:aaptronix/view/home_screen/widget/category_item_card.dart';
import 'package:aaptronix/view/home_screen/widget/custom_curosel.dart';
import 'package:aaptronix/view/home_screen/widget/home_item_card.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
 const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'aptronix.',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 32, color: black, fontWeight: FontWeight.bold),
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
        children:const [
          kHeight20,
           customCurosel(),
          kHeight20,
          CategoryItemCard(),
          kHeight5,
          HomeItemCards(),
        ],
      ),
    );
  }
}
