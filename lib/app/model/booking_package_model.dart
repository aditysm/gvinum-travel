import 'dart:convert';

BookingPackageModel bookingPackageModelFromJson(String str) =>
    BookingPackageModel.fromJson(json.decode(str));

String bookingPackageModelToJson(BookingPackageModel data) =>
    json.encode(data.toJson());

class BookingPackageModel {
  String? msg;
  List<Datum>? data;

  BookingPackageModel({
    this.msg,
    this.data,
  });

  factory BookingPackageModel.fromJson(Map<String, dynamic> json) {
    try {
      return BookingPackageModel(
        msg: json["msg"],
        data: json["data"] is List
            ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
            : (json["data"] != null ? [Datum.fromJson(json["data"])] : []),
      );
    } catch (e) {
      print("Error parsing BookingPackageModel: $e");
      return BookingPackageModel(msg: "Error", data: []);
    }
  }

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  int? userId;
  int? packageId;
  int? packagesPriceId;
  DateTime? bookingDate;
  String? status;
  int? totalPrice;
  Package? package;
  PackagePrice? packagePrice;

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) {
    try {
      return Datum(
        id: json["id"] != null ? (json["id"] as num).toInt() : null,
        userId:
            json["user_id"] != null ? (json["user_id"] as num).toInt() : null,
        packageId: json["package_id"] != null
            ? (json["package_id"] as num).toInt()
            : null,
        packagesPriceId: json["packages_price_id"] != null
            ? (json["packages_price_id"] as num).toInt()
            : null,
        totalPrice: json["total_price"] != null
            ? (json["total_price"] as num).toInt()
            : null,
        bookingDate: json["booking_date"] != null
            ? DateTime.tryParse(json["booking_date"])
            : null,
        status: json["status"],
        package:
            json["package"] != null ? Package.fromJson(json["package"]) : null,
        packagePrice: json["package_price"] != null
            ? PackagePrice.fromJson(json["package_price"])
            : null,
      );
    } catch (e) {
      print("Error parsing Datum: $e");
      return Datum();
    }
  }

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

  factory Package.fromJson(Map<String, dynamic> json) {
    try {
      return Package(
        id: json["id"],
        name: json["name"],
        departureDate: json["departure_date"] != null
            ? DateTime.tryParse(json["departure_date"])
            : null,
        image: json["image"],
        category: json["category"],
        detail: json["detail"],
      );
    } catch (e) {
      print("Error parsing Package: $e");
      return Package();
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "departure_date": departureDate != null
            ? "${departureDate!.year.toString().padLeft(4, '0')}-${departureDate!.month.toString().padLeft(2, '0')}-${departureDate!.day.toString().padLeft(2, '0')}"
            : null,
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

  factory PackagePrice.fromJson(Map<String, dynamic> json) {
    try {
      return PackagePrice(
        id: json["id"],
        packageType: json["package_type"],
        roomType: json["room_type"],
        price: json["price"],
        detail: json["detail"],
        seatCount: json["seat_count"],
      );
    } catch (e) {
      print("Error parsing PackagePrice: $e");
      return PackagePrice();
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "package_type": packageType,
        "room_type": roomType,
        "price": price,
        "detail": detail,
        "seat_count": seatCount,
      };
}
