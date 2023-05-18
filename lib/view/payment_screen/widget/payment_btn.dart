import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/order_model.dart';
import 'package:aaptronix/view/payment_screen/payment_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../splash_screen.dart/spalsh_screen.dart';

class PaymentBtn extends StatelessWidget {
  const PaymentBtn({super.key, this.buynow, this.payment, this.makePayment});
  final buynow;
  final payment;
  final makePayment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: mWidth,
      decoration: BoxDecoration(
        color: blue,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SizedBox(
          width: 160,
          child: Text(
            buynow ? 'Total :  ₹ ${buyNowTotals}' : 'Total :  ₹ ${total}',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w500, color: white),
            ),
          ),
        ),
        SizedBox(
          height: 47,
          width: 165,
          child: ElevatedButton(
            onPressed: () {
              if (payment == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 1),
                    content: Text(
                      'Oops...! select a payment method',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(fontSize: 19),
                      ),
                    ),
                    backgroundColor: deleteRed,
                  ),
                );
              } else {
                payment == 'assets/online.png' ? makePayment() : cod(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            child: Text(
              'Continue',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 22, color: black, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  cod(context) {
    List buyCount = [buyNowCount];
    List buyItem = [buyNowItem];
    orderedItems = buynow ? buyItem : myCart;
    orderedCount = buynow ? buyCount : countList;
    orderedAddress = selectedAddress;

    for (int i = 0; i < orderedItems.length; i++) {
      Ordered obj = Ordered(
        username: FirebaseAuth.instance.currentUser!.email!,
        address: selectedAddress,
        products: orderedItems[i],
        count: orderedCount[i],
        status: 'Ordered',
        payment: 'Cash On Delivery',
      );
      obj.addToOrderedList();
    }
    // myCart.clear();
    // orderedItems.clear();
    // myProductTotal.clear();
    // countList.clear();
    updateFirebase();
    success(context: context, payment: 'COD');
  }
}
