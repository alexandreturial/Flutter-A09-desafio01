class Pokemon{
  int id;
  String name;
  String urlImage;
  List<Ability> abilities;
  List<Type> type;
  List<Stats> stats;
  int baseExperience;
  int height;
  int weight;

  Pokemon.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    urlImage = json['sprites']['front_default'];

    baseExperience = json['base_experience'];
    height = json['height'];
    weight = json['weight'];
    
    var abilitiesArray = json['abilities'] as List;

    abilities = abilitiesArray.map((item){
      return Ability.fromJson(item['ability']);
    }).toList();

    var typeArray = json['types'] as List;

    type = typeArray.map((item){
      return Type.fromJson(item['type']);
    }).toList();

    var statsArray = json['stats'] as List;

    stats = statsArray.map((item){
      return Stats.fromJson(item['stat'], item['base_stat']);
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

class Stats{
  int value;
  String name;

  Stats.fromJson(Map<String, dynamic> json, dynamic valuePoke){
    
    value = int.parse(valuePoke.toString());
    
    name = json['name'];
  }
}
