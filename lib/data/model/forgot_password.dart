// To parse this JSON data, do
//
//     final forgotPassword = forgotPasswordFromJson(jsonString);

part of 'model.dart';

ForgotPassword forgotPasswordFromJson(String str) =>
    ForgotPassword.fromJson(json.decode(str));

String forgotPasswordToJson(ForgotPassword data) => json.encode(data.toJson());

class ForgotPassword {
  String status;
  String message;
  DataForgot data;

  ForgotPassword({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ForgotPassword.fromJson(Map<String, dynamic> json) => ForgotPassword(
        status: json["status"],
        message: json["message"],
        data: DataForgot.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class DataForgot {
  DataForgot();

  factory DataForgot.fromJson(Map<String, dynamic> json) => DataForgot();

  Map<String, dynamic> toJson() => {};
}
