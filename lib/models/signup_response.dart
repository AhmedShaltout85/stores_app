class SignupResponse {
  num? id;
  String? username;
  String? email;
  String? password;

  SignupResponse({this.id, this.username, this.email, this.password});

  SignupResponse copyWith(
          {num? id, String? username, String? email, String? password}) =>
      SignupResponse(
          id: id ?? this.id,
          username: username ?? this.username,
          email: email ?? this.email,
          password: password ?? this.password);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["id"] = id;
    map["username"] = username;
    map["email"] = email;
    map["password"] = password;
    return map;
  }

  SignupResponse.fromJson(dynamic json) {
    id = json["id"];
    username = json["username"];
    email = json["email"];
    password = json["password"];
  }
}
