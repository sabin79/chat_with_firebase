import 'package:chat_with_firebase/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChatService {
  // get instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // list<Map<String, dynamic>>>
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  Future<void> sendMessage(String receiverId, String message) async {
    final userId = _auth.currentUser!.uid;
    final userEmail = _auth.currentUser!.email!;
    final timestamp = Timestamp.now();

    Message newMessage = Message(
      senderID: userId,
      SenderEmail: userEmail,
      receiverID: receiverId,
      message: message,
      timestamp: timestamp,
    );

    List<String> ids = [userId, receiverId];
    ids.sort();
    String chatId = ids.join("_");

// add new message to databse
    await _firestore
        .collection("chats")
        .doc(chatId)
        .collection("messages")
        .add(newMessage.toMap());
  }

// get message
  Stream<QuerySnapshot> getMessages(String UserId, otherUserId) {
    List<String> ids = [UserId, otherUserId];
    ids.sort();
    String chatId = ids.join("_");
    return _firestore
        .collection("chats")
        .doc(chatId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
