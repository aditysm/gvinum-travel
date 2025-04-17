// To parse this JSON data, do
//
//     final allChatListModel = allChatListModelFromJson(jsonString);

import 'dart:convert';

AllChatListModel allChatListModelFromJson(String str) => AllChatListModel.fromJson(json.decode(str));

String allChatListModelToJson(AllChatListModel data) => json.encode(data.toJson());

class AllChatListModel {
    String? msg;
    List<Datum>? data;

    AllChatListModel({
        this.msg,
        this.data,
    });

    factory AllChatListModel.fromJson(Map<String, dynamic> json) => AllChatListModel(
        msg: json["msg"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? roomId;
    String? toUserName;
    int? toUserId;
    String? lastMessage;
    DateTime? lastMessageTime;
    int? countNotReadMessage;

    Datum({
        this.roomId,
        this.toUserName,
        this.toUserId,
        this.lastMessage,
        this.lastMessageTime,
        this.countNotReadMessage,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        roomId: json["room_id"],
        toUserName: json["to_user_name"],
        toUserId: json["to_user_id"],
        lastMessage: json["last_message"],
        lastMessageTime: json["last_message_time"] == null ? null : DateTime.parse(json["last_message_time"]),
        countNotReadMessage: json["count_not_read_message"],
    );

    Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "to_user_name": toUserName,
        "to_user_id": toUserId,
        "last_message": lastMessage,
        "last_message_time": lastMessageTime?.toIso8601String(),
        "count_not_read_message": countNotReadMessage,
    };
}
