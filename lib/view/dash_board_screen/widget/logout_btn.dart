import 'package:aaptronix/view/dash_board_screen/dash_board_screen.dart';
import 'package:aaptronix/view/login_screen/login_screen.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

// bool logout = false;

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.title, });
  final String title;
  // final Widget navigateTo;

  @override
  Widget build(BuildContext context) {
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
            // logout?
            alertBox(context);
            // : Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => navigateTo,
            //     ),
            //     (route) => false);
          },
          child: Text(
            title,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(fontSize: 26),
            ),
          ),
        ),
      ),
    );
  }
}

void alertBox(context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text(
        'Are you sure want to LogOut.!',
        style: GoogleFonts.roboto(fontSize: 20),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            // final sharedPrefer = await SharedPreferences.getInstance();
            // await sharedPrefer.setBool('isLoggedIn', false);

            FirebaseAuth.instance.signOut();
            Navigator.pop(context);

            // Navigator.of(context).pushAndRemoveUntil(
            //     MaterialPageRoute(
            //       builder: (context) => LoginScreen(),
            //     ),
            //     (route) => false);
          },
          child: Text(
            'LOGOUT',
            style: GoogleFonts.roboto(color: Colors.teal, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'DISMISS',
            style: GoogleFonts.roboto(color: red, fontSize: 18),
          ),
        ),
      ],
    ),
  );
}
