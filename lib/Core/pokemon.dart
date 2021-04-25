class Pokemon{
  int id;
  String name;
  String urlImage;
  List<Ability> type;

  Pokemon.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    urlImage = json['sprites']['front_default'];

    var typeArray = json['abilities'] as List;

    type = typeArray.map((item){
      return Ability.fromJson(item['ability']);
    }).toList();
  }
}

class Ability{
  String name;

  Ability.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }
}