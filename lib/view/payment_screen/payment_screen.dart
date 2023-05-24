import 'dart:developer';

import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/order_model.dart';
import 'package:aaptronix/view/payment_screen/widget/payment_btn.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:aaptronix/view/widget/bottom_nav_bar.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

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
    success(response: response, context: context);
    List buyCount = [buyNowCount];
    List buyItem = [buyNowItem];
    orderedItems = widget.buynow ? buyItem : myCart;
    orderedCount = widget.buynow ? buyCount : countList;
    orderedAddress = selectedAddress;

    for (int i = 0; i < orderedItems.length; i++) {
      Ordered obj = Ordered(
        username: FirebaseAuth.instance.currentUser!.email!,
        address: selectedAddress,
        products: orderedItems[i],
        count: orderedCount[i],
        status: 'Ordered',
        payment: 'Pre-paid Online',
      );
      obj.addToOrderedList();
    }
    updateQnty();
    Fluttertoast.showToast(
        msg: 'Payment Success', backgroundColor: Colors.green);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    success(response: response, fail: true, context: context);

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
  // List modes = ['Pre-paid Online', 'Cash On Delivery'];
  List img = ['assets/online.png', 'assets/cod.png'];
  @override
  Widget build(BuildContext context) {
    log('${buyNow}${buyNowCount}');
    return Scaffold(
      appBar: MyAppBar(title: 'Payment'),
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
            itemCount: img.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 5),
              height: 300,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 1, color: grey),
                image: DecorationImage(
                  image: AssetImage(img[index]),
                ),
              ),
              child: RadioListTile(
                activeColor: blue,
                value: img[index],
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
      bottomNavigationBar: PaymentBtn(
        buynow: widget.buynow,
        makePayment: makePayment,
        payment: selectedMode,
      ),
    );
  }
}

void success({fail = false, response, context, payment}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
        backgroundColor: white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
        ),
        actions: [
          StreamBuilder(
              stream: getProducts(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: LoadingIndicator(
                        indicatorType: Indicator.circleStrokeSpin,
                        colors: [blue],
                        strokeWidth: 1,
                      ),
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done ||
                    snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    iphoneList = data
                        .where((item) => 'iPhone' == item['category'])
                        .toList();
                    ipadList = data
                        .where((item) => 'iPad' == item['category'])
                        .toList();
                    watchList = data
                        .where((item) => 'iWatch' == item['category'])
                        .toList();
                    macList = data
                        .where((item) => 'MacBook' == item['category'])
                        .toList();
                    buyNow = myProduct
                        .where((item) => buyNowItem == item['id'])
                        .toList();
                    log('buy from home ${buyNow}');
                    categoryList = myProduct = data;

                    return SizedBox(
                      height: 350,
                      child: Column(
                        children: [
                          Container(
                            height: 170,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(22),
                              ),
                              color: white,
                              image: DecorationImage(
                                image: AssetImage(fail
                                    ? 'assets/close (1).jpg'
                                    : 'assets/tick.png'),
                              ),
                            ),
                          ),
                          kHeight20,
                          Text(
                            fail ? 'Order cancelled' : 'Order confirmed',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(fontSize: 22),
                            ),
                          ),
                          kHeight15,
                          payment == 'COD'
                              ? Text(
                                  'Your order has been placed successfully',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(fontSize: 20),
                                  ),
                                )
                              : Text(
                                  fail
                                      ? '${response.message}'
                                      : 'Payment Id: ${response.paymentId}',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(fontSize: 20),
                                  ),
                                ),
                          kHeight20,
                          kHeight20,
                          SizedBox(
                            height: 40,
                            width: 200,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                fail
                                    ? Navigator.pop(context)
                                    : Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BottomNavBar(),
                                        ),
                                        (route) => false);
                              },
                              icon: Icon(
                                fail
                                    ? Icons.restart_alt_rounded
                                    : Icons.home_filled,
                                color: white,
                              ),
                              label: Text(
                                fail ? 'Retry' : 'Home',
                                style: GoogleFonts.roboto(
                                    fontSize: 20, color: white),
                              ),
                            ),
                          ),
                          kHeight20,
                        ],
                      ),
                    );
                  }
                }
                return Text('Cant fetch data');
              }),
        ]),
  );
}
