import 'package:desafio_poke_project/SceneDetail/poke_detail_scene.dart';
import 'package:desafio_poke_project/SceneHome/poke_view.dart';
import 'package:desafio_poke_project/Scenepokedex/pokedex_controller.dart';
import 'package:desafio_poke_project/Scenepokedex/pokedex_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final pokedex = Pokedex();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'poke API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Pokedex'),
        actions: [
          IconButton(
            icon: Icon(Icons.book),
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => PokedexView(
                    pokedex: pokedex,
                  )
                )
              );
            }
          )
        ],
      ), 
      body:  PokeView(),
      
      )
    );
  }
}
