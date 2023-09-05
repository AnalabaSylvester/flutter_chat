
// import 'package:chatme/screens/chat_page.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class UserListPage extends StatelessWidget {
//   const UserListPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }

// final FirebaseAuth _auth = FirebaseAuth.instance;

// Widget _buildUserList(DocumentSnapshot document) {
//   return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('users').snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Text("Erroe");
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Text("Loading...");
//         }

//         return ListView(
//           children: snapshot.data!.docs
//               .map<Widget>((doc) => _buildUserList(doc))
//               .toList(),
//         );
//       });
// }

// Widget _buildUserListItem(DocumentSnapshot document) {
//   Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

//   // display all users except current user
//   if (_auth.currentUser!.email != data['email']) {
//     return ListTile(
//       title: Text(data['email']),
//       onTap: () {
//         //pass the clicked user's UID to the chat page
//         //check here if anything goes wrong .
//         Navigator.push(
//             context as BuildContext,
//             MaterialPageRoute(
//                 builder: (context) => ChatPage(
//                     receiversEmail: data['email'], receiversId: data['uid'])));
//       },
//     );
//   } else {
//     return Container();
//   }
// }
