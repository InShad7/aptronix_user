import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../order_summary_screen/order_summary_screen.dart';

class CheckoutBtn extends StatelessWidget {
  const CheckoutBtn({
    super.key,
    required this.refresh,
  });

  final refresh;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: Container(
        height: 90,
        width: mWidth,
        decoration: BoxDecoration(
          color: white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
            width: 160,
            child: Text(
              'Total :  ₹ ${total}',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.w500, color: black),
              ),
            ),
          ),
          SizedBox(
            height: 47,
            width: 165,
            child: ElevatedButton(
              onPressed: () async {
                if (total == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Cart empty...!  Add items to cart',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(fontSize: 19),
                        ),
                      ),
                      backgroundColor: deleteRed,
                    ),
                  );
                } else {
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderSummaryScreen(),
                      ));
                  if (result == 'refresh') {
                    refresh('refresh');
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              child: Text(
                'Continue',
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
}
