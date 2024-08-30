import 'package:coffee_app_firebase/services/auth.dart';
import 'package:coffee_app_firebase/shared/constants.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleview;

  const Register({super.key, required this.toggleview});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: const Text(
            "Register",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton.icon(
                onPressed: () {
                  widget.toggleview();
                },
                icon: const Icon(
                  Icons.login,
                  color: Colors.white,
                ),
                label: const Text("Sign In",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)))
          ]),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  decoration: emailInputDecor,
                  validator: (value) => value!.isEmpty ? "Email can't be empty":null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: passwordInputDecor,
                  validator: (value) => value!.isEmpty ? "Password can't be empty":null,
                  obscureText: true,
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
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  onPressed: () async{
                    if (_formkey.currentState!.validate()) {
                      try {
                          await _auth.registerFirebaseUser(email, password);
                        } catch (e) {
                          setState(() {
                            error = e.toString();
                          });
                        }
                    }
                  },
                ),
                const SizedBox(height: 12,),
                Text(error, style: const TextStyle(color: Colors.red),)
              ],
            )
          )
        ),
    );
  }
}
