import 'package:aaptronix/view/utils/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var formKey = GlobalKey<FormState>();

TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();

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
              color: cardClr,
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                obscureText: passChar,
                controller: myControler,
                cursorColor: blue,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(color: black),
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(icon, size: 28, color: blue),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.all(5),
                  hintText: title,
                  hintStyle: GoogleFonts.roboto(
                    textStyle: const TextStyle(fontSize: 22),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) {
                  email != null && !EmailValidator.validate(email)
                      ? 'Enter a valid email'
                      : null;

                  // email != null && email.length < 6
                  //     ? 'enter a minimum of 6 characters'
                  //     : null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
