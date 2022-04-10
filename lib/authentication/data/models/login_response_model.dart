// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    LoginResponseModel({
        required this.error,
        required this.token,
        required this.uuid,
        required this.expires,
    });

    bool error;
    String token;
    String uuid;
    int expires;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        error: json["error"],
        token: json["token"],
        uuid: json["uuid"],
        expires: json["expires"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "token": token,
        "uuid": uuid,
        "expires": expires,
    };
}
