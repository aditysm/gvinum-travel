// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/modules/chat_room/controllers/chat_room_controller.dart';
import 'package:gvinum_travel/app/modules/chat_room/views/chat_room_view.dart';
import 'package:intl/intl.dart';

import '../controllers/chat_list_controller.dart';

class ChatListView extends GetView<ChatListController> {
  const ChatListView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatListController());
  var chatCont = Get.put(ChatRoomController());

    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Hubungi Admin',
          style: AllMaterial.inter(
            color: AllMaterial.colorBlack,
            fontWeight: AllMaterial.fontBold,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          var chatData = controller.chat.value?.data ?? [];
          if (chatData.isEmpty) {
            Center(
              child: Text(
                'Tidak ada chat terbaru',
                style: AllMaterial.inter(),
              ),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  chatData.length,
                  (index) {
                    var chatItem = chatData[index];
                    var belumDibaca = chatItem.countNotReadMessage ?? 0;
                    String lastMessage = chatItem.lastMessage ?? "";
                    try {
                      lastMessage = utf8.decode(lastMessage.runes.toList());
                    } catch (e) {
                      // fallback jika gagal decode
                    }
                    return ListTile(
                      onTap: () {
                        chatCont.idReceiver.value =
                            chatItem.toUserId ?? 0;
                        Get.to(() => const ChatRoomView());
                        chatCont.roomID.value = chatItem.roomId ?? 0;
                        if (belumDibaca > 0) {
                          controller.readChatAdmin(
                              chatItem.roomId, belumDibaca);
                        }
                      },
                      contentPadding: EdgeInsets.zero,
                      trailing: SizedBox(
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              DateFormat.Hm('id_ID').format(
                                DateTime.tryParse(chatItem.lastMessageTime
                                            ?.toIso8601String() ??
                                        "") ??
                                    DateTime.now(),
                              ),
                              style: AllMaterial.inter(fontSize: 12),
                            ),
                            const SizedBox(height: 5),
                            chatItem.countNotReadMessage != 0
                                ? CircleAvatar(
                                    backgroundColor: AllMaterial.colorPrimary,
                                    radius: 13,
                                    child: Text(
                                      "${chatItem.countNotReadMessage}",
                                      style: AllMaterial.inter(
                                        color: AllMaterial.colorWhite,
                                        fontSize: 13,
                                        fontWeight: AllMaterial.fontSemiBold,
                                      ),
                                    ),
                                  )
                                : const Icon(
                                    size: 15,
                                    Icons.arrow_forward_ios,
                                  ),
                          ],
                        ),
                      ),
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundColor: AllMaterial.colorGreySec,
                        backgroundImage: AssetImage("assets/images/logo.png"),
                      ),
                      title: Text(
                        chatItem.toUserName ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: AllMaterial.inter(
                          fontWeight: AllMaterial.fontSemiBold,
                        ),
                      ),
                      subtitle: Text(
                        chatItem.lastMessage ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AllMaterial.inter(
                          color: AllMaterial.colorGreyPrim,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
