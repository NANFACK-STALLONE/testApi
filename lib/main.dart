import 'package:flutter/material.dart';
import 'package:flutter_api1/Exemple_3.dart';
import 'package:flutter_api1/example_2.dart';
import 'package:flutter_api1/home-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Colors.blue,
        ),
      ),
      home: Exemple3(),
    );
  }
}
