class Pokemon{
  String name;

  Pokemon.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }
}