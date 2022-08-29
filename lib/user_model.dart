import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.data,
    required this.msg,
  });

  Data data;
  String msg;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: Data.fromJson(json["id"]),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "msg": msg,
      };
}

class Data {
  Data({
    required this.tanggal,
    required this.waktu,
    required this.status,
  });

  DateTime tanggal;
  String waktu;
  String status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tanggal: json["tanggal"],
        waktu: json["waktu"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "tanggal": tanggal,
        "waktu": waktu,
        "status": status,
      };
}