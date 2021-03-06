import 'package:desafio_poke_project/HomeScene/poke_model.dart';
import 'package:desafio_poke_project/HomeScene/pokemon.dart';

class PokeController {
  final model = PokeModel();
  int number = 0;

  Future<Pokemon> get pokemon => model.pokemon;
  
  nextPokemon(){
    model.fetchPokemon(number += 1);
  }

  prevPokemon(){
    
    if(number - 1 > 0 ){
      model.fetchPokemon(number -= 1);
    }
    
  }
}