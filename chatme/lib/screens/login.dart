import 'package:chatme/services/auth/auth_service.dart';
import 'package:chatme/widgets/inputtextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_btn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.onTap});

  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void signIn() async {
    // get the user auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInWithEmailPassword(email.text, password.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Chat Me",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(height: 40),
                const Text(
                  "Welcome Back.",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                ),
                const SizedBox(height: 40),
                MyTextField(
                  controller: email,
                  validator: (email) {
                    if (email!.isEmpty || !email.contains("@")) {
                      return "Please enter a valid emailAddress";
                    } else {
                      return null;
                    }
                  },
                  hintText: "Enter your email",
                  obscuretext: false,
                ),
                const SizedBox(height: 20),
                MyTextField(
                    controller: password,
                    validator: (password) {
                      if (password!.isEmpty || password.length < 7) {
                        return "Enter a valid password";
                      } else {
                        return null;
                      }
                    },
                    hintText: "Password",
                    obscuretext: true),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        " Sign up",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomBtn(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      signIn();
                    }
                  },
                  text: 'Login',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
