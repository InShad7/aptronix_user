import 'package:aaptronix/view/login_screen/login_screen.dart';
import 'package:aaptronix/view/login_screen/widgets/main_card.dart';
import 'package:aaptronix/view/login_screen/widgets/signup_btn.dart';
import 'package:aaptronix/view/login_screen/widgets/text_field.dart';
import 'package:aaptronix/view/signup_screen.dart/widget/sign_up_btn.dart';
import 'package:aaptronix/view/utils/utils.dart';
import 'package:flutter/material.dart';

var formKey1 = GlobalKey<FormState>();

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey1,
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          const SignInText(title: 'Sign Up'),
          kHeight20,
          kHeight,
          MyTextField(
            ht: 60,
            border: 20,
            title: 'Name',
            icon: Icons.abc,
            myControler: nameController,
            passChar: false,
          ),
          kHeight,
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
          SignUpBtn(
            fromKey1: formKey1,
          ),
          kHeight20,
          SignUpTxtBtn(
            signUp: false,
            navigateTo: LoginScreen(),
          )
        ]),
      ),
    );
  }
}
