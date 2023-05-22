import 'dart:developer';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mHeight = MediaQuery.of(context).size.height;
    mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ListView(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder(
            stream: getProducts(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: 850,
                  width: mWidth,
                  child: Center(
                    child: Text(
                      'aptronix.',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 55, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.done ||
                  snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  final data = snapshot.data;
                  iphoneList = data
                      .where((item) => 'iPhone' == item['category'])
                      .toList();
                  ipadList =
                      data.where((item) => 'iPad' == item['category']).toList();
                  watchList = data
                      .where((item) => 'iWatch' == item['category'])
                      .toList();
                  macList = data
                      .where((item) => 'MacBook' == item['category'])
                      .toList();
                  buyNow = myProduct
                      .where((item) => buyNowItem == item['id'])
                      .toList();
                  log('buy from home ${buyNow}');
                  categoryList = myProduct = data;

                  return SizedBox(
                    height: 850,
                    width: mWidth,
                    child: Center(
                      child: Text(
                        'aptronix.',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 55, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                }
              }
              return Text('Cant fetch data');
            }),
        StreamBuilder(
            stream: GetImages(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox();
              }
              if (snapshot.connectionState == ConnectionState.done ||
                  snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  curoselImg = data;
                  return snapshot.data!.isEmpty
                      ? const Center(child: Text('List empty'))
                      : SizedBox();
                }
              }
              return Text('Cant fetch data');
            })
      ],
    ));
  }

  void checkLogin() async {
    await Future.wait([
      getProducts().first,
      GetImages().first,
    ]);
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
            getWishList();
            return BottomNavBar(state: false);
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
