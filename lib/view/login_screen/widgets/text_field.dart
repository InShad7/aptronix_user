import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();

class MyTextField extends StatefulWidget {
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
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 12),
            height: widget.ht,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.border),
              color: cardClr,
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                obscureText: widget.passChar,
                controller: widget.myControler,
                cursorColor: blue,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(color: black),
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(widget.icon, size: 28, color: blue),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.all(5),
                  hintText: widget.title,
                  hintStyle: GoogleFonts.roboto(
                    textStyle: const TextStyle(fontSize: 22),
                  ),
                ),
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: (email) {

                //   email != null && !EmailValidator.validate(email)
                //       ? 'Enter a valid email'
                //       : null;

                //   // email != null && email.length < 6
                //   //     ? 'enter a minimum of 6 characters'
                //   //     : null;
                // },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
