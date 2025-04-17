// To parse this JSON data, do
//
//     final listPackageModel = listPackageModelFromJson(jsonString);

import 'dart:convert';

ListPackageModel listPackageModelFromJson(String str) => ListPackageModel.fromJson(json.decode(str));

String listPackageModelToJson(ListPackageModel data) => json.encode(data.toJson());

class ListPackageModel {
    String? msg;
    List<Datum>? data;

    ListPackageModel({
        this.msg,
        this.data,
    });

    factory ListPackageModel.fromJson(Map<String, dynamic> json) => ListPackageModel(
        msg: json["msg"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Package? package;
    dynamic avgRating;

    Datum({
        this.package,
        this.avgRating,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        package: json["package"] == null ? null : Package.fromJson(json["package"]),
        avgRating: json["avg_rating"],
    );

    Map<String, dynamic> toJson() => {
        "package": package?.toJson(),
        "avg_rating": avgRating,
    };
}

class Package {
    int? id;
    String? name;
    DateTime? departureDate;
    String? image;
    String? category;
    String? detail;
    List<PackagePrice>? packagePrices;

    Package({
        this.id,
        this.name,
        this.departureDate,
        this.image,
        this.category,
        this.detail,
        this.packagePrices,
    });

    factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        name: json["name"],
        departureDate: json["departure_date"] == null ? null : DateTime.parse(json["departure_date"]),
        image: json["image"],
        category: json["category"],
        detail: json["detail"],
        packagePrices: json["package_prices"] == null ? [] : List<PackagePrice>.from(json["package_prices"]!.map((x) => PackagePrice.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "departure_date": "${departureDate!.year.toString().padLeft(4, '0')}-${departureDate!.month.toString().padLeft(2, '0')}-${departureDate!.day.toString().padLeft(2, '0')}",
        "image": image,
        "category": category,
        "detail": detail,
        "package_prices": packagePrices == null ? [] : List<dynamic>.from(packagePrices!.map((x) => x.toJson())),
    };
}

class PackagePrice {
    int? id;
    String? packageType;
    String? roomType;
    double? price;
    String? detail;
    int? seatCount;

    PackagePrice({
        this.id,
        this.packageType,
        this.roomType,
        this.price,
        this.detail,
        this.seatCount,
    });

    factory PackagePrice.fromJson(Map<String, dynamic> json) => PackagePrice(
        id: json["id"],
        packageType: json["package_type"],
        roomType: json["room_type"],
        price: json["price"],
        detail: json["detail"],
        seatCount: json["seat_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "package_type": packageType,
        "room_type": roomType,
        "price": price,
        "detail": detail,
        "seat_count": seatCount,
    };
}
