// To parse this JSON data, do
//
//     final detailPackageModel = detailPackageModelFromJson(jsonString);

import 'dart:convert';

DetailPackageModel detailPackageModelFromJson(String str) => DetailPackageModel.fromJson(json.decode(str));

String detailPackageModelToJson(DetailPackageModel data) => json.encode(data.toJson());

class DetailPackageModel {
    String? msg;
    Data? data;

    DetailPackageModel({
        this.msg,
        this.data,
    });

    factory DetailPackageModel.fromJson(Map<String, dynamic> json) => DetailPackageModel(
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? name;
    DateTime? departureDate;
    String? image;
    String? category;
    String? detail;
    List<Gallery>? gallery;
    User? user;

    Data({
        this.id,
        this.name,
        this.departureDate,
        this.image,
        this.category,
        this.detail,
        this.gallery,
        this.user,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        departureDate: json["departure_date"] == null ? null : DateTime.parse(json["departure_date"]),
        image: json["image"],
        category: json["category"],
        detail: json["detail"],
        gallery: json["gallery"] == null ? [] : List<Gallery>.from(json["gallery"]!.map((x) => Gallery.fromJson(x))),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "departure_date": "${departureDate!.year.toString().padLeft(4, '0')}-${departureDate!.month.toString().padLeft(2, '0')}-${departureDate!.day.toString().padLeft(2, '0')}",
        "image": image,
        "category": category,
        "detail": detail,
        "gallery": gallery == null ? [] : List<dynamic>.from(gallery!.map((x) => x.toJson())),
        "user": user?.toJson(),
    };
}

class Gallery {
    int? id;
    String? image;

    Gallery({
        this.id,
        this.image,
    });

    factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
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
