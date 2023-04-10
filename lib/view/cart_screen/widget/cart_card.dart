import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, this.quantity = true});

  final bool quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          // border: Border.all(width: 0),
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
                      image: NetworkImage(
                        'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-finish-select-202207-6-1inch-blue?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1656712888128',
                      ),
                      fit: BoxFit.cover),
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
                            textStyle: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                  Text(
                    '128 GB',
                    style:
                        GoogleFonts.roboto(textStyle: TextStyle(fontSize: 17)),
                  ),
                  Row(
                    children: [
                      Text(
                        '₹ 89,990',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(fontSize: 20)),
                      ),
                      Padding(
                        padding: quantity
                            ? const EdgeInsets.only(left: 86.5)
                            : EdgeInsets.only(left: 150),
                        child: Row(
                          children: [
                            quantity
                                ? Text('')
                                : Text(
                                    'Qty:',
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(fontSize: 17),
                                    ),
                                  ),
                            kWidth,
                            Visibility(
                              visible: quantity,
                              child: IconButton(
                                onPressed: () {
                                  print('remove');
                                },
                                icon: Icon(Icons.remove),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: blue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  '1',
                                  style: GoogleFonts.roboto(
                                    textStyle:
                                        TextStyle(fontSize: 18, color: white),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: quantity,
                              child: IconButton(
                                onPressed: () {
                                  print('add');
                                },
                                icon: Icon(Icons.add),
                              ),
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
}
