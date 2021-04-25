
import 'package:desafio_poke_project/Core/poke_model.dart';
import 'package:desafio_poke_project/Core/pokemon.dart';

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