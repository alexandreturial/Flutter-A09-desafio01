import 'package:desafio_poke_project/Core/pokemon.dart';
import 'package:flutter/material.dart';

class PokemonAbout extends StatelessWidget {
  final List aboutList;
  final Color colorBar;
  final int height;
  final int weight;
  final int base_expirence;

  PokemonAbout({
    Key key,
    this.aboutList,
    this.colorBar,
    this.height,
    this.weight,
    this.base_expirence,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List about = [
      {"name": "Height", "value": height},
      {"name": "Height", "value": weight},
      {"name": "Height", "value": base_expirence},
    ];

    return Container(
        width: 350,
        height: 55,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  '$base_expirence',
                  style: TextStyle(fontSize: 20, color: colorBar),
                ),
                Text(
                  'base expirence',
                  style: TextStyle(
                    fontSize: 15, color: Colors.black),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 5
              ),
              color: colorBar,
              width: 2,
            ),
            Column(
              children: [
                Text(
                  '$height',
                  style: TextStyle(fontSize: 20, color: colorBar),
                ),
                Text(
                  'height',
                  style: TextStyle(
                    fontSize: 15, color: Colors.black),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 5
              ),
              color: colorBar,
              width: 2,
            ),
            Column(
              children: [
                Text(
                  '$weight',
                  style: TextStyle(fontSize: 20, color: colorBar),
                ),
                Text(
                  'weight',
                  style: TextStyle(
                    fontSize: 15, color: Colors.black),
                ),
              ],
            ),
          ],
        ));
  }
}
