class login {
  final DataLogin data;
  final String msg;
  final String token;

  const login({
    required this.msg,
    required this.data,
    required this.token,
  });

  factory login.fromJson(Map<String, dynamic> json) {
    print(json['msg']);
    return login(
        msg: json['msg'],
        data: DataLogin.fromJson(json["data"]),
        token: json['token']);
  }
}

class DataLogin {
  final String nip;
  final String nama;
  final String posisi;
  final String gender;
  final String ttl;
  final String email;
  final String no_hp;
  final String alamat;

  const DataLogin({
    required this.nip,
    required this.nama,
    required this.posisi,
    required this.gender,
    required this.ttl,
    required this.email,
    required this.no_hp,
    required this.alamat,
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
      alamat: json['alamat'],
    );
  }
}
