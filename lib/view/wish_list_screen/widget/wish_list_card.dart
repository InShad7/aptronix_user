import 'package:aaptronix/view/home_screen/widget/category_item_card.dart';
import 'package:aaptronix/view/home_screen/widget/home_item_card.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishListCard extends StatelessWidget {
  const WishListCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          color: cardClr,
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
                        'iPhone 13',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '128 GB',
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(fontSize: 17)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 200.0),
                        child: FavIcon(),
                      )
                    ],
                  ),
                  Text(
                    '₹ 89,990',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}