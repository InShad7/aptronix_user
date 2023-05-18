import 'dart:developer';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceOrderBtn extends StatelessWidget {
  PlaceOrderBtn({
    super.key,
    this.botomSpace = 0,
    required this.ht,
    required this.clr,
    required this.label,
    this.navigateTo,
    this.buynow = false,
    this.payment = '',
    this.makePayment,
  });

  final double ht;
  final bool clr;
  final String label;
  final navigateTo;
  final double botomSpace;
  final buynow;
  final payment;
  final makePayment;

  @override
  Widget build(BuildContext context) {
    log(payment.toString());
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            SizedBox(
              width: 160,
              child: Text(
                buynow ? 'Total :  ₹ ${buyNowTotals}' : 'Total :  ₹ ${total}',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: clr ? white : black),
                ),
              ),
            ),
            SizedBox(
              height: 47,
              width: 165,
              child: ElevatedButton(
                onPressed: () {
                  if (buynow
                      ? buyNowTotals == 0
                      : total == 0 || selectedAddress[0] == 'no data') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          selectedAddress[0] == 'no data'
                              ? 'add an address...!'
                              : 'Oops...! Add an item to proceed',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(fontSize: 19),
                          ),
                        ),
                        backgroundColor: deleteRed,
                      ),
                    );
                  } else {
                    payment == 'Pre-paid Online'
                        ? makePayment()
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => navigateTo,
                            ));
                  }
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
          ]),
        ),
      ),
    );
  }
}
