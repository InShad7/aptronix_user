
import 'package:aaptronix/view/home_screen/widget/category_item_card.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget cartCard(int index) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5),
    child: Container(
      height: 110,
      decoration: BoxDecoration(
        color: cardClr2,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 90,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: white,
                image: DecorationImage(
                  image: AssetImage(
                    img[index],
                  ),
                ),
              ),
            ),
            kWidth,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'iPhone 12',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
                Text(
                  '128 GB',
                  style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 17)),
                ),
                Row(
                  children: [
                    Text(
                      '₹ 89,990',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 96.0),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              print('remove');
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8, top: 2),
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '1',
                              style: GoogleFonts.roboto(
                                textStyle:
                                    TextStyle(fontSize: 18, color: white),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              print('add');
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
