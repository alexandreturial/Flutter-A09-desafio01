
import 'package:desafio_poke_project/HomeScene/poke_controller.dart';
import 'package:desafio_poke_project/HomeScene/pokemon.dart';
import 'package:desafio_poke_project/core/pokedex/pokedex_controller.dart';
import 'package:desafio_poke_project/pokedexScene/pokedex_view.dart';
import 'package:flutter/material.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final controller = PokeController();
  String name;
  int id;
  String type;
  final pokedex = Pokedex();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
        actions: [
          IconButton(
            icon: Icon(Icons.pages),
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
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<Pokemon>(
                future: controller.pokemon,
                builder: (context, snapShot) {
                  if (snapShot.connectionState != ConnectionState.done) {
                    return CircularProgressIndicator();
                  }

                  if (snapShot.hasData) {
                    name = snapShot.data.name;
                    id = snapShot.data.id;
                    type = snapShot.data.type;
                    return Column(
                      children: [
                        Image.network(
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/${snapShot.data.id}.gif',
                          height: 100,
                          width: 100,
                          fit: BoxFit.fitHeight,
                        ),
                        Text(
                          snapShot.data.name,
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    );
                  } else if (snapShot.hasError) {
                    return Text(snapShot.error);
                  } else {
                    return Container();
                  }
                }),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    controller.loadpokemon();
                  });
                },
                child: Text('Load pokemon')
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)
        ),
        onPressed: (){
          pokedex.addPokemon(name, id, type);
        },
        child: Text('add to pokedex', style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
