part of 'model.dart';

class UpdatedBy {
  int id;
  String nama;

  UpdatedBy({
    required this.id,
    required this.nama,
  });

  factory UpdatedBy.fromJson(Map<String, dynamic> json) => UpdatedBy(
        id: json["id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
      };
}
