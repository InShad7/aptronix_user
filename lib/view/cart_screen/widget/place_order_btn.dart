import 'package:aaptronix/view/order_summary_screen/order_summary_screen.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container placeOrderBtn(
    {required context,
    required double ht,
    double botomSpace = 0,
    required bool clr,
    required String label,
    required Widget navigateTo}) {
  return Container(
    height: ht,
    width: mWidth,
    decoration: BoxDecoration(
      color: clr ? blue : white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(18),
        topRight: Radius.circular(18),
      ),
    ),
    child: Visibility(
      child: Padding(
        padding: EdgeInsets.only(bottom: botomSpace),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            'Total :  ₹ 2,89,990',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: clr ? white : black),
            ),
          ),

          SizedBox(
            height: 47,
            width: 165,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => navigateTo,
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: clr ? white : blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              child: Text(
                label,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontSize: 22,
                      color: clr ? black : white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          // InkWell(
          //   child: Container(
          //     height: 47,
          //     width: 165,
          //     decoration: BoxDecoration(
          //       color: clr ? white : blue,
          //       borderRadius: BorderRadius.circular(18),
          //     ),
          //     child: Center(
          //       child: Text(
          //         label,
          //         style: GoogleFonts.roboto(
          //           textStyle: TextStyle(
          //               fontSize: 22,
          //               color: clr ? black : white,
          //               fontWeight: FontWeight.bold),
          //         ),
          //       ),
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => navigateTo,
          //         ));
          //   },
          // ),
        ]),
      ),
    ),
  );
}
