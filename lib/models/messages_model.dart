import 'package:cloud_firestore/cloud_firestore.dart';

class Messag {
  final String senderID;
  final String senderemail;
  final String recieverID;
  final String message;
  final Timestamp timestamp;

Messag({
  required this.senderID,
  required this.senderemail,
  required this.recieverID,
  required this.timestamp,
  required this.message,
});
// convert to map
Map<String, dynamic> toMap(){
  return {
    'senderID' :senderID,
    'senderemail': senderemail,
  'recieverID': recieverID,
  'message': message,
  'timestamp': timestamp,

  };
}
}