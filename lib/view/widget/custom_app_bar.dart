import 'package:aaptronix/view/order_summary_screen/order_summary_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  MyAppBar({
    super.key,
    required this.title,
    this.addressScren = false,
  });
  @override
  final Size preferredSize = const Size.fromHeight(60.0);
  final String title;
  final addressScren;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: black),
      leading: IconButton(
        onPressed: () {
          // addressScren
          //     ? Navigator.pushReplacement(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => OrderSummaryScreen(),
          //         ),
          //       )
              // : 
              Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new),
      ),
      title: Text(
        title,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
              fontSize: 28, color: black, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
