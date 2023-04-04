import 'package:aaptronix/home_screen/widget/home_item_card.dart';
import 'package:aaptronix/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget productNamePrice() {
  return Padding(
    padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "iPhone 14 (128GB)-Product Red",
              style: GoogleFonts.ubuntu(
                textStyle:const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            FavIcon()
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     Icons.favorite_border,
            //     color: grey,
            //     size: 30,
            //   ),
            // ),
          ],
        ),
        kHeight,
        Text(
          "₹ 99,900",
          style: GoogleFonts.sora(
            textStyle:const TextStyle(
              fontSize: 27,
            ),
          ),
        ),
      ],
    ),
  );
}
