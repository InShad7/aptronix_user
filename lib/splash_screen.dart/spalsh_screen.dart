import 'package:aaptronix/home_screen/home_screen.dart';
import 'package:aaptronix/login_screen/login_screen.dart';
import 'package:aaptronix/widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

double? mHeight;
double? mWidth;
bool isloggedIn = false;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mHeight = MediaQuery.of(context).size.height;
    mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Text(
          'Aptronix',
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(fontSize: 55),
          ),
        ),
      ),
    );
  }

  void checkLogin() async {
    final sharedPrefer = await SharedPreferences.getInstance();
    bool loggedIn = sharedPrefer.getBool('isLoggedIn') ?? false;
    if (loggedIn == true) {
      await Future.delayed(
        const Duration(seconds: 2),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavBar(),
        ),
      );
    } else {
      await Future.delayed(
        const Duration(seconds: 2),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }
}
