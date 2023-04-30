import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Stream getProducts() async* {
  final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('products').get();
  final List<DocumentSnapshot> docs = querySnapshot.docs;
  yield docs;
}

Stream GetImages() async* {
  final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('FeatureImage').get();
  final List<DocumentSnapshot> docs = querySnapshot.docs;
  yield docs;
}

List<dynamic> myWishList = [];
Future<void> getWishList() async {
  final ref = await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.email)
      .get();
  if (ref.exists) {
    final data = ref.data()!['wishList'];
    myWishList = data ?? ['no data'];

    if (myWishList.length > 1 && myWishList[0] == 'no data') {
      myWishList.removeAt(0);
      log(myWishList.toString());
    }
  } else {
    myWishList = ['no data'];
  }

  if (ref.exists) {
    final data = ref.data()!['cart'];
    myCart = data ?? ['no data'];

    if (myCart.length > 1 && myCart[0] == 'no data') {
      myCart.removeAt(0);
      log(myCart.toString());
    }
  } else {
    myCart = ['no data'];
  }
}

List<dynamic> myCart = [];



// User user = FirebaseAuth.instance.currentUser!;

