import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscuretext,
    this.validator,
    this.suffixIcon,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final bool obscuretext;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscuretext,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 0.5)),
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 0.5)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 0.5)),
          fillColor: Colors.grey),
    );
  }
}
