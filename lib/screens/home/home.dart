import 'package:coffee_app_firebase/models/coffee.dart';
import 'package:coffee_app_firebase/models/user.dart';
import 'package:coffee_app_firebase/screens/home/coffee_list.dart';
import 'package:coffee_app_firebase/services/auth.dart';
import 'package:coffee_app_firebase/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService auth = AuthService();
    final user = Provider.of<UserCustom?>(context);

    return StreamProvider<List<Coffee>?>.value(
        value: DatabaseService(uid: user?.uid).userCoffee,
        initialData: null,
        child: Scaffold(
        backgroundColor: Colors.brown.withOpacity(0.1),
        appBar: AppBar(
          title: const Text("My coffee", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: [
            TextButton.icon(
              onPressed: () async {
                await auth.signout();
              },
              label: const Text("Logout", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              icon: const Icon(Icons.person, color: Colors.white),
            )
          ],
        ),
        body: const CoffeeList(),
      ),
    );
  }
}
