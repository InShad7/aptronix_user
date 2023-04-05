import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customTextField(
    {required String label,
    required double ht,
    required double width,
    required bool num,
    required int max,
    required String content,
    required bool readOnly}) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          " $label",
          style: GoogleFonts.roboto(
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        kHeight5,
        Container(
          decoration: BoxDecoration(
            color: grey,
            borderRadius: BorderRadius.circular(18),
          ),
          height: ht,
          width: width,
          child: customField(num, max, content, readOnly),
        ),
      ],
    ),
  );
}

Widget customField(bool num, int max, String content, bool readOnly) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      minLines: 1,
      initialValue: content,
      readOnly: readOnly,
      maxLines: max,
      keyboardType: num ? TextInputType.number : TextInputType.text,
      textAlignVertical: TextAlignVertical.center,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        border: InputBorder.none,
      ),
      style: GoogleFonts.roboto(
        height: 1.3,
        textStyle: TextStyle(color: grey1, fontSize: 22),
      ),
    ),
  );
}
