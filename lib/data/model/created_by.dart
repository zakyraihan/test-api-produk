part of 'model.dart';

class CreatedBy {
  int id;
  String nama;

  CreatedBy({
    required this.id,
    required this.nama,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
      };
}
