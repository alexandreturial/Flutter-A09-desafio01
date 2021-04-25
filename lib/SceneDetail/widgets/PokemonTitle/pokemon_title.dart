import 'package:flutter/material.dart';

class PokemonTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 30,
          width: 120,
          
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index){
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical:5, horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red,

                ),
                child: Text("lorem ypson")
              );
            }
          )
          // Row(
          //   children: [
          //     Text("data"),
          //     Text("data"),
          //   ],
          // ),
        ),
        Container(
          child: Row(
            children: [
              Text(
                "006",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(width: 5,),
              Text(
                "Charizard",
                style: TextStyle(
                  fontSize: 25,
                  
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
