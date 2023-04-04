import 'package:aaptronix/home_screen/home_screen.dart';
import 'package:aaptronix/login_screen/login_screen.dart';
import 'package:aaptronix/login_screen/widgets/text_field.dart';
import 'package:aaptronix/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({super.key});

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
                if (formKey.currentState!.validate()) {
                  checkLogin(context);
                }
              },
              child: Text(
                'Sign In',
                style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(fontSize: 28)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 290),
            child: Text(
              'Aptronix Welcomes You',
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                    fontSize: 22, color: grey, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  void checkLogin(BuildContext context) async {
    if (userNameController.text == 'admin' &&
        passwordController.text == 'pass') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Loged In Succesfully',
            style: GoogleFonts.ubuntu(
              textStyle: const TextStyle(fontSize: 18),
            ),
          ),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );

      final sharedPrefer = await SharedPreferences.getInstance();
      await sharedPrefer.setBool('isLoggedIn', true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => HomeScreen()),
        ),
      );
    } else if (userNameController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please Enter Valid Credential',
            style: GoogleFonts.ubuntu(
              textStyle: const TextStyle(fontSize: 18),
            ),
          ),
          backgroundColor: red,
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Invalid Username And Password',
            style: GoogleFonts.ubuntu(
              textStyle: const TextStyle(fontSize: 18),
            ),
          ),
          backgroundColor: red,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
