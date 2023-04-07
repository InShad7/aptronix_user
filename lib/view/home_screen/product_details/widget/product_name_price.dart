import 'package:aaptronix/view/home_screen/widget/home_item_card.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget productNamePrice() {
  return Padding(
    padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                overflow: TextOverflow.ellipsis,
                "iPhone 14 (128GB)-Product Red",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500),
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
        ),
        kHeight,
        Row(
          children: [
            Text(
              "₹ 99,900",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 27,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
