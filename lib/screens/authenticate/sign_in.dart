import 'package:coffee_app_firebase/services/auth.dart';
import 'package:coffee_app_firebase/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignIn extends StatefulWidget {
  final Function toggleview;

  const SignIn({super.key, required this.toggleview});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text("Sign In", style: TextStyle(color: Colors.white)),
        actions: [
          TextButton.icon(
              onPressed: () {
                widget.toggleview();
              },
              icon: const Icon(
                Icons.app_registration,
                color: Colors.white,
              ),
              label: const Text("Register",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)))
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  decoration: emailInputDecor,
                  validator: (value) =>
                      value!.isEmpty ? "Enter your email" : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: passwordInputDecor,
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? "Enter your password" : null,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                const SizedBox(height: 20),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.brown,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 30.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      if (isLoading) {
                        EasyLoading.show(status: "Signing in...");
                      }
                      try {
                        await _auth.signIn(email, password);
                      } catch (e) {
                        setState(() {
                          error = e.toString();
                        });
                      } finally {
                        setState(() {
                          isLoading = false;
                        });
                        EasyLoading.dismiss();
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  error,
                  style: const TextStyle(color: Colors.red, fontSize: 32),
                ),
              ],
            ),
          )),
    );
  }
}
