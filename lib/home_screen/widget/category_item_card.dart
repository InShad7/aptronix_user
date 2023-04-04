import 'package:aaptronix/utils/colors.dart';
import 'package:aaptronix/utils/utils.dart';
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

Widget categoryItemCard() {
  return SizedBox(
    height: 85,
    child: ListView.builder(
      itemCount: 4,
      // shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        margin: const EdgeInsets.all(5),
        // width: 150,
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 70,
              decoration: BoxDecoration(
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
              style: GoogleFonts.sora(
                textStyle: const TextStyle(fontSize: 20),
              ),
            ),
            kWidth
          ],
        ),
      ),
    ),
  );
}
