import 'package:desafio_poke_project/Scenepokedex/Utils/get_color.dart';
import 'package:desafio_poke_project/Scenepokedex/widget/card_pokemon.dart';
import 'package:desafio_poke_project/Scenepokedex/pokedex_controller.dart';
import 'package:flutter/material.dart';

class PokedexView extends StatelessWidget {
  final Pokedex pokedex;

  const PokedexView({Key key, this.pokedex})
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pokedexlist = pokedex.listPokemon();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5
          ),
          itemCount: pokedexlist.length,
          itemBuilder: (context, index) {
            if(pokedexlist.length > 0){
              return Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: CardPokemon(
                    id: pokedexlist[index].id,
                    name: pokedexlist[index].name,
                    type: pokedexlist[index].type
                  ),
                ),
                decoration: BoxDecoration(
                  color: ColorPokemon.getColorType(type: pokedexlist[index].type),
                  borderRadius: BorderRadius.circular(15)
                ),
              );
            }else{
              return Center(
                child: Text('Nenhum pokemon encontrado'),
              );
            }
            
            
          },
        ),
      ),
    );
  }
}