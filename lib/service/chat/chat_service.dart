import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goat_farm_manager/models/messages_model.dart';

class ChatService {
  // instance of firestore

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //user stream
  Stream<List<Map<String,dynamic>>> getUserStream(){
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user =doc.data();

        return user;
      }).toList();
    });
  }  
 // send message
 Future<void> sendMessage(String rID, message) async {
  //get the sender info
  final String cUserID = _auth.currentUser!.uid;
  final String cUserEmail = _auth.currentUser!.email!;
  final Timestamp timestamp = Timestamp.now();

  //create new message
Messag newMessage = Messag(
  senderID: cUserID,
  senderemail: cUserEmail,
  recieverID: rID,
  timestamp: timestamp,
  message: message);
  //chat room ID
List<String>ids = [cUserID, rID];
ids.sort();
String chatRoomID = ids.join('_');
  //add message to database
await _firestore.collection("chat_rooms").doc(chatRoomID).collection("messages").add(newMessage.toMap());

 } 
   //get message
  Stream <QuerySnapshot> getMessages(String userID, otherUserID){
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String  chatRoomID = ids.join('_');
    return _firestore.collection("chat_rooms").doc(chatRoomID).collection("messages").orderBy("timestamp", descending: false).snapshots();

  }
}