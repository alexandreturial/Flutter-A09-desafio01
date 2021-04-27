import 'package:desafio_poke_project/SceneDetail/widgets/PokemonEvolve/pokemon_evolve.dart';
import 'package:desafio_poke_project/SceneDetail/widgets/PokemonTitle/pokemon_title.dart';
import 'package:desafio_poke_project/SceneDetail/widgets/PomonAbout/pokemon_about.dart';
import 'package:flutter/material.dart';

class CardPokemon extends StatelessWidget {
  final PokemonTitle title;
  final PokemonAbout about;
  final PokemonEvolve evolve;

  const CardPokemon({
    Key key,
    this.title, 
    this.about, 
    this.evolve
  }): super(
    key: key
  );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 1),
      child: Container(
        padding: EdgeInsets.all(15),
        height: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        child: Scaffold(
          appBar: title,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,            children: [
              about,
              evolve,
          ],)
        ),  
      ),
    );
  }
}
