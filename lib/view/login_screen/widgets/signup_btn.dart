import 'package:aaptronix/view/signup_screen.dart/signup_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpBtn extends StatelessWidget {
  const SignUpBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "New user? ",
          style: GoogleFonts.roboto(fontSize: 20),
        ),
        InkWell(
          child: Text(
            "Sign Up ",
            style: GoogleFonts.roboto(fontSize: 20, color: blue),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
