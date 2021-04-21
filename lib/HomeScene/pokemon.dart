class Pokemon{
  int id;
  String name;
  String urlImage;
  String type;

  Pokemon.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    urlImage = json['sprites']['front_default'];
    type = json['types'][0]['type']['name'];

  }
}