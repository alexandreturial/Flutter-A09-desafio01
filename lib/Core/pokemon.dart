class Pokemon{
  int id;
  String name;
  String urlImage;
  List<Ability> abilities;
  List<Type> type;

  Pokemon.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    urlImage = json['sprites']['front_default'];

    var abilitiesArray = json['abilities'] as List;

    abilities = abilitiesArray.map((item){
      return Ability.fromJson(item['ability']);
    }).toList();

    var typeArray = json['types'] as List;

    type = typeArray.map((item){
      return Type.fromJson(item['type']);
    }).toList();
  }
}

class Ability{
  String name;

  Ability.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }
}

class Type{
  String name;

  Type.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }
}