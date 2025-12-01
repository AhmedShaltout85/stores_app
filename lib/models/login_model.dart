class Login {
  String? userName;
  String? password;
  String? token;

  Login({required this.userName, required this.password, required this.token});

  Login copyWith({String? userName, String? password, String? token}) => Login(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      token: token ?? this.token);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["userName"] = userName;
    map["password"] = password;
    if (token != null) {
      map["token"] = token;
    }
    return map;
  }

  Login.fromJson(dynamic json) {
    userName = json["userName"];
    password = json["password"];
    token = json["token"];
  }
}
