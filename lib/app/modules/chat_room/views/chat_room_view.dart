import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';

import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  const ChatRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatRoomController());

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              AllMaterial.messageScaffold(
                  title: "Fitur sedang digarap, coba lagi nanti!");
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Bagian Chat Messages
          Expanded(
            child: Obx(() {
              if (controller.messages.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Opacity(opacity: 0, child: Text("data")),
                      Column(
                        children: [
                          Text(
                            "Ada yang bisa dibantu?",
                            style: AllMaterial.inter(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: AllMaterial.colorBlack,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Mulai Konsultasi ke Admin",
                            style: AllMaterial.inter(
                              color: AllMaterial.colorGreyPrim,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AllMaterial.autoChatItem(
                                svg: "assets/icon/terpercaya.svg",
                                context: "terpercaya?",
                                onTap: () async {
                                  await Future.delayed(
                                      const Duration(milliseconds: 500));
                                  controller.sendAutoChat(
                                      "Apakah Gvinum Travel terpercaya?");
                                }),
                            const SizedBox(width: 10),
                            AllMaterial.autoChatItem(
                              svg: "assets/icon/cepat.svg",
                              context: "cepat?",
                              onTap: () async {
                                await Future.delayed(
                                    const Duration(milliseconds: 500));
                                controller.sendAutoChat(
                                    "Apakah Gvinum Travel cepat?");
                              },
                            ),
                            const SizedBox(width: 10),
                            AllMaterial.autoChatItem(
                              svg: "assets/icon/sigap.svg",
                              context: "sigap?",
                              onTap: () async {
                                await Future.delayed(
                                    const Duration(milliseconds: 500));
                                controller.sendAutoChat(
                                    "Apakah Gvinum Travel sigap?");
                              },
                            ),
                            const SizedBox(width: 10),
                            AllMaterial.autoChatItem(
                              svg: "assets/icon/update.svg",
                              context: "ter-update?",
                              onTap: () async {
                                await Future.delayed(
                                    const Duration(milliseconds: 500));
                                controller.sendAutoChat(
                                    "Apakah Gvinum Travel ter-update?");
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                controller: controller.scrollController,
                reverse: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages[index];
                  final isUser = message['isUser'] as bool;

                  return Align(
                    alignment:
                        isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isUser
                              ? AllMaterial.colorPrimary
                              : AllMaterial.colorWhitePrimary,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(10),
                            topRight: const Radius.circular(10),
                            bottomLeft: isUser
                                ? const Radius.circular(10)
                                : Radius.zero,
                            bottomRight: isUser
                                ? Radius.zero
                                : const Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message['text'],
                              style: AllMaterial.inter(
                                fontWeight: AllMaterial.fontMedium,
                                color: isUser
                                    ? AllMaterial.colorWhite
                                    : AllMaterial.colorBlack,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.access_time,
                                    size: 12,
                                    color: isUser
                                        ? Colors.white70
                                        : Colors.black54),
                                const SizedBox(width: 4),
                                Text(
                                  message['time'],
                                  style: AllMaterial.inter(
                                      fontSize: 12,
                                      color: isUser
                                          ? Colors.white70
                                          : Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),

          // Bagian Input Chat
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.redAccent),
                  onPressed: () {
                    AllMaterial.messageScaffold(
                        title: "Fitur sedang digarap, coba lagi nanti!");
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: controller.textController,
                    decoration: InputDecoration(
                      hintText: "Kirim pesan ke admin...",
                      border: InputBorder.none,
                      hintStyle: AllMaterial.inter(color: Colors.grey.shade500),
                    ),
                    onSubmitted: (_) => controller.sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.redAccent),
                  onPressed: () => controller.sendMessage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
