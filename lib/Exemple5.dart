import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Exemple5 extends StatefulWidget {
  const Exemple5({super.key});

  @override
  State<Exemple5> createState() => _Exemple5State();
}

class _Exemple5State extends State<Exemple5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('api exemple 5'),
      ),
      body: Column(
          children: [
            
          ],
      ),
    );
  }
}
