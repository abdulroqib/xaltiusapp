class User {
  int id;
  String name;
  String role;

  User(int id, String name, String role) {
    this.id = id;
    this.name = name;
    this.role = role;
  }

  User.fromJson(Map json)
    : id = json['id'],
      name = json['name'],
      role = json['role'];

  Map toJson(){
    return {'id': id, 'name': name, 'role': role};
  } 
}