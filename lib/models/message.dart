import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
final String senderID;
final String receiverID;
final String SenderEmail;
final String message;
final Timestamp timestamp;

Message({
  required this.senderID,
  required this.receiverID,
  required this.SenderEmail,
  required this.message,
  required this.timestamp,
});

Map<String, dynamic> toMap() {
  return {
    'senderID': senderID,
    'receiverID': receiverID,
    'SenderEmail': SenderEmail,
    'message': message,
    'timestamp': timestamp,
  };  

}
}