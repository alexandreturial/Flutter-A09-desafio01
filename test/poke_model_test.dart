import 'package:desafio_poke_project/Api/api.dart';
import 'package:desafio_poke_project/Core/poke_model.dart';
import 'package:desafio_poke_project/Core/pokemon.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {

  test('Teste Pokemon should fill pokemon variable', (){
    final model = PokeModel(api: MockAPi());

    model.fetchPokemon(1);

    expect(model.pokemon, completion(isNotNull));

    model.pokemon.then((pokemon){
      expect(pokemon.name, 'xande');
    });
  });
}

class MockAPi extends Api{
  Future<Pokemon> fetchPokemon(int number){
    final pokemon = Pokemon(0,'xande','', [],[],[],0,0,0);
    return Future.value(pokemon);
  }
}
