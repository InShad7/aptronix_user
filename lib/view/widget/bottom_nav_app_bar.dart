import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavScreenAppBar extends StatelessWidget with PreferredSizeWidget {
  NavScreenAppBar({super.key, required this.title, preferredSize});
  @override
  final Size preferredSize = const Size.fromHeight(50);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
              fontSize: 26, color: black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
