import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WishList {
  List<dynamic> wishList;
  List<dynamic> cart;
  List<dynamic> count;
  List productTotal;
  List address;
  dynamic currentAddress;
  String buyNow;
  int buyNowCount;
  int buyNowTotal;

  WishList({
    required this.wishList,
    required this.cart,
    required this.count,
    required this.productTotal,
    required this.address,
    required this.currentAddress,
    required this.buyNow,
    required this.buyNowCount,
    required this.buyNowTotal,
  });

  Future<void> addToWishList() async {
    try {
      final ref = FirebaseFirestore.instance.collection('users');
      final docRef = ref.doc(FirebaseAuth.instance.currentUser!.email);
      // final id = docRef.id;

      Map<String, dynamic> saveWish() {
        return {
          'wishList': wishList,
          'cart': cart,
          'count': count,
          'productTotal': productTotal,
          'address': address,
          'selectedAddress': currentAddress,
          'buyNow': buyNow,
          'buyNowCount': buyNowCount,
          'buyNowTotal': buyNowTotal,
        };
      }

      await docRef.set(saveWish());
    } catch (e) {
      print('Error adding product: $e');
    }
  }
}
