import 'package:cloud_firestore/cloud_firestore.dart';

Stream getProducts() async* {
  final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('products').get();
  final List<DocumentSnapshot> docs = querySnapshot.docs;
  yield docs;
}

Stream GetImages() async* {
  final QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('FeatureImage').get();
  final List<DocumentSnapshot> docs = querySnapshot.docs;
  yield docs;
}


// User user = FirebaseAuth.instance.currentUser!;

