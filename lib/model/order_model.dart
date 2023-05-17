import 'package:cloud_firestore/cloud_firestore.dart';

class Ordered {
  String username;
  dynamic address;
  dynamic products;
  int count;
  String? id;

  Ordered(
      {required this.username,
      required this.address,
      required this.products,
      required this.count,
      this.id});

  Future<void> addToOrderedList() async {
    try {
      final ref = FirebaseFirestore.instance.collection('orders');
      final docRef = ref.doc(DateTime.now().toString());
      final id = docRef.id;

      Map<String, dynamic> saveWish() {
        return {
          'username': username,
          'count': count,
          'products': products,
          'address': address,
          'id': id,
        };
      }

      await docRef.set(saveWish());
    } catch (e) {
      print('Error adding product: $e');
    }
  }
}
