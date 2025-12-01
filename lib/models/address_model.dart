class Geolocation {
  String? lat;
  String? long;

  Geolocation({this.lat, this.long});

  Geolocation copyWith({String? lat, String? long}) =>
      Geolocation(lat: lat ?? this.lat, long: long ?? this.long);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["lat"] = lat;
    map["long"] = long;
    return map;
  }

  Geolocation.fromJson(dynamic json) {
    lat = json["lat"];
    long = json["long"];
  }
}

class Address {
  Geolocation? geolocation;
  String? city;
  String? street;
  num? number;
  String? zipcode;

  Address(
      {this.geolocation, this.city, this.street, this.number, this.zipcode});

  Address copyWith(
          {Geolocation? geolocation,
          String? city,
          String? street,
          num? number,
          String? zipcode}) =>
      Address(
          geolocation: geolocation ?? this.geolocation,
          city: city ?? this.city,
          street: street ?? this.street,
          number: number ?? this.number,
          zipcode: zipcode ?? this.zipcode);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (geolocation != null) {
      map["geolocation"] = geolocation?.toJson();
    }
    map["city"] = city;
    map["street"] = street;
    map["number"] = number;
    map["zipcode"] = zipcode;
    return map;
  }

  Address.fromJson(dynamic json) {
    geolocation = json["geolocation"] != null
        ? Geolocation.fromJson(json["geolocation"])
        : null;
    city = json["city"];
    street = json["street"];
    number = json["number"];
    zipcode = json["zipcode"];
  }
}
