import 'package:hive/hive.dart';
import 'package:go_cart_rider/core/utils/type_id.dart';

part 'user.g.dart';

@HiveType(typeId: TypeId.user, adapterName: 'UserAdapter')
class User {
  @HiveField(0)
  String? userId;
  @HiveField(1)
  String? username;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? jwt;

  User({this.userId, this.username, this.email, this.jwt});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    jwt = json['jwt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['jwt'] = this.jwt;
    return data;
  }
}