import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices {
  // get instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // list<Map<String, dynamic>>>
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }
}
