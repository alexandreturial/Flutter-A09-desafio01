import 'package:desafio_poke_project/Api/api.dart';
import 'package:desafio_poke_project/Core/pokemon.dart';

class PokeModel{
  Future<Pokemon> _pokemon;
  final Api api;

  PokeModel({this.api = const Api()});

  Future<Pokemon> get pokemon => _pokemon;

  fetchPokemon(int number){
    _pokemon = api.fetchPokemon(number);
  }
}