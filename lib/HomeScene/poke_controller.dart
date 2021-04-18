import 'dart:math';

import 'package:desafio_poke_project/HomeScene/poke_model.dart';
import 'package:desafio_poke_project/HomeScene/pokemon.dart';

class PokeController {
  final model = PokeModel();
  int number = 1;

  Future<Pokemon> get pokemon => model.pokemon;
  
  loadpokemon(){
    model.fetchPokemon(Random().nextInt(150));
  }
}