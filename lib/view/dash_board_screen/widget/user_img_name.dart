import 'package:aaptronix/view/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserImgAndName extends StatelessWidget {
  const UserImgAndName({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: mWidth! / 2,
            child: Text(
              'Helloo,\n${user.displayName} ',
              style: GoogleFonts.roboto(
                textStyle:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          user.photoURL != null
              ? CircleAvatar(
                  maxRadius: mHeight! / 11.5,
                  backgroundColor: white,
                  backgroundImage: NetworkImage(
                    user.photoURL!,
                  ),
                )
              : CircleAvatar(
                  maxRadius: mHeight! / 11.5,
                  backgroundColor: white,
                  backgroundImage: AssetImage('assets/dp.jpg'),
                ),
        ],
      ),
    );
  }
}
