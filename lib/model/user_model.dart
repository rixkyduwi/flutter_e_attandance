import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/*class Sample {
  String name;
  int age;
  List<String> hobi;
  List<Article> articles;
  Sample(
      {required this.name,
      required this.age,
      required this.hobi,
      required this.articles});
  @override
  String toString() {
    return 'Sample{name: $name, age: $age, hobi: $hobi,  articles: $articles}';
  }

  factory Sample.fromJson(Map<String, dynamic> json) {
    // baca property articles sebagai List (JSON Array)
    var listArticles = json["articles"] as List;
    // mapping listArticles kedalam bentuk MappedIterable<dynamic, Article>
    var iterableArticles = listArticles.map((article) {
      return Article.fromJson(article);
    });
    // lalu, kita konversi dari MappedIterable kedalam bentuk List<Article>
    var articles = List<Article>.from(iterableArticles);
    return Sample(
      name: json["name"],
      age: json["age"],
      hobi: List<String>.from(json["hobi"]),
      articles: articles,
    );
  }
}*/
class UserModel {
  UserModel({
    required this.tanggal,
    required this.waktu,
    required this.status,
  });

  String tanggal ;
  String waktu ;
  String status;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        tanggal: json["tanggal"],
        waktu: json["waktu"],
        status: json["status"],
      );
  Map<String, dynamic> toJson() =>
      {"tanggal": tanggal, "waktu": waktu, "status": status};
}
/*
class UserModel {
  String msg;
  List<Article> data;
  UserModel({required this.msg, required this.data,});
  factory UserModel.fromJson(Map<String, dynamic> json)  => UserModel(
    /*// baca property articles sebagai List (JSON Array)
    var listArticles = json["data"] as List;
    // mapping listArticles kedalam bentuk MappedIterable<dynamic, Article>
    var iterableArticles = listArticles.map((article) {
      return listArticleFromJson(article);
    });
    // lalu, kita konversi dari MappedIterable kedalam bentuk List<Article>
    var articles = List<Article>.from(iterableArticles);

    return UserModel(*/

      msg: json["msg"],
      data: listArticleFromJson(json["data"]),
    );
  
  Map<String, dynamic> toJson() =>
      {"msg": msg, 
      };
}
*/
List<Article> listArticleFromJson(String str) =>
    List<Article>.from(json.decode(str).map((x) => Article.fromJson(x)));

String listArticleToJson(List<Article> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Article {
  String tanggal;
  String waktu;
  String status;
  Article({required this.tanggal, required this.waktu, required this.status});
  @override
  String toString() {
    return 'Article{tanggal: $tanggal, waktu: $waktu, status: $status}';
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        tanggal: json["tanggal"], waktu: json["waktu"], status: json["status"]);
  }
  Map<String, String> toJson() =>
      {"tanggal": tanggal, "waktu": waktu, "status": status};
}

class Data {
  Data({
    required this.tanggal,
    required this.waktu,
    required this.status,
  });

  String tanggal = "sample";
  String waktu = "sample";
  String status = "sample";

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tanggal: json["tanggal"],
        waktu: json["waktu"],
        status: json["status"],
      );
  Map<String, dynamic> toJson() =>
      {"tanggal": tanggal, "waktu": waktu, "status": status};
}
class Album {
  final String msg;
  final DataLogin data;

  const Album({required this.msg, required this.data});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      data: DataLogin.fromJson(json['data']),
      msg: json['msg'],
    );
  }
}
class DataLogin{
  
  final String nip;
  final String nama;
  final String posisi;
  final String gender;
  final String ttl;
  final String email;
  final String no_hp;

  const DataLogin({
    required this.nip, 
    required this.nama,
    required this.posisi,
    required this.gender,
    required this.ttl,
    required this.email,
    required this.no_hp,
    });

  factory DataLogin.fromJson(Map<String, dynamic> json) {
    return DataLogin(
      nip: json['nip'],
      nama: json['nama'],
      posisi: json['posisi'],
      gender: json['gender'],
      ttl: json['ttl'],
      email: json['email'],
      no_hp: json['no_hp'],
    );
  }
}