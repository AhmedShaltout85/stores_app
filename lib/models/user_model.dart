
import 'user_data.dart';


class User {
  List<UserData>? userDataList;

  User({this.userDataList});

  User copyWith({List<UserData>? userDataList}) =>
      User(userDataList: userDataList ?? this.userDataList);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (userDataList != null) {
      map["Userdata"] = userDataList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  User.fromJson(dynamic json) {
    if (json != null) {
      userDataList = [];
      json.forEach((v) {
        userDataList?.add(UserData.fromJson(v));
      });
    }
  }
}
