import 'package:aaptronix/view/dash_board_screen/dash_board_screen.dart';
import 'package:aaptronix/view/login_screen/login_screen.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget customBtn({context, required Widget navigateTo, required String title}) {
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
          alertBox(context);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => navigateTo,
          //   ),
          // );
        },
        child: Text(
          title,
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(fontSize: 30),
          ),
        ),
      ),
    ),
  );
}

void alertBox(context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text(
        'Are you sure want to LogOut.!',
        style: GoogleFonts.ubuntu(fontSize: 20),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            final sharedPrefer = await SharedPreferences.getInstance();
            await sharedPrefer.setBool('isLoggedIn', false);

            
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
                (route) => false);
          },
          child: Text(
            'LOGOUT',
            style: GoogleFonts.ubuntu(color: Colors.teal, fontSize: 18),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'DISMISS',
            style: GoogleFonts.ubuntu(color: red, fontSize: 18),
          ),
        ),
      ],
    ),
  );
}
