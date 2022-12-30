// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

// ignore: use_key_in_widget_constructors
class Result extends StatelessWidget {
  static String id = 'Result';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // theme: customLightTheme(),
      // darkTheme: customDarkTheme(),
      // themeMode: ThemeMode.system,
      body: Scaffold(
        appBar: NewGradientAppBar(
          title: const Text(
            "Analyze health",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 234, 236, 236),
              Color.fromARGB(255, 224, 225, 226)
            ],
          ),
        ),
        body: Column(),
      ),
    );
  }
}
