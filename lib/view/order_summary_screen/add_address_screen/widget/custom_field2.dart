import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../splash_screen.dart/spalsh_screen.dart';

Widget customField2({
  required String label,
  double? height,
  double? width,
  required bool num,
  TextEditingController? controller,
  required  max,
  bool readOnly = true,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " $label",
          style: GoogleFonts.sora(
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        Container(
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: grey)),
          // height: height,
          width: width,
          child: customField(num, max, controller!, readOnly),
        ),
      ],
    ),
  );
}

Widget customField(
    bool num,  max, TextEditingController controller, bool readOnly) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      readOnly: readOnly,
      cursorColor: black,
      controller: controller,
      minLines: 1,
      maxLines: max ,
      keyboardType: num ? TextInputType.number : TextInputType.text,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: 'Tap to add',
        hintStyle: GoogleFonts.ubuntu(
          height: 1.3,
          textStyle: TextStyle(color: grey, fontSize: mHeight! / 47),
        ),
        filled: true,
        fillColor: Colors.transparent,
        border: InputBorder.none,
      ),
      style: GoogleFonts.ubuntu(
        height: 1.3,
        textStyle: TextStyle(color: grey1, fontSize: mHeight! / 47),
      ),
    ),
  );
}
