// To parse this JSON data, do
//
//     final packageBookingPriceModel = packageBookingPriceModelFromJson(jsonString);

import 'dart:convert';

PackageBookingPriceModel packageBookingPriceModelFromJson(String str) => PackageBookingPriceModel.fromJson(json.decode(str));

String packageBookingPriceModelToJson(PackageBookingPriceModel data) => json.encode(data.toJson());

class PackageBookingPriceModel {
    String? msg;
    Data? data;

    PackageBookingPriceModel({
        this.msg,
        this.data,
    });

    factory PackageBookingPriceModel.fromJson(Map<String, dynamic> json) => PackageBookingPriceModel(
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.toJson(),
    };
}

class Data {
    PackagePrice? packagePrice;
    int? countSeatAvaliable;

    Data({
        this.packagePrice,
        this.countSeatAvaliable,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        packagePrice: json["package_price"] == null ? null : PackagePrice.fromJson(json["package_price"]),
        countSeatAvaliable: json["count_seat_avaliable"],
    );

    Map<String, dynamic> toJson() => {
        "package_price": packagePrice?.toJson(),
        "count_seat_avaliable": countSeatAvaliable,
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
