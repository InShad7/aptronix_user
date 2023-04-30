// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class Cart {
//   List<dynamic> cart;

//   Cart({required this.cart});

//   Future<void> addToCart() async {
//     try {
//       final ref = FirebaseFirestore.instance.collection('users');
//       final docRef = ref.doc(FirebaseAuth.instance.currentUser!.email);
//       // final id = docRef.id;

//       Map<String, dynamic> saveWish() {
//         return {'cart': cart};
//       }

//       await docRef.set(saveWish());
//     } catch (e) {
//       print('Error adding product: $e');
//     }
//   }
// }
