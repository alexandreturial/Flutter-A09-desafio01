class Pokemon{
  String _name;
  int _id;
  String _type;

  String get name => _name;
  int get id =>_id;
  String get type =>_type;

  void setName(String name){
    _name = name;
  }

  void setId(int id){
    _id = id;
  }

  void setType(String type){
    _type = type;
  }
}