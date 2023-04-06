import 'package:aaptronix/view/order_summary_screen/add_address_screen/add_address_screen.dart';
import 'package:aaptronix/view/order_summary_screen/address_screen/address_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Padding titleAndBtn(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Select address',
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: grey1,
            backgroundColor: cardClr2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddAddressScreen(),
              ),
            );
          },
          child: Text(
            'Add Address',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    ),
  );
}
