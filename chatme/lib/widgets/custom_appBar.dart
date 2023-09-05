import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.settings, required this.text});

  final void Function()? settings;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:const Color.fromARGB(255, 3, 8, 142),
      actions: [
        IconButton(
            onPressed: settings,
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
              size: 25,
            )),
      ],
      title: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 23, fontWeight: FontWeight.w700),
      ),
    );
  }
}
