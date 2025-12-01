class Name {
  String? firstname;
  String? lastname;

  Name({this.firstname, this.lastname});

  Name copyWith({String? firstname, String? lastname}) => Name(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["firstname"] = firstname;
    map["lastname"] = lastname;
    return map;
  }

  Name.fromJson(dynamic json) {
    firstname = json["firstname"];
    lastname = json["lastname"];
  }
}
