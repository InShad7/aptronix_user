import 'package:aaptronix/get_started/get_started.dart';
import 'package:aaptronix/login_screen/login_screen.dart';
import 'package:aaptronix/splash_screen.dart/spalsh_screen.dart';
import 'package:aaptronix/widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}
