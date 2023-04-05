import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

AppBar myAppBar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: black),
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(Icons.arrow_back_ios_new),
    ),
    title: Text(
      title,
      style: GoogleFonts.roboto(
        textStyle:
            TextStyle(fontSize: 36, color: black, fontWeight: FontWeight.w400),
      ),
    ),
  );
}
