import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/cart_screen/widget/place_order_btn.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, this.buynow});
  final buynow;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Razorpay? _razorpay;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(),
    );
    Fluttertoast.showToast(msg: 'Payment Success', backgroundColor: Colors.green);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: 'Payment Failure ', backgroundColor: red);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: 'ExternalWallet', backgroundColor: blue);
  }

  void makePayment() async {
    var amount = widget.buynow ? buyNowTotals : total ?? 0;
    var options = {
      'key': 'rzp_test_VFn4UZHRVXFRF6',
      'amount': amount * 100,
      'name': 'aptronix.',
      'description': 'iPhone 14',
      'prefill': {'contact': '12345678', 'email': 'admin@gmail.com'}
    };

    try {
      _razorpay?.open(options);
    } catch (e) {
      print("error :::::${e}");
    }
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay?.clear();
    super.dispose();
  }

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
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  context: context,
                  builder: (context) => Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(22),
                          ),
                          color: white,
                          image: const DecorationImage(
                            image: AssetImage('assets/tick.png'),
                          ),
                        ),
                      ),
                      Text(
                        'message',
                        // '${response.message}',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(fontSize: 26),
                        ),
                      ),
                      kHeight20,
                    ],
                  ),
                );
              },
              child: Text('data'))
        ],
      ),
      bottomNavigationBar: PlaceOrderBtn(
        label: 'Continue',
        ht: 90,
        clr: true,
        payment: true,
        makePayment: makePayment,
        buynow: widget.buynow,
        // navigateTo: OrderConfirmationScreen(),
      ),
    );
  }
}
