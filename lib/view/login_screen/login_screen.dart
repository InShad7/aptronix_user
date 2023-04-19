import 'package:aaptronix/view/login_screen/widgets/login_btn.dart';
import 'package:aaptronix/view/login_screen/widgets/main_card.dart';
import 'package:aaptronix/view/login_screen/widgets/google_signup_btn.dart';
import 'package:aaptronix/view/login_screen/widgets/signup_btn.dart';
import 'package:aaptronix/view/login_screen/widgets/text_field.dart';
import 'package:aaptronix/view/signup_screen.dart/signup_screen.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        const SignInText(title: 'Sign In'),
        kHeight20,
        MyTextField(
          ht: 60,
          border: 20,
          title: 'Email',
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
        const GoogleSignUpBtn(),
        kHeight20,
        kHeight,
        SignUpTxtBtn(navigateTo: SignUpScreen()),
      ]),
    );
  }
}
