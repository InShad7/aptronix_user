import 'package:aaptronix/view/login_screen/widgets/login_btn.dart';
import 'package:aaptronix/view/login_screen/widgets/main_card.dart';
import 'package:aaptronix/view/login_screen/widgets/text_field.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        const SignInText(title: 'Sign Up'),
        kHeight20,
        MyTextField(
          ht: 60,
          border: 20,
          title: 'Name',
          icon: Icons.abc_sharp,
          myControler: userNameController,
          passChar: false,
        ),
        kHeight,
        MyTextField(
          ht: 60,
          border: 20,
          title: 'Email',
          icon: Icons.mail,
          myControler: passwordController,
          passChar: true,
        ),
        kHeight,
        MyTextField(
          ht: 60,
          border: 20,
          title: 'Phone',
          icon: Icons.call,
          myControler: passwordController,
          passChar: true,
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
      ]),
    );
  }
}
