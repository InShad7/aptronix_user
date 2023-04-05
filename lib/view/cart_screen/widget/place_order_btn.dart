import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container placeOrderBtn() {
  return Container(
    height: 140,
    width: mWidth,
    decoration: BoxDecoration(
      color: white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(18),
        topRight: Radius.circular(18),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 58.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          'Total :  ₹ 2,89,990',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w500, color: black),
          ),
        ),
        Container(
          height: 47,
          width: 165,
          decoration: BoxDecoration(
            color: blue,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Center(
            child: Text(
              'Place Order',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 22, color: white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ]),
    ),
  );
}
