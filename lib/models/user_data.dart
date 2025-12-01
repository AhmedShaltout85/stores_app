import 'address_model.dart';
import 'name_model.dart';

class UserData {
  Address? address;
  num? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;
  num? V;

  UserData(
      {this.address,
      this.id,
      this.email,
      this.username,
      this.password,
      this.name,
      this.phone,
      this.V});

  UserData copyWith(
          {Address? address,
          num? id,
          String? email,
          String? username,
          String? password,
          Name? name,
          String? phone,
          num? V}) =>
      UserData(
          address: address ?? this.address,
          id: id ?? this.id,
          email: email ?? this.email,
          username: username ?? this.username,
          password: password ?? this.password,
          name: name ?? this.name,
          phone: phone ?? this.phone,
          V: V ?? this.V);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (address != null) {
      map["address"] = address?.toJson();
    }
    map["id"] = id;
    map["email"] = email;
    map["username"] = username;
    map["password"] = password;
    if (name != null) {
      map["name"] = name?.toJson();
    }
    map["phone"] = phone;
    map["__v"] = V;
    return map;
  }

  UserData.fromJson(dynamic json) {
    address =
        json["address"] != null ? Address.fromJson(json["address"]) : null;
    id = json["id"];
    email = json["email"];
    username = json["username"];
    password = json["password"];
    name = json["name"] != null ? Name.fromJson(json["name"]) : null;
    phone = json["phone"];
    V = json["__v"];
  }
}
