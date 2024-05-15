// To parse this JSON data, do
//
//     final kategori = kategoriFromJson(jsonString);

part of 'model.dart';

Kategori kategoriFromJson(String str) => Kategori.fromJson(json.decode(str));

String kategoriToJson(Kategori data) => json.encode(data.toJson());

class Kategori {
  String status;
  String message;
  List<KategoriList> data;

  Kategori({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        status: json["status"],
        message: json["message"],
        data: List<KategoriList>.from(
            json["data"].map((x) => KategoriList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class KategoriList {
  int id;
  String namaKategori;
  CreatedBy createdBy;
  dynamic updatedBy;

  KategoriList({
    required this.id,
    required this.namaKategori,
    required this.createdBy,
    required this.updatedBy,
  });

  factory KategoriList.fromJson(Map<String, dynamic> json) => KategoriList(
        id: json["id"],
        namaKategori: json["nama_kategori"],
        createdBy: CreatedBy.fromJson(json["created_by"]),
        updatedBy: json["updated_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_kategori": namaKategori,
        "created_by": createdBy.toJson(),
        "updated_by": updatedBy,
      };
}
