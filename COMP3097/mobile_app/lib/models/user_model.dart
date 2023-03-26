class User {
  int? id;
  String? username;
  String? firstname;
  String? lastname;
  String? password;
  String? email;

  User() {}

  User.required(
      {required id,
      required email,
      required lastname,
      required firstname,
      required password,
      required username}) {}

  User.usernameAndPassword(this.username, this.password);

  User.withoutId(
      this.username, this.password, this.firstname, this.lastname, this.email);

  User.all(
      {this.id,
      this.username,
      this.password,
      this.firstname,
      this.lastname,
      this.email});

  factory User.fromMap(Map<String, dynamic> json) => User.required(
      id: json["id"],
      username: json["username"],
      password: json["password"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      email: json["email"]);

  Map<String, dynamic> toMap() {
    return {'id': id, 'firstname': firstname, 'lastname': lastname};
  }

  @override
  String toString() {
    return username.toString();
  }
}
