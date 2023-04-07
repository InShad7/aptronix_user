import 'package:aaptronix/view/home_screen/product_details/product_details.dart';
import 'package:aaptronix/view/home_screen/widget/category_item_card.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget homeItemCards(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "New Arrival",
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        kHeight,
        SizedBox(
          height: 1030,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: (2 / 2.6),
            ),
            itemCount: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Container(
              // height: 200,
              // width: 200,
              decoration: BoxDecoration(
                color: cardClr,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(children: [
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.only(top: 12),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      // color: white,
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                          image: AssetImage(img[index]), fit: BoxFit.contain),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(),
                      ),
                    );
                  },
                ),
                kHeight15,
                Container(
                  height: 60,
                  width: 170,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kHeight,
                        Row(
                          children: [
                            InkWell(
                              child: Text(
                                'iPhone 14 Pro',
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailsScreen(),
                                  ),
                                );
                              },
                            ),
                            kWidth,
                            kWidth5,
                            FavIcon()
                          ],
                        ),
                        InkWell(
                          child: Text(
                            '₹ 119,990',
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        )
      ],
    ),
  );
}

class FavIcon extends StatefulWidget {
  const FavIcon({
    super.key,
  });

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        fav ? Icons.favorite : Icons.favorite_border,
        color: fav ? red : grey,
      ),
      onTap: () {
        setState(() {
          fav = !fav;
        });
      },
    );
  }
}
