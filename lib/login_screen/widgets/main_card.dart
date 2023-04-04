import 'package:aaptronix/login_screen/login_screen.dart';
import 'package:aaptronix/utils/colors.dart';
import 'package:aaptronix/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInText extends StatelessWidget {
  const SignInText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 165),
      child: Column(
        children: [
          Text(
            'Aptronix',
            style: GoogleFonts.ubuntu(
              textStyle: TextStyle(fontSize: 33, color: black),
            ),
          ),
          kHeight,
          Text(
            'Sign In',
            style: GoogleFonts.ubuntu(
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
