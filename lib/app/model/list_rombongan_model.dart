// To parse this JSON data, do
//
//     final listRombonganModel = listRombonganModelFromJson(jsonString);

import 'dart:convert';

ListRombonganModel listRombonganModelFromJson(String str) => ListRombonganModel.fromJson(json.decode(str));

String listRombonganModelToJson(ListRombonganModel data) => json.encode(data.toJson());

class ListRombonganModel {
    String? msg;
    Data? data;

    ListRombonganModel({
        this.msg,
        this.data,
    });

    factory ListRombonganModel.fromJson(Map<String, dynamic> json) => ListRombonganModel(
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.toJson(),
    };
}

class Data {
    int? countFilled;
    int? countBooking;
    int? countAvailable;
    List<User>? user;

    Data({
        this.countFilled,
        this.countBooking,
        this.countAvailable,
        this.user,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        countFilled: json["count_filled"],
        countBooking: json["count_booking"],
        countAvailable: json["count_available"],
        user: json["user"] == null ? [] : List<User>.from(json["user"]!.map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count_filled": countFilled,
        "count_booking": countBooking,
        "count_available": countAvailable,
        "user": user == null ? [] : List<dynamic>.from(user!.map((x) => x.toJson())),
    };
}

class User {
    int? id;
    String? name;
    String? email;
    String? role;
    String? fotoProfile;

    User({
        this.id,
        this.name,
        this.email,
        this.role,
        this.fotoProfile,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        fotoProfile: json["foto_profile"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "foto_profile": fotoProfile,
    };
}
