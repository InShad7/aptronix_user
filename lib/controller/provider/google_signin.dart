import 'package:aaptronix/controller/controller.dart';
import 'package:aaptronix/model/wish_list_model.dart';
import 'package:aaptronix/view/order_summary_screen/address_screen/select_address_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

int flag = 0;

class GoogleSignInProvider extends ChangeNotifier {
  final googleSIgnIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
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
      WishList myCartObj = WishList(
        wishList: myWishList,
        cart: myCart,
        count: countList,
        productTotal: myProductTotal,
        address: addressList,currentAddress: selectedAddress,
      );
      myCartObj.addToWishList();
      

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
