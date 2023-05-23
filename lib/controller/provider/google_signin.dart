import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/wish_list_model.dart';
import 'package:aaptronix/view/order_summary_screen/address_screen/select_address_screen.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loading_indicator/loading_indicator.dart';

int flag = 0;

class GoogleSignInProvider extends ChangeNotifier {
  final googleSIgnIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin(context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: LoadingIndicator(
            indicatorType: Indicator.circleStrokeSpin,
            colors: [white],
            strokeWidth: 2,
          ),
        ),
      ),
    );
    try {
      final googleUser = await googleSIgnIn.signIn();
      if (googleUser == null) {
        return;
      }
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Sign-In successful',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(fontSize: 20),
            ),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );

      flag = 1;
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future googleLogout() async {
    await googleSIgnIn.disconnect();
    FirebaseAuth.instance.signOut();
    _user = null;
  }
}
