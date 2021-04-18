import 'package:desafio_poke_project/HomeScene/poke_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'poke API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokeView(),
    );
  }
}
