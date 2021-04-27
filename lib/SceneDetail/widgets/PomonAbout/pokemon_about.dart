import 'package:flutter/material.dart';


class PokemonAbout extends StatelessWidget {
  final List aboutList;
  final Color colorBar;
  
  PokemonAbout({
    Key key,
    this.aboutList, 
    this.colorBar
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 55,
        alignment: Alignment.center,
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 35),
                color: colorBar,
                width: 2,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Flame",
                      style: TextStyle(
                        fontSize: 20,
                        color: colorBar
                      ),
                    ),
                    Text(
                      "species",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              );
            }));
  }
}
