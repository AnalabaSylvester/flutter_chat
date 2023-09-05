import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth/auth_service.dart';
import '../widgets/custom_appBar.dart';
import 'chat_page.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomAppBar(
              text: "Chats",
              settings: () {
                signOut();
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                //   return Settings();
                // }));
              },
            )),
        body: _buildUserList());
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Erroe");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }

          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildUserListItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    // display all users except current user
    if (_auth.currentUser!.email != data['email']) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatPage(
                        receiverUserEmail: data['email'],
                        receiveUserId: data['uid'])));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 229, 233, 239),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 2, 15),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                          //     child: Icon(
                          //   Icons.person_2,
                          //   color: Colors.grey,
                          // )),
                          )),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    data['email'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // return ListTile(
      //   title: Text(data['email']),
      //   onTap: () {
      //     //pass the clicked user's UID to the chat page
      //     //check here if anything goes wrong .
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => ChatPage(
      //                 receiverUserEmail: data['email'],
      //                 receiveUserId: data['uid'])));
      //   },
      // );
    } else {
      return Container();
    }
  }
}
