import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar navScreenAppBar({required String title}) {
  return AppBar(
    backgroundColor: white,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      style: GoogleFonts.roboto(
        textStyle:
            TextStyle(fontSize: 26, color: black, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
