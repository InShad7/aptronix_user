import 'package:aaptronix/view/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 200,
            child: Text(
              'Helloo,\n${user.displayName} ',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          user.photoURL != null
              ? CircleAvatar(
                  maxRadius: 80,
                  backgroundColor: white,
                  backgroundImage: NetworkImage(
                    user.photoURL!,
                  ),
                )
              : CircleAvatar(
                  maxRadius: 80,
                  backgroundColor: white,
                  backgroundImage: AssetImage('assets/dp.jpg'),
                ),
        ],
      ),
    );
  }
}
