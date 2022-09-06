class DataHistory {
  DataHistory({
    required this.tanggal,
    required this.waktu,
    required this.status,
  });

  String tanggal = "sample";
  String waktu = "sample";
  String status = "sample";

  factory DataHistory.fromJson(Map<String, dynamic> json) => DataHistory(
        tanggal: json["tanggal"],
        waktu: json["waktu"],
        status: json["status"],
      );
  Map<String, dynamic> toJson() =>
      {"tanggal": tanggal, "waktu": waktu, "status": status};
}