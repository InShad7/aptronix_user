import 'package:aaptronix/main.dart';
import 'package:aaptronix/view/login_screen/widgets/text_field.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn( {super.key});

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
                signIn(context);
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



  Future signIn(context) async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: LoadingAnimationWidget.inkDrop(color: white, size: 30),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userNameController.text.trim(),
          password: passwordController.text.trim());

    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
