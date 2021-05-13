import 'package:flutter/material.dart';

class CardPokemon extends StatelessWidget {
  final String name;
  final int id;
  final String type;

  CardPokemon({
    Key key,
    this.name,
    this.id,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Column(
            children:[
              Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white.withOpacity(0.3),
                  border: Border.fromBorderSide(BorderSide(color: Colors.white.withOpacity(0.6)))
                ),
                child: Text(
                  type,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ]
          )
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Image.network(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
