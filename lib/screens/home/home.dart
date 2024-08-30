import 'package:coffee_app_firebase/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();

    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("My coffee", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          TextButton.icon(
            onPressed: () async {
              await _auth.signout();
              print('Signd out');
            },
            label: Text("Logout", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            icon: Icon(Icons.person, color: Colors.white),
          )
        ],
      ),
    );
  }
}
