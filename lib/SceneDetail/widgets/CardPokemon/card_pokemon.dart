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
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title,
            about,
            evolve,
          ],
        )
      ),  
    );
  }
}
