import 'package:aaptronix/view/order_summary_screen/address_screen/address_screen.dart';
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
    required bool readOnly,
    bool btn = false,
    String btnName = '',
    context}) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              " $label",
              style: GoogleFonts.roboto(
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Visibility(
              visible: btn,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  foregroundColor: grey1,
                  backgroundColor: cardClr,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddressScreen(),
                    ),
                  );
                },
                child: Text(
                  btnName,
                  style: GoogleFonts.roboto(
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
        kHeight5,
        Container(
          decoration: BoxDecoration(
            color: cardClr,
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
