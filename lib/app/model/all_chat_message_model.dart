// To parse this JSON data, do
//
//     final allChatMessageModel = allChatMessageModelFromJson(jsonString);

import 'dart:convert';

AllChatMessageModel allChatMessageModelFromJson(String str) => AllChatMessageModel.fromJson(json.decode(str));

String allChatMessageModelToJson(AllChatMessageModel data) => json.encode(data.toJson());

class AllChatMessageModel {
    String? msg;
    List<Datum>? data;

    AllChatMessageModel({
        this.msg,
        this.data,
    });

    factory AllChatMessageModel.fromJson(Map<String, dynamic> json) => AllChatMessageModel(
        msg: json["msg"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    int? roomId;
    String? message;
    bool? isRead;
    DateTime? createdAt;
    DateTime? updatedAt;
    Package? package;
    List<Media>? media;
    Receiver? receiver;
    Receiver? sender;
    PackagePrices? packagePrices;

    Datum({
        this.id,
        this.roomId,
        this.message,
        this.isRead,
        this.createdAt,
        this.updatedAt,
        this.package,
        this.media,
        this.receiver,
        this.sender,
        this.packagePrices,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        roomId: json["room_id"],
        message: json["message"],
        isRead: json["is_read"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        package: json["package"] == null ? null : Package.fromJson(json["package"]),
        media: json["media"] == null ? [] : List<Media>.from(json["media"]!.map((x) => Media.fromJson(x))),
        receiver: json["receiver"] == null ? null : Receiver.fromJson(json["receiver"]),
        sender: json["sender"] == null ? null : Receiver.fromJson(json["sender"]),
        packagePrices: json["package_prices"] == null ? null : PackagePrices.fromJson(json["package_prices"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "room_id": roomId,
        "message": message,
        "is_read": isRead,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "package": package?.toJson(),
        "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toJson())),
        "receiver": receiver?.toJson(),
        "sender": sender?.toJson(),
        "package_prices": packagePrices?.toJson(),
    };
}

class Media {
    int? id;
    String? type;
    String? url;

    Media({
        this.id,
        this.type,
        this.url,
    });

    factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        type: json["type"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "url": url,
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
        departureDate: json["departure_date"] == null ? null : DateTime.parse(json["departure_date"]),
        image: json["image"],
        category: json["category"],
        detail: json["detail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "departure_date": "${departureDate!.year.toString().padLeft(4, '0')}-${departureDate!.month.toString().padLeft(2, '0')}-${departureDate!.day.toString().padLeft(2, '0')}",
        "image": image,
        "category": category,
        "detail": detail,
    };
}

class PackagePrices {
    int? id;
    String? packageType;
    String? roomType;
    int? price;
    String? detail;
    int? seatCount;

    PackagePrices({
        this.id,
        this.packageType,
        this.roomType,
        this.price,
        this.detail,
        this.seatCount,
    });

    factory PackagePrices.fromJson(Map<String, dynamic> json) => PackagePrices(
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

class Receiver {
    int? id;
    String? name;
    String? email;
    String? role;
    String? fotoProfile;

    Receiver({
        this.id,
        this.name,
        this.email,
        this.role,
        this.fotoProfile,
    });

    factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
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
