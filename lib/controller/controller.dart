import 'dart:developer';

import 'package:aaptronix/view/order_summary_screen/address_screen/select_address_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController pincodeController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController stateController = TextEditingController();
TextEditingController houseController = TextEditingController();
TextEditingController streetController = TextEditingController();

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
List<dynamic> myCart = [];
List countList = [];
List myProductTotal = [];
int? total;

List categoryList = [];
List iphoneList = [];
List ipadList = [];
List watchList = [];
List macList = [];
List myProduct = [];
List cartItems = [];
List addressList = [];

List searchList = [];
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

  if (ref.exists) {
    final data = ref.data()!['count'];
    countList = data ?? ['no data'];

    if (countList.length > 1 && countList[0] == 'no data') {
      countList.removeAt(0);
      log(countList.toString());
    }
  } else {
    countList = ['no data'];
  }

  if (ref.exists) {
    final data = ref.data()!['productTotal'];
    myProductTotal = data ?? ['no data'];

    if (myProductTotal.length > 1 && myProductTotal[0] == 'no data') {
      myProductTotal.removeAt(0);
      log(myProductTotal.toString());
    }
  } else {
    myProductTotal = ['no data'];
  }

  if (ref.exists) {
    final data = ref.data()!['address'];
    addressList = data ?? ['no data'];

    if (addressList.length > 1 && addressList[0] == 'no data') {
      addressList.removeAt(0);
      log(addressList.toString());
    }
  } else {
    addressList = ['no data'];
  }

  if (ref.exists) {
    final data = ref.data()!['selectedAddress'];
    selectedAddress = data ?? ['no data'];

    if (selectedAddress.length > 1 && selectedAddress[0] == 'no data') {
      selectedAddress.removeAt(0);
      log(selectedAddress.toString());
    }
  } else {
    selectedAddress = ['no data'];
  }
}





// User user = FirebaseAuth.instance.currentUser!;

