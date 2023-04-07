import 'package:aaptronix/view/dash_board_screen/orders/order_list_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget dashboardList(
    {required String label, required Widget navigateTo, required context}) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5),
    child: InkWell(
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: cardClr,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            label,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => navigateTo,
        ),
      ),
    ),
  );
}
