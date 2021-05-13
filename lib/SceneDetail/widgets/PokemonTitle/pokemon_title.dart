import 'package:desafio_poke_project/Core/pokemon.dart';
import 'package:desafio_poke_project/Utils/get_color.dart';
import 'package:flutter/material.dart';

class PokemonTitle extends StatelessWidget {
  final String pokeNum;
  final String pokeName;
  final List<Type> types;

  PokemonTitle({
    Key key,
    this.pokeNum,
    this.pokeName,
    this.types,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 30,
              width: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: types.length,
                  itemBuilder: (context, index) {
                    return Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorPokemon.getColorType(
                              type: types[index].name),
                        ),
                        child: Text(
                          types[index].name,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ));
                  })),
          Container(
            child: Row(
              children: [
                Text(
                  pokeNum,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  pokeName,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
