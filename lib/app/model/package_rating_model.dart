// To parse this JSON data, do
//
//     final packageRatingModel = packageRatingModelFromJson(jsonString);

import 'dart:convert';

PackageRatingModel packageRatingModelFromJson(String str) => PackageRatingModel.fromJson(json.decode(str));

String packageRatingModelToJson(PackageRatingModel data) => json.encode(data.toJson());

class PackageRatingModel {
    String? msg;
    Data? data;

    PackageRatingModel({
        this.msg,
        this.data,
    });

    factory PackageRatingModel.fromJson(Map<String, dynamic> json) => PackageRatingModel(
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.toJson(),
    };
}

class Data {
    Statistik? statistik;
    List<Review>? reviews;

    Data({
        this.statistik,
        this.reviews,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        statistik: json["statistik"] == null ? null : Statistik.fromJson(json["statistik"]),
        reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statistik": statistik?.toJson(),
        "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
    };
}

class Review {
    int? id;
    int? packageId;
    int? rating;
    String? review;
    DateTime? createdAt;
    User? user;

    Review({
        this.id,
        this.packageId,
        this.rating,
        this.review,
        this.createdAt,
        this.user,
    });

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        packageId: json["package_id"],
        rating: json["rating"],
        review: json["review"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "package_id": packageId,
        "rating": rating,
        "review": review,
        "created_at": createdAt?.toIso8601String(),
        "user": user?.toJson(),
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

class Statistik {
    int? countRating;
    int? countReviews;
    int? avgRating;
    int? count5;
    int? count4;
    int? count3;
    int? count2;
    int? count1;

    Statistik({
        this.countRating,
        this.countReviews,
        this.avgRating,
        this.count5,
        this.count4,
        this.count3,
        this.count2,
        this.count1,
    });

    factory Statistik.fromJson(Map<String, dynamic> json) => Statistik(
        countRating: json["count_rating"],
        countReviews: json["count_reviews"],
        avgRating: json["avg_rating"],
        count5: json["count_5"],
        count4: json["count_4"],
        count3: json["count_3"],
        count2: json["count_2"],
        count1: json["count_1"],
    );

    Map<String, dynamic> toJson() => {
        "count_rating": countRating,
        "count_reviews": countReviews,
        "avg_rating": avgRating,
        "count_5": count5,
        "count_4": count4,
        "count_3": count3,
        "count_2": count2,
        "count_1": count1,
    };
}
