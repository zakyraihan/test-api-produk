// To parse this JSON data, do
//
//     final produk = produkFromJson(jsonString);

part of 'model.dart';

Produk produkFromJson(String str) => Produk.fromJson(json.decode(str));

String produkToJson(Produk data) => json.encode(data.toJson());

class Produk {
  String status;
  String message;
  List<ProdukList> data;
  Pagination pagination;

  Produk({
    required this.status,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
        status: json["status"],
        message: json["message"],
        data: List<ProdukList>.from(
            json["data"].map((x) => ProdukList.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class ProdukList {
  int id;
  String namaProduk;
  String deskripsiProduk;
  double harga;
  int stok;
  CreatedBy createdBy;
  UpdatedBy? updatedBy;
  KategoriModel kategori; // Modifikasi di sini

  ProdukList({
    required this.id,
    required this.namaProduk,
    required this.deskripsiProduk,
    required this.harga,
    required this.stok,
    required this.createdBy,
    required this.updatedBy,
    required this.kategori, // Modifikasi di sini
  });

  factory ProdukList.fromJson(Map<String, dynamic> json) => ProdukList(
        id: json["id"],
        namaProduk: json["nama_produk"],
        deskripsiProduk: json["deskripsi_produk"],
        harga: json["harga"]?.toDouble(),
        stok: json["stok"],
        createdBy: CreatedBy.fromJson(json["created_by"]),
        updatedBy: json["updated_by"] == null
            ? null
            : UpdatedBy.fromJson(json["updated_by"]),
        kategori: KategoriModel.fromJson(json["kategori"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_produk": namaProduk,
        "deskripsi_produk": deskripsiProduk,
        "harga": harga,
        "stok": stok,
        "created_by": createdBy.toJson(),
        "updated_by": updatedBy?.toJson(),
        "kategori": kategori.toJson(),
      };
}

class KategoriModel {
  int id;
  String namaKategori;

  KategoriModel({
    required this.id,
    required this.namaKategori,
  });

  factory KategoriModel.fromJson(Map<String, dynamic> json) => KategoriModel(
        id: json["id"],
        namaKategori: json["nama_kategori"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_kategori": namaKategori,
      };
}
