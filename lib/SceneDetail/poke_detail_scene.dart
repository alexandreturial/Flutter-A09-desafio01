import 'package:desafio_poke_project/Core/poke_controller.dart';
import 'package:desafio_poke_project/Core/pokemon.dart';
import 'package:desafio_poke_project/SceneDetail/widgets/CardPokemon/card_pokemon.dart';
import 'package:desafio_poke_project/SceneDetail/widgets/NavegationButton/navegation_button.dart';
import 'package:desafio_poke_project/SceneDetail/widgets/PokemonEvolve/pokemon_evolve.dart';
import 'package:desafio_poke_project/SceneDetail/widgets/PokemonTitle/pokemon_title.dart';
import 'package:desafio_poke_project/SceneDetail/widgets/PomonAbout/pokemon_about.dart';
import 'package:desafio_poke_project/Scenepokedex/pokedex_controller.dart';
import 'package:desafio_poke_project/Scenepokedex/pokedex_view.dart';
import 'package:desafio_poke_project/Utils/get_color.dart';
import 'package:flutter/material.dart';

class PokeInfo {
  String title;
  String type;
}

class PokeDetailView extends StatefulWidget {
  final int id;
  final String type;
  PokeDetailView({Key key, this.id, this.type}) : super(key: key);

  @override
  _PokeDetailViewState createState() => _PokeDetailViewState();
}

class _PokeDetailViewState extends State<PokeDetailView> {
  final controller = PokeController();
  bool isAbout = true;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final pokedex = Pokedex();
    controller.setPokemon(widget.id);
    return Scaffold(
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
          ),
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                NavegationButton(
                  isSelect: isAbout,
                  title: "About",
                  colorButton: ColorPokemon.getColorType(type: widget.type),
                  onTap: () {
                    setState(() {
                      if (!isAbout) {
                        isAbout = !isAbout;
                      }
                    });
                  },
                ),
                // NavegationButton(
                //   isSelect: !isAbout,
                //   title: "Base Stats",
                //   colorButton: ColorPokemon.getColorType(type: widget.type),
                //   onTap: () {
                //     setState(() {
                //       if (isAbout) {
                //         isAbout = !isAbout;
                //       }
                //     });
                //   },
                // ),
              ],
            ),
          ),
          Container(
              height: screenSize.height * 0.79,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(0.0, 1.0),
                      blurRadius: 7.4,
                      spreadRadius: 5.0,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
              child: Stack(children: [
                Container(
                  height: 290,
                  decoration: BoxDecoration(
                      color: ColorPokemon.getColorType(type: widget.type),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(80),
                      )),
                ),
                FutureBuilder<Pokemon>(
                    future: controller.pokemon,
                    builder: (context, snapShot) {
                      if (snapShot.hasData) {
                        var id = snapShot.data.id.toString().padLeft(3, '0');
                        var type = snapShot.data.type[0].name;
                        
                        return CardPokemon(
                          title: PokemonTitle(
                            pokeName: snapShot.data.name,
                            pokeNum: "$id",
                            types: snapShot.data.type,
                          ),
                          about: PokemonAbout(
                            height: snapShot.data.height,
                            weight: snapShot.data.weight,
                            base_expirence: snapShot.data.base_experience,
                            colorBar: ColorPokemon.getColorType(type: type),
                          ),
                          evolve: PokemonEvolve(
                            id: '$id',
                            stats:snapShot.data.stats,
                            barColor: ColorPokemon.getColorType(type: type),
                          ),
                        );
                      } else if (snapShot.hasError) {
                        return Text(snapShot.error);
                      } else {
                        return Container();
                      }
                    }),
              ])),
          FutureBuilder<Pokemon>(
              future: controller.pokemon,
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  var id = snapShot.data.id.toString().padLeft(3, '0');
                  return Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 320,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Image.network(
                          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/${id}.png',
                          fit: BoxFit.fitWidth,
                          height: 250,
                          width: 200,
                        ),
                      ),
                    ),
                  );
                } else if (snapShot.hasError) {
                  return Text(snapShot.error);
                } else {
                  return Container();
                }
              })
        ],
      ),
    );
  }
}
