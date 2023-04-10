import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  MyAppBar({
    super.key,
    required this.title,
  });
  @override
  final Size preferredSize = const Size.fromHeight(60.0);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: black),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios_new),
      ),
      title: Text(
        title,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
              fontSize: 28, color: black, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
