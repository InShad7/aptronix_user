import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/cart_screen/widget/cart_card.dart';
import 'package:aaptronix/view/cart_screen/widget/my_cart_card.dart';
import 'package:aaptronix/view/cart_screen/widget/place_order_btn.dart';
import 'package:aaptronix/view/order_summary_screen/address_screen/select_address_screen.dart';
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
      appBar: MyAppBar(title: 'Order Summary'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              label: 'Deliver to:',
              ht: 220,
              width: mWidth!,
              num: false,
              max: 7,
              content: (selectedAddress[0] == 'no data' ||
                      selectedAddress == 'no data')
                  ? 'Select an address'
                  : "${selectedAddress['name']}\n${selectedAddress['houseNumber']}\n${selectedAddress['streetName']}\n${selectedAddress['city']}\n${selectedAddress['state']}\n${selectedAddress['pincode']}\n${selectedAddress['phoneNumber']}\n",
              readOnly: true,
              btn: true,
              btnName: selectedAddress[0] == 'no data'
                  ? 'Add address'
                  : 'Change Address',
            ),
            kHeight20,
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Order Details :',
                style: GoogleFonts.roboto(
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            kHeight,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cartItems.length,
              itemBuilder: (context, index) => CartCard1(
                index: index,
                product: cartItems[index],
                orderSummary: true,
              ),
            ),
            kHeight15,
          ],
        ),
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
