// To parse this JSON data, do
//
//     final detailPackageBookingModel = detailPackageBookingModelFromJson(jsonString);

import 'dart:convert';

DetailPackageBookingModel detailPackageBookingModelFromJson(String str) =>
    DetailPackageBookingModel.fromJson(json.decode(str));

String detailPackageBookingModelToJson(DetailPackageBookingModel data) =>
    json.encode(data.toJson());

class DetailPackageBookingModel {
  String? msg;
  Data? data;

  DetailPackageBookingModel({
    this.msg,
    this.data,
  });

  factory DetailPackageBookingModel.fromJson(Map<String, dynamic> json) =>
      DetailPackageBookingModel(
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
  int? userId;
  int? packageId;
  int? packagesPriceId;
  DateTime? bookingDate;
  String? status;
  double? totalPrice;
  Package? package;
  PackagePrice? packagePrice;

  Data({
    this.id,
    this.userId,
    this.packageId,
    this.packagesPriceId,
    this.bookingDate,
    this.status,
    this.totalPrice,
    this.package,
    this.packagePrice,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        packageId: json["package_id"],
        packagesPriceId: json["packages_price_id"],
        bookingDate: json["booking_date"] == null
            ? null
            : DateTime.parse(json["booking_date"]),
        status: json["status"],
        totalPrice: json["total_price"],
        package:
            json["package"] == null ? null : Package.fromJson(json["package"]),
        packagePrice: json["package_price"] == null
            ? null
            : PackagePrice.fromJson(json["package_price"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "package_id": packageId,
        "packages_price_id": packagesPriceId,
        "booking_date": bookingDate?.toIso8601String(),
        "status": status,
        "total_price": totalPrice,
        "package": package?.toJson(),
        "package_price": packagePrice?.toJson(),
      };
}

class Package {
  int? id;
  String? name;
  DateTime? departureDate;
  String? image;
  String? category;
  String? detail;

  Package({
    this.id,
    this.name,
    this.departureDate,
    this.image,
    this.category,
    this.detail,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        name: json["name"],
        departureDate: json["departure_date"] == null
            ? null
            : DateTime.parse(json["departure_date"]),
        image: json["image"],
        category: json["category"],
        detail: json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "departure_date":
            "${departureDate!.year.toString().padLeft(4, '0')}-${departureDate!.month.toString().padLeft(2, '0')}-${departureDate!.day.toString().padLeft(2, '0')}",
        "image": image,
        "category": category,
        "detail": detail,
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
