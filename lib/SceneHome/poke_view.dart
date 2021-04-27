
import 'package:desafio_poke_project/SceneDetail/poke_detail_scene.dart';
import 'package:desafio_poke_project/Scenepokedex/pokedex_controller.dart';
import 'package:desafio_poke_project/Core/poke_controller.dart';
import 'package:desafio_poke_project/Core/pokemon.dart';
import 'package:desafio_poke_project/Scenepokedex/pokedex_view.dart';
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
    return Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<Pokemon>(
                future: controller.pokemon,
                builder: (context, snapShot) {
                  if (snapShot.connectionState != ConnectionState.done) {
                    return Image.network(
                      'https://pokemongoinfo.netlify.app/pokeball.gif',
                      height: 80,
                      width: 80, 
                    );
                  }
                  if (snapShot.hasData) {
                    print(snapShot.data.type);
                    name = snapShot.data.name;
                    id = snapShot.data.id;
                    type = 'normal';
                    return TextButton(
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => PokeDetailView(
                              id: id,
                              type: snapShot.data.type[0].name,
                            )
                          )
                        );
                      },
                      child: Column(
                        children: [
                          Image.network(
                            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/${snapShot.data.id}.gif',
                            height: 100,
                            width: 100,
                            fit: BoxFit.contain,
                            
                          ),
                          Text(
                            snapShot.data.name,
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapShot.hasError) {
                    return Text(snapShot.error);
                  } else {
                    return Container();
                  }
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        controller.prevPokemon();
                      });
                    },
                    child: Icon(Icons.arrow_left)
                ),
                SizedBox(width: 20,),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        controller.nextPokemon();
                      });
                    },
                    child: Icon(Icons.arrow_right)
                ),
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)
              ),
              onPressed: (){
                pokedex.addPokemon(name, id, type);
              },
              child: Text('add to pokedex', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      
    );
  }
}
