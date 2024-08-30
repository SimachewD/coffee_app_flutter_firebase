import 'package:coffee_app_firebase/models/user.dart';
import 'package:coffee_app_firebase/screens/authenticate/authenticate.dart';
import 'package:coffee_app_firebase/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserCustom?>(context);

    // return home or auth widget conditionally
    if (user == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
