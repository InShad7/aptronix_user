import 'package:aaptronix/view/cart_screen/widget/place_order_btn.dart';
import 'package:aaptronix/view/order_confirmation_screen/order_confirmation_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/bottom_nav_bar.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? selectedMode;
  List modes = [
    'UPI',
    'Credit / Debit Card',
    'Net Banking',
    'Cash On Delivery'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Payments'),
      body: ListView(
        children: [
          kHeight,
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 10, bottom: 8),
            child: Text(
              'Payments options:',
              style: GoogleFonts.roboto(
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListView.builder(
            itemCount: modes.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 5),
              height: 65,
              decoration: BoxDecoration(
                color: cardClr2,
                borderRadius: BorderRadius.circular(18),
              ),
              child: RadioListTile(
                activeColor: blue,
                title: Text(
                  modes[index],
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.w500),
                  ),
                ),
                value: modes[index],
                groupValue: selectedMode,
                onChanged: (value) {
                  setState(() {
                    selectedMode = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: PlaceOrderBtn(
        label: 'Continue',
        ht: 90,
        clr: true,
        navigateTo:const OrderConfirmationScreen(),
      ),
    );
  }
}
