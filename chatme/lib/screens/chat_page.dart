import 'package:chatme/widgets/chat_bubbles.dart';
import 'package:chatme/widgets/chat_input_field.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth/chat/chat_services.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiveUserId;

  const ChatPage(
      {super.key,
      required this.receiverUserEmail,
      required this.receiveUserId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    //only use message if ther is something to send

    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiveUserId, _messageController.text);

      // Clear the text controller or text field when the message is sent.
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 3, 8, 142),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_sharp,
                size: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)),
              child: const Center(
                  child: Icon(
                Icons.person_2,
                color: Colors.grey,
              )),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.receiverUserEmail,
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildMessageInput(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  // build message list
  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatService.getMessages(
            widget.receiveUserId, _firebaseAuth.currentUser!.uid),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Message not sent${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Loading Messages..'));
          }
          return ListView(
            children: snapshot.data!.docs
                .map((docunemt) => _buildMessageItem(docunemt))
                .toList(),
          );
        }));
  }

  // build message item
  Widget _buildMessageItem(QueryDocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    // align message to the right if the sender is the current user, otherwise to the left
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
        alignment: alignment,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment:
                  (data['senderId'] == _firebaseAuth.currentUser!.uid)
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
              mainAxisAlignment:
                  (data['senderId'] == _firebaseAuth.currentUser!.uid)
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
              children: [
                Text(
                  data['senderEmail'],
                  style: const TextStyle(color: Colors.black, fontSize: 10),
                ),
                const SizedBox(height: 8),
                ChatBubble(message: (data['message']))
                // ,
              ]),
        ));
  }

  //build message input
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: ChatInputField(
                controller: _messageController,
                hintText: "Message",
                obscuretext: false),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: IconButton(
                onPressed: sendMessage,
                icon: const Icon(
                  Icons.send,
                  size: 40,
                  color: Color.fromARGB(255, 3, 8, 142),
                )),
          ),
        ],
      ),
    );
  }
}
