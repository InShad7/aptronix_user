import 'package:aaptronix/main.dart';
import 'package:aaptronix/view/home_screen/widget/fav_icon.dart';
import 'package:aaptronix/view/login_screen/widgets/text_field.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignUpBtn extends StatelessWidget {
  const SignUpBtn({super.key, this.fromKey1});
  final fromKey1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                signUp(context, fromKey1);
                // if (formKey.currentState!.validate()) {
                // checkLogin(context);
                // }
                userNameController.clear();
                passwordController.clear();
              },
              child: Text(
                'Sign In',
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(fontSize: 28)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future signUp(context, formKey1) async {
    // final isValid = formKey1.currenState.validate();
    // if (!isValid) {
    //   return;
    // }

    if (nameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        userNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please enter valid Credentials',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(fontSize: 20),
            ),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: deleteRed,
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => Center(
          child: LoadingAnimationWidget.inkDrop(color: white, size: 30),
        ),
      );

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userNameController.text.trim(),
          password: passwordController.text.trim(),
        );
        // Get the current user
        final currentUser = FirebaseAuth.instance.currentUser;

        // Update the display name
        await currentUser!.updateDisplayName(nameController.text.trim());
      } on FirebaseAuthException catch (e) {
        print(e);
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }
  }
}
