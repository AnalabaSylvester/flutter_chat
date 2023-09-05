import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
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
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
      validator: validator,
      controller: controller,
      obscureText: obscuretext,
      decoration: InputDecoration(
        
          suffixIcon: suffixIcon,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 0.8)),
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 0.8)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 0.8)),
          fillColor: Colors.grey),
          
    );
  }
}
