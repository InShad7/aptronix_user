import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WishList {
  List<dynamic> wishList;

  WishList({required this.wishList});

  Future<void> addToWishList() async {
    try {
      final ref = FirebaseFirestore.instance.collection('users');
      final docRef = ref.doc(FirebaseAuth.instance.currentUser!.uid);
      // final id = docRef.id;

      Map<String, dynamic> saveWish() {
        return {'wishList': wishList};
      }

      await docRef.set(saveWish());
    } catch (e) {
      print('Error adding product: $e');
    }
  }
}
