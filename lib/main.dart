import 'package:flutter/material.dart';
import 'package:vultr/pages/homePage.dart';
import 'package:vultr/pages/loginPage.dart';
void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loginpage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

