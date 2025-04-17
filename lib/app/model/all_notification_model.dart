import 'dart:convert';

AllNotificationModel allNotificationModelFromJson(String str) =>
    AllNotificationModel.fromJson(json.decode(str));

String allNotificationModelToJson(AllNotificationModel data) =>
    json.encode(data.toJson());

class AllNotificationModel {
  String? msg;
  Map<String, List<NotificationItem>>? data;

  AllNotificationModel({
    this.msg,
    this.data,
  });

  factory AllNotificationModel.fromJson(Map<String, dynamic> json) =>
      AllNotificationModel(
        msg: json["msg"],
        data: (json["data"] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(
            key,
            List<NotificationItem>.from(
              (value as List).map((x) => NotificationItem.fromJson(x)),
            ),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.map(
          (key, value) => MapEntry(
            key,
            value.map((x) => x.toJson()).toList(),
          ),
        ),
      };
}

class NotificationItem {
  int? id;
  String? title;
  String? body;
  DateTime? createdAt;
  List<dynamic>? reads;

  NotificationItem({
    this.id,
    this.title,
    this.body,
    this.createdAt,
    this.reads,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      NotificationItem(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        reads: (json["reads"] as List?)?.map((x) => x).toList() ?? [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "created_at": createdAt?.toIso8601String(),
        "reads": reads ?? [],
      };
}
