import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/widget/bottom_nav_bar.dart';
import 'package:aaptronix/view/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key, this.status = false, this.id});

  final status;
  final id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(title: status ? 'Order Cancelled' : 'Order Confrimed'),
        body: Column(
          children: [
            status
                ? Text('Order Confrimed ${id}')
                : Image.asset('assets/tick.png'),
            SizedBox(
              height: 45,
              width: 250,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavBar(),
                      ),
                      (route) => false);
                },
                icon:const Icon(
                  Icons.shopping_bag_outlined,
                ),
                label: Text(
                  'Continue shopping',
                  style: GoogleFonts.roboto(fontSize: 20),
                ),
              ),
            ),
          ],
        ));
  }
}
