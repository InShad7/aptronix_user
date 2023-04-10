import 'package:aaptronix/view/dash_board_screen/widget/logout_btn.dart';
import 'package:aaptronix/view/order_summary_screen/order_summary_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCartAndBuyNow extends StatelessWidget {
  const AddCartAndBuyNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
        color: blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Added to Cart 🛒",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 15.0,
              );
            },
            child: Text(
              'Add to Cart',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(fontSize: 22, color: white),
              ),
            ),
          ),
          SizedBox(
            height: 48,
            width: 180,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderSummaryScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Text(
                'Buy Now',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 22,
                    color: black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
