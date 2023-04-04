import 'package:aaptronix/login_screen/login_screen.dart';
import 'package:aaptronix/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var formKey = GlobalKey<FormState>();

TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class MyTextField extends StatelessWidget {
  String title;
  var myControler;
  IconData? icon;
  bool passChar;
  double ht;
  double border;
  MyTextField(
      {super.key,
      required this.title,
      required this.icon,
      required this.myControler,
      required this.passChar,
      required this.ht,
      required this.border});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 12),
            height: ht,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(border),
              color: grey,
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                obscureText: passChar,
                controller: myControler,
                cursorColor: blue,
                style: TextStyle(color: black),
                decoration: InputDecoration(
                  prefixIcon: Icon(icon, size: 28, color: blue),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.all(5),
                  hintText: title,
                  hintStyle: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(fontSize: 22),
                  ),
                ),
                // validator: (value) {
                //   if (value == null || value.isEmpty || value.trim() == '') {
                //     return 'Please Enter Credential';
                //   }
                //   return null;
                // },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
