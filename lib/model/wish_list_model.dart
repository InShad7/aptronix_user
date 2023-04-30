import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WishList {
  List<dynamic> wishList;
  List<dynamic> cart;

  WishList({required this.wishList, required this.cart});

  Future<void> addToWishList() async {
    try {
      final ref = FirebaseFirestore.instance.collection('users');
      final docRef = ref.doc(FirebaseAuth.instance.currentUser!.email);
      // final id = docRef.id;

      Map<String, dynamic> saveWish() {
        return {'wishList': wishList, 'cart': cart};
      }

      await docRef.set(saveWish());
    } catch (e) {
      print('Error adding product: $e');
    }
  }
}
