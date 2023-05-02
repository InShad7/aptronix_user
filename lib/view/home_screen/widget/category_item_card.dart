import 'dart:developer';

import 'package:aaptronix/view/category_screen/category_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List img = [
  'assets/14.png',
  'assets/ipad--removebg-preview.png',
  'assets/mac-removebg-preview.png',
  'assets/watch.png',
  'assets/14.png',
  'assets/ipad--removebg-preview.png',
  'assets/mac-removebg-preview.png',
  'assets/watch.png',
];
List title = ['iPhone', 'iPad', 'Mac Book', 'iWatch'];
int indx = -1;

class CategoryItemCard extends StatelessWidget {
  const CategoryItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        itemCount: 4,
        // shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              margin: const EdgeInsets.all(5),
              // width: 150,
              decoration: BoxDecoration(
                color: cardClr,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: AssetImage(
                          img[index],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    title[index],
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  kWidth
                ],
              ),
            ),
            onTap: () {
              indx = index;
              log(indx.toString());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomNavBar(
                    state: true,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
