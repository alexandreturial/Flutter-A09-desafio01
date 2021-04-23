import 'package:desafio_poke_project/Scenepokedex/pokemon.dart';

class PokedexModel{
  List<Pokemon> _pokedex = [];

  List<Pokemon> get pokedex => this._pokedex;


  void addPokemon(Pokemon newPokemon){
    if(!isIn(newPokemon)){
      this._pokedex.add(newPokemon);
    }
  }

  bool isIn(Pokemon newPokemon){
    bool isin = false;
    this._pokedex.forEach((p){
      if(newPokemon.name == p.name){
        print(p.id);
        isin = true;
      }
    });
    return isin;
  }

  

  
}