
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


var emailInputDecor = InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    prefixIcon: const Icon(Icons.email),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.brown, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  );

var passwordInputDecor = InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(Icons.lock),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.brown, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  );
void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 72.0
    ..fontSize = 32.0
    ..radius = 10.0
    ..backgroundColor = Colors.transparent
    ..maskColor = Colors.transparent
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..boxShadow = []
    ..userInteractions = false
    ..dismissOnTap = false;
}