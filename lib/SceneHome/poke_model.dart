import 'package:desafio_poke_project/Api/api.dart';
import 'package:desafio_poke_project/core/pokedex/pokemon.dart';

class PokeModel{
  Future<Pokemon> _pokemon;

  Future<Pokemon> get pokemon => _pokemon;

  fetchPokemon(int number){
    _pokemon = API().fetchPokemon(number);
  }
}