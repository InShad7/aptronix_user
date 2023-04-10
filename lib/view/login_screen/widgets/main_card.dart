import 'package:aaptronix/view/home_screen/widget/category_item_card.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInText extends StatelessWidget {
  const SignInText({super.key, required this.title});
  final  String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 165),
      child: Column(
        children: [
          Text(
            'aptronix.',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(fontSize: 33, color: black),
            ),
          ),
          kHeight,
          Text(
            title,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 60,
                color: black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          kHeight20,
        ],
      ),
    );
  }
}
