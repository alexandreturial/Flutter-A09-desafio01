import 'package:flutter/material.dart';

class PokemonEvolve extends StatelessWidget {
  final String id;

  PokemonEvolve({
    Key key, 
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320,
        height: 120,
        alignment: Alignment.topCenter,
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: 15,
                child: Icon(Icons.arrow_right_alt),
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://assets.pokemon.com/assets/cms2/img/pokedex/full/$id.png',
                      height: 90,
                    ),
                    Text('Charmander')
                  ],)
              );
            }));
  }
}
