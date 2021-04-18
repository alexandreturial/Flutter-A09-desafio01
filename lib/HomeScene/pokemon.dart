class Pokemon{
  String name;
  String urlImage;

  Pokemon.fromJson(Map<String, dynamic> json){
    name = json['name'];
    urlImage = json['sprites']['front_default'];
  }
}