import 'package:aaptronix/view/login_screen/widgets/text_field.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpTxtBtn extends StatelessWidget {
  const SignUpTxtBtn({super.key, this.signUp = true, required this.navigateTo});
  final signUp;
  final navigateTo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        signUp
            ? Text(
                "New user? ",
                style: GoogleFonts.roboto(fontSize: 20),
              )
            : Text(
                "Already have an account ! ",
                style: GoogleFonts.roboto(fontSize: 20),
              ),
        InkWell(
          child: signUp
              ? Text(
                  "Sign Up ",
                  style: GoogleFonts.roboto(
                      fontSize: 22, color: blue, fontWeight: FontWeight.bold),
                )
              : Text(
                  "Login",
                  style: GoogleFonts.roboto(
                      fontSize: 22, color: blue, fontWeight: FontWeight.bold),
                ),
          onTap: () {
            nameController.clear();
            userNameController.clear();
            passwordController.clear();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => navigateTo,
              ),
            );
          },
        ),
      ],
    );
  }
}
