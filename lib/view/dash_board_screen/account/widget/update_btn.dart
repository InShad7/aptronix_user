import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget updateBtn(
    {context,
    required String title,}) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SizedBox(
      height: 55,
      width: mWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: () {
          Navigator.pop(
            context,
          );
        },
        child: Text(
          title,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(fontSize: 30),
          ),
        ),
      ),
    ),
  );
}
