import 'package:flutter/material.dart';

class PokemonAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 70,
        alignment: Alignment.topCenter,
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                color: Colors.blue,
                
                width: 2,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Text(
                      "data$index",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "data$index",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              );
            }));
  }
}
