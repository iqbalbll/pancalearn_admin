import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/dasboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panca Learn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'KdamThmorPro',
      ),
      home: const LoginScreen(),
    );
  }
}