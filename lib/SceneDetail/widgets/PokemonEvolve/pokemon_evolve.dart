import 'package:desafio_poke_project/Core/pokemon.dart';
import 'package:flutter/material.dart';

class PokemonEvolve extends StatelessWidget {
  final String id;
  final List<Stats> stats;
  final Color barColor;

  PokemonEvolve({
    Key key,
    this.id,
    this.stats, this.barColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320,
        height: 150,
        alignment: Alignment.topCenter,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: stats.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: CircularProgressIndicator(
                        strokeWidth: 10,
                        value: stats[index].value * 0.01,
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(barColor),
                      ),
                    ),
                  Center(
                  child: Text(
                    stats[index].name
                    )
                  )
                ],
              );
            }));
  }
}
