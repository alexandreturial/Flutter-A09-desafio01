

import 'package:desafio_poke_project/Scenepokedex/pokedex_model.dart';
import 'package:desafio_poke_project/Scenepokedex/pokemon.dart';

class Pokedex{
  PokedexModel pokedexModel = new PokedexModel();


  List<Pokemon> listPokemon(){
    return pokedexModel.pokedex;
  }

  void addPokemon(String name, int id, String type){

    pokedexModel.addPokemon(createPokemon(name, id, type));
  }

  Pokemon createPokemon(String name, int id, String type){
     Pokemon newPokemon = new Pokemon();
      newPokemon.setName(name);
      newPokemon.setId(id);
      newPokemon.setType(type);

      return newPokemon;
  }

}