class User {
  int? id;
  String? username;
  String? firstname;
  String? lastname;
  String? email;

  User() {}

  User.withoutId(this.username, this.firstname, this.lastname, this.email);

  User.all({this.id, this.username, this.firstname, this.lastname, this.email});

  Map<String, dynamic> toMap() {
    return {'id': id, 'firstname': firstname, 'lastname': lastname};
  }

  @override
  String toString() {
    return super.toString();
  }
}
