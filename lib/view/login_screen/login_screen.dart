import 'package:aaptronix/view/login_screen/widgets/login_btn.dart';
import 'package:aaptronix/view/login_screen/widgets/main_card.dart';
import 'package:aaptronix/view/login_screen/widgets/text_field.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// double? mWidth;
// double? mHeight;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // mWidth = MediaQuery.of(context).size.width;
    // mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(physics: BouncingScrollPhysics(), children: [
          const SignInText(),
          kHeight20,
          MyTextField(
            ht: 60,
            border: 20,
            title: 'Email Or Phone',
            icon: Icons.mail,
            myControler: userNameController,
            passChar: false,
          ),
          kHeight,
          MyTextField(
            ht: 60,
            border: 20,
            title: 'Password',
            icon: Icons.lock,
            myControler: passwordController,
            passChar: true,
          ),
          kHeight,
          kHeight20,
          const LoginBtn(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "New user? ",
                style: GoogleFonts.roboto(fontSize: 18),
              ),
              InkWell(
                child: Text(
                  "Sign Up ",
                  style: GoogleFonts.roboto(fontSize: 18, color: blue),
                ),
                onTap: () {},
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
