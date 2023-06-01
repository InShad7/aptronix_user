import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/view/login_screen/login_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:aaptronix/view/widget/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

double? mHeight;
double? mWidth;
bool isLoggedIn = false;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLogin();
    initialize();
    super.initState();
  }

  Future<void> initialize() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await getWishList();
    }
  }

  @override
  Widget build(BuildContext context) {
    mHeight = MediaQuery.of(context).size.height;
    mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      children: [
        StreamBuilder(
            stream: getImages(),
            builder: (context, snapshot) {
              curoselImg = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                Container(
                  height: mHeight,
                  width: mWidth,
                  child: Center(
                    child: Text(
                      'aptronix.',
                      style: GoogleFonts.roboto(
                        textStyle:
                            TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.done ||
                  snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  // return Text('list empty');
                }
              }
              return SizedBox();
            }),
        StreamBuilder(
            stream: getProducts(),
            builder: (context, snapshot) {
              final data = snapshot.data;

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  height: mHeight,
                  width: mWidth,
                  child: Center(
                    child: Text(
                      'aptronix.',
                      style: GoogleFonts.roboto(
                        textStyle:
                            TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.done ||
                  snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  iphoneList = data
                      .where((element) => "iPhone" == element["category"])
                      .toList();
                  ipadList = data
                      .where((element) => "iPad" == element["category"])
                      .toList();
                  watchList = data
                      .where((element) => 'iWatch' == element["category"])
                      .toList();
                  macList = data
                      .where((element) => 'MacBook' == element["category"])
                      .toList();

                  categoryList = myProduct = data;
                }
              }
              return Container(
                height: mHeight,
                width: mWidth,
                child: Center(
                  child: Text(
                    'aptronix.',
                    style: GoogleFonts.roboto(
                      textStyle:
                          TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            }),
      ],
    ));
  }

  void checkLogin() async {
    await Future.wait(
      [getProducts().first, getImages().first],
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CheckUserLogin(),
      ),
    );
  }
}

class CheckUserLogin extends StatelessWidget {
  const CheckUserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingIndicator(
                indicatorType: Indicator.circleStrokeSpin,
                colors: [white],
                strokeWidth: 2,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Something went wrong',
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          if (snapshot.hasData) {
            // return BottomNavbar(
            //   cart: false,
            // );
            // getwish();
            return BottomNavBar();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
