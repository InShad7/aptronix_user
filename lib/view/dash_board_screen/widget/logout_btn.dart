import 'package:aaptronix/controller/provider/google_signin.dart';
import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// bool logout = false;

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.title,
  });
  final String title;
  // final Widget navigateTo;

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;
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
            if (flag == 1) {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogout();
              Navigator.pop(context);
            } else {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
              
              
            }
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
