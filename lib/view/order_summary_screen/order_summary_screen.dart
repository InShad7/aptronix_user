import 'package:aaptronix/view/cart_screen/widget/cart_card.dart';
import 'package:aaptronix/view/cart_screen/widget/place_order_btn.dart';
import 'package:aaptronix/view/payment_screen/payment_screen.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:aaptronix/view/widget/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar( title: 'Order Summary'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            label: 'Deliver to:',
            ht: 250,
            width: mWidth!,
            num: false,
            max: 10,
            content:
                'address :\nadmin house /Building /appartment\nArea,street,village\nLandmark\npincode\ncity\nstate\nPhone number',
            readOnly: true,
            btn: true,
            btnName: 'Change Address',
          ),
          kHeight20,
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Order Details :',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          kHeight,
          CartCard(),
        ],
      ),
      bottomNavigationBar: PlaceOrderBtn(
        label: 'Continue',
        ht: 90,
        clr: true,
        navigateTo: PaymentScreen(),
      ),
    );
  }
}
