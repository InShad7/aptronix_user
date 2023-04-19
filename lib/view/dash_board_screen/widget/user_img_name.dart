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
              'Helloo,${user.displayName} ',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          if (user.photoURL != null)
            CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL!),
              maxRadius: 80,
            )
          else
           const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/premium-psd/character-avatar-3d-illustration_460336-712.jpg?w=740'),
              maxRadius: 80,
            )
        ],
      ),
    );
  }
}
