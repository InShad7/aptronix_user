import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List dashboardItemName = ['Your Order', 'Your Accoount', 'Privacy Policy'];

ListView dashboardList() {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 3,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: cardClr2,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            dashboardItemName[index],
            style: GoogleFonts.roboto(
              textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    ),
  );
}
