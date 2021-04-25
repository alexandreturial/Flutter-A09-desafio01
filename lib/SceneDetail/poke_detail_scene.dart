import 'package:desafio_poke_project/Core/poke_controller.dart';
import 'package:desafio_poke_project/SceneDetail/widgets/CardPokemon/card_pokemon.dart';
import 'package:desafio_poke_project/SceneDetail/widgets/NavegationButton/navegation_button.dart';
import 'package:desafio_poke_project/SceneDetail/widgets/PokemonEvolve/pokemon_evolve.dart';
import 'package:desafio_poke_project/SceneDetail/widgets/PokemonTitle/pokemon_title.dart';
import 'package:desafio_poke_project/SceneDetail/widgets/PomonAbout/pokemon_about.dart';
import 'package:flutter/material.dart';

class PokeDetailView extends StatefulWidget {
  @override
  _PokeDetailViewState createState() => _PokeDetailViewState();
}

class _PokeDetailViewState extends State<PokeDetailView> {
  final controller = PokeController();
  bool isAbout = true;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              NavegationButton(
                isSelect: isAbout,
                title: "About",
                onTap: () {
                  setState(() {
                    if (!isAbout) {
                      isAbout = !isAbout;
                    }
                  });
                },
              ),
              NavegationButton(
                isSelect: !isAbout,
                title: "Base Stats",
                onTap: () {
                  setState(() {
                    if (isAbout) {
                      isAbout = !isAbout;
                    }
                  });
                },
              ),
            ],
          ),
        ),
        Container(
            height: screenSize.height * 0.78,
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
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(80),
                    )),
              ),
              CardPokemon(
                title: PokemonTitle(),
                about: PokemonAbout(),
                evolve: PokemonEvolve(),
              )
            ])),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 300,
            width: 300,
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.network(
                'https://assets.pokemon.com/assets/cms2/img/pokedex/full/012.png',
               fit: BoxFit.cover,
                height: 250,
                width: 250,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// FutureBuilder<Pokemon>(
//         future: controller.pokemon,
//         builder: (context, snapShot) {
//           if (snapShot.connectionState != ConnectionState.done) {
//               return Image.network(
//                 'https://pokemongoinfo.netlify.app/pokeball.gif',
//                 height: 80,
//                 width: 80,
//               );
//           }else if (snapShot.hasError) {
//             return Text(snapShot.error);
//           } else {
//             return Container();
//           }
//         }
//       )
