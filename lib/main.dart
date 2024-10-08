import 'package:coffee_app_firebase/screens/wrapper.dart';
import 'package:coffee_app_firebase/services/auth.dart';
import 'package:coffee_app_firebase/shared/constants.dart';
import 'package:flutter/material.dart';

// firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: const Wrapper(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
