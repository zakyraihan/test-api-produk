// To parse this JSON data, do
//
//     final resetPassword = resetPasswordFromJson(jsonString);

part of 'model.dart';

ResetPassword resetPasswordFromJson(String str) =>
    ResetPassword.fromJson(json.decode(str));

String resetPasswordToJson(ResetPassword data) => json.encode(data.toJson());

class ResetPassword {
  String status;
  String message;
  DataReset data;

  ResetPassword({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ResetPassword.fromJson(Map<String, dynamic> json) => ResetPassword(
        status: json["status"],
        message: json["message"],
        data: DataReset.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class DataReset {
  DataReset();

  factory DataReset.fromJson(Map<String, dynamic> json) => DataReset();

  Map<String, dynamic> toJson() => {};
}
