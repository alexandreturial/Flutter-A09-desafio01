import 'dart:convert';

import 'package:desafio_poke_project/Core/pokemon.dart';
import 'package:http/http.dart' as http;

class API{

  Future<Pokemon> fetchPokemon(int number) async {
    await Future.delayed(Duration(seconds: 1));
    final response = await http.get(Uri.https('pokeapi.co', '/api/v2/pokemon/$number'));
    if(response.statusCode == 200){
      return Pokemon.fromJson(jsonDecode(response.body));
    }else{
      return Future.error('Pokemon not found');
    }
  }
}