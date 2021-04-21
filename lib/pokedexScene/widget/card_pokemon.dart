import 'package:flutter/material.dart';

class CardPokemon extends StatelessWidget {
  final String name;
  final int id;

  CardPokemon({
    Key key,
    this.name,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Image.network(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${id}.png',
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
