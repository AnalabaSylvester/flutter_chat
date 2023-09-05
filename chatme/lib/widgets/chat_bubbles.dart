
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;

  const ChatBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const  EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 3, 8, 142),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        message,
        style: const TextStyle(
            fontWeight: FontWeight.normal, color: Colors.white, fontSize: 14),
      ),
    );
  }
}
