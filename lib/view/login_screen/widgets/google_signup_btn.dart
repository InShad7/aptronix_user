import 'package:aaptronix/controller/provider/google_signin.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Widget googleSignUpBtn(context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: grey, width: 1),
          ),
        ),
        onPressed: () {
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.googleLogin();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            kWidth,
            Image.asset('assets/icons8-google-512.png', scale: 13.5),
            Text(
              'Sign In with Google',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(fontSize: 26, color: blue),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


