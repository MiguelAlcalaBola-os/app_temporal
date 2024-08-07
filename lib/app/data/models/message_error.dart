import 'dart:convert';

class MessageError {
  int code;
  String message;

  MessageError({
    required this.code,
    required this.message,
  });

  factory MessageError.fromRawJson(String str) =>
      MessageError.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MessageError.fromJson(Map<String, dynamic> json) => MessageError(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
  String messageError() => '$message \nCódigo: $code';
}
