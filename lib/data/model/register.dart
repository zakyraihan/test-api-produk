// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

part of 'model.dart';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  String status;
  String message;
  Data data;

  Register({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String nama;
  String email;
  String password;
  dynamic avatar;
  dynamic refreshToken;
  dynamic role;
  int id;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.nama,
    required this.email,
    required this.password,
    required this.avatar,
    required this.refreshToken,
    required this.role,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nama: json["nama"],
        email: json["email"],
        password: json["password"],
        avatar: json["avatar"],
        refreshToken: json["refresh_token"],
        role: json["role"],
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "email": email,
        "password": password,
        "avatar": avatar,
        "refresh_token": refreshToken,
        "role": role,
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
