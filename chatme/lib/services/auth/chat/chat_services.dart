import 'package:chatme/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ChatService extends ChangeNotifier {
  //get instance of auth and fireStore

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // SEND MESSAGE
  Future<void> sendMessage(String recieverId, String message) async {
    // get user info
    final String currenduserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    // create a new message
    Messages newMessage = Messages(
        senderId: currenduserId,
        senderEmail: currentUserEmail,
        receiverId: recieverId,
        message: message,
        timestamp: timestamp);

    // contract chat room id
    List<String> ids = [currenduserId, recieverId];
    ids.sort(); //sorting the ids in the chat room to ensure the id is the same
    String chatRoomId = ids.join("_");

    // add new message to database
    await _fireStore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  //Get Messages
  Stream<QuerySnapshot> getMessages(String userId, String otherUserUid) {
    List<String> ids = [userId, otherUserUid];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _fireStore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false )
        .snapshots();
  }
}
