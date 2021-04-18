import 'package:desafio_poke_project/HomeScene/poke_controller.dart';
import 'package:desafio_poke_project/HomeScene/pokemon.dart';
import 'package:flutter/material.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final controller = PokeController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<Pokemon>(
            future: controller.pokemon,
            builder: (context, snapShot){
              if(snapShot.connectionState != ConnectionState.done ){
                return CircularProgressIndicator();
              }

              if(snapShot.hasData){
                return Column(
                  children: [
                    Image.network(
                      snapShot.data.urlImage,
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                    Text(snapShot.data.name, 
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                );
              }else if (snapShot.hasError){
                return Text(snapShot.error);
              }else{
                return Container();
              }
              
            }
          ),
          ElevatedButton(
            onPressed: (){
              setState(() {
                controller.loadpokemon();
              });
            }, 
            child: Text('Load pokemon'))
        ],
      ),
    );
  }
}