import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Padding userImgAndName() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Helloo, admin...',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://img.freepik.com/premium-psd/character-avatar-3d-illustration_460336-712.jpg?w=740'),
          maxRadius: 80,
        ),
      ],
    ),
  );
}
