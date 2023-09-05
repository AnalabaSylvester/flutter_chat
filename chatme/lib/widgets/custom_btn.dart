import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    Key? key,
    this.onTap,
    required this.text,
  }) : super(key: key);

  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.pink,
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 3, 8, 142),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
