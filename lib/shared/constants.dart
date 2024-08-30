
import 'package:flutter/material.dart';


var emailInputDecor = InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    prefixIcon: const Icon(Icons.email),
                    filled: true,
                    fillColor: Colors.brown[50],
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
                    fillColor: Colors.brown[50],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.brown, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  );