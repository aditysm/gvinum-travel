import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:gvinum_travel/app/services/socket_service.dart';
import 'package:intl/intl.dart';
import '../controllers/chat_room_controller.dart';
import 'package:gvinum_travel/all_material.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  const ChatRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatRoomController());
    
    SocketService.socket?.on('new_message', (data) {
      controller.fetchChatMessages(controller.roomID.value);
      controller.chatListCont.readChatAdmin(controller.roomID.value, 1);
    });
    controller.scrollToBottom();
    controller.scrollController.addListener(() {
      if (controller.scrollController.hasClients) {
        final maxScroll = controller.scrollController.position.maxScrollExtent;
        final currentScroll = controller.scrollController.offset;
        if ((maxScroll - currentScroll) > 50) {
          controller.showScrollToBottomButton.value = true;
        } else {
          controller.showScrollToBottomButton.value = false;
        }
      }
    });

    controller.fetchChatMessages(controller.roomID.value);
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar:
       AppBar(
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
                title: "Fitur sedang digarap, coba lagi nanti!",
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.adaIsinya.value) {
                final messages = controller.chat.value?.data ?? [];
                final sortedMessages = messages
                  ..sort((a, b) {
                    final dateA =
                        DateTime.parse(a.createdAt?.toIso8601String() ?? '');
                    final dateB =
                        DateTime.parse(b.createdAt?.toIso8601String() ?? '');
                    return dateA.compareTo(dateB);
                  });

                final reversedMessages = sortedMessages.reversed.toList();

                return Stack(
                  children: [
                    NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        if (scrollNotification.metrics.axis == Axis.vertical) {
                          final offset = scrollNotification.metrics.pixels;

                          if (offset > 50) {
                            controller.showScrollToBottomButton.value = true;
                          } else {
                            controller.showScrollToBottomButton.value = false;
                          }
                        }
                        return false;
                      },
                      child: ListView.builder(
                          reverse: true,
                          controller: controller.scrollController,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          itemCount: reversedMessages.length,
                          itemBuilder: (context, index) {
                            final message = reversedMessages[index];
                            final messageDateTime = DateTime.parse(
                              message.createdAt?.toIso8601String() ??
                                  DateTime.now().toIso8601String(),
                            );
                            final messageDate = DateTime(
                              messageDateTime.year,
                              messageDateTime.month,
                              messageDateTime.day,
                            );

                            bool showDateLabel = true;
                            if (index < reversedMessages.length - 1) {
                              final nextMessage = reversedMessages[index + 1];
                              final nextDateTime = DateTime.parse(
                                nextMessage.createdAt?.toIso8601String() ??
                                    DateTime.now().toIso8601String(),
                              );
                              final nextDate = DateTime(
                                nextDateTime.year,
                                nextDateTime.month,
                                nextDateTime.day,
                              );
                              showDateLabel = messageDate != nextDate;
                            }

                            final isUser = message.sender?.role == "USER";
                            final isRead = message.isRead ?? false;
                            var text = message.message ?? '';

                            try {
                              text = utf8.decode(text.runes.toList());
                            } catch (e) {
                              print(e);
                            }

                            final time =
                                DateFormat.Hm().format(messageDateTime);

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (showDateLabel)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          controller.getChatDateLabel(
                                              messageDateTime),
                                          style: AllMaterial.inter(
                                            fontSize: 12,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                    ),
                                  Align(
                                    alignment: isUser
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          onTap: () {
                                            // Aksi saat bubble ditekan (misal: show context menu)
                                          },
                                          splashColor:
                                              Colors.grey.withOpacity(0.1),
                                          highlightColor: Colors.transparent,
                                          child: Ink(
                                            decoration: BoxDecoration(
                                              color: isUser
                                                  ? AllMaterial.colorPrimary
                                                  : AllMaterial
                                                      .colorWhitePrimary,
                                              border: !isUser
                                                  ? Border.all(
                                                      color: AllMaterial
                                                          .colorGreySec
                                                          .withOpacity(0.3),
                                                    )
                                                  : null,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (message.package != null)
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Image.network(
                                                            (message.package
                                                                        ?.image ??
                                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTkV-QyvVZLV8I351NbZVhCH4AlO69nhH9sA&s")
                                                                .replaceAll(
                                                                    "localhost",
                                                                    ApiUrl
                                                                        .baseUrl),
                                                            width:
                                                                double.infinity,
                                                            height: 150,
                                                            fit: BoxFit.cover,
                                                            loadingBuilder:
                                                                (context, child,
                                                                    loadingProgress) {
                                                              if (loadingProgress ==
                                                                  null) {
                                                                return child;
                                                              }
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 150,
                                                                color: Colors
                                                                    .grey[300],
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    const CircularProgressIndicator(),
                                                              );
                                                            },
                                                            errorBuilder:
                                                                (context, error,
                                                                    stackTrace) {
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 150,
                                                                color: Colors
                                                                    .grey[300],
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    const Icon(
                                                                  Icons
                                                                      .broken_image,
                                                                  color: Colors
                                                                      .redAccent,
                                                                  size: 40,
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 8),
                                                        Text(
                                                          message.package
                                                                  ?.name ??
                                                              '',
                                                          style:
                                                              AllMaterial.inter(
                                                            fontWeight:
                                                                AllMaterial
                                                                    .fontBold,
                                                            color: isUser
                                                                ? AllMaterial
                                                                    .colorWhite
                                                                : AllMaterial
                                                                    .colorBlack,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 4),
                                                        Text(
                                                          (message.packagePrices
                                                                      ?.price !=
                                                                  null)
                                                              ? 'total : Rp${NumberFormat('#,###', 'id_ID').format(message.packagePrices?.price ?? "0")}'
                                                              : "Harga tidak tersedia",
                                                          style:
                                                              AllMaterial.inter(
                                                            fontWeight:
                                                                AllMaterial
                                                                    .fontMedium,
                                                            color: isUser
                                                                ? AllMaterial
                                                                    .colorWhite
                                                                : AllMaterial
                                                                    .colorBlack,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 8),
                                                      ],
                                                    ),

                                                  // Teks Pesan
                                                  Text(
                                                    text,
                                                    style: AllMaterial.inter(
                                                      fontWeight: AllMaterial
                                                          .fontMedium,
                                                      color: isUser
                                                          ? AllMaterial
                                                              .colorWhite
                                                          : AllMaterial
                                                              .colorBlack,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),

                                                  // Jam + Status Pesan
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      if (isUser)
                                                        Icon(
                                                          isRead
                                                              ? Icons.done_all
                                                              : Icons.check,
                                                          size: 14,
                                                          color: isRead
                                                              ? Colors.white
                                                              : Colors.white70,
                                                        ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        time,
                                                        style:
                                                            AllMaterial.inter(
                                                          fontSize: 12,
                                                          color: isUser
                                                              ? Colors.white70
                                                              : Colors.black54,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    Obx(() {
                      return controller.showScrollToBottomButton.value
                          ? Positioned(
                              bottom: 20,
                              right: 20,
                              child: FloatingActionButton(
                                elevation: 1,
                                mini: true,
                                shape: const CircleBorder(),
                                backgroundColor: AllMaterial.colorWhite,
                                onPressed: controller.scrollToBottom,
                                child: const Icon(
                                  Icons.keyboard_double_arrow_down_rounded,
                                  color: AllMaterial.colorPrimary,
                                ),
                              ),
                            )
                          : const SizedBox.shrink();
                    }),
                  ],
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        children: [
                          AllMaterial.autoChatItem(
                            svg: "assets/icon/terpercaya.svg",
                            context: "terpercaya?",
                            onTap: () async {
                              await Future.delayed(
                                  const Duration(milliseconds: 500));
                              controller.postChatMessages(
                                  isAuto: true,
                                  message: "Apakah Gvinum Travel terpercaya?");
                            },
                          ),
                          const SizedBox(width: 10),
                          AllMaterial.autoChatItem(
                            svg: "assets/icon/cepat.svg",
                            context: "cepat?",
                            onTap: () async {
                              await Future.delayed(
                                  const Duration(milliseconds: 500));
                              controller.postChatMessages(
                                  isAuto: true,
                                  message: "Apakah Gvinum Travel cepat?");
                            },
                          ),
                          const SizedBox(width: 10),
                          AllMaterial.autoChatItem(
                            svg: "assets/icon/sigap.svg",
                            context: "sigap?",
                            onTap: () async {
                              await Future.delayed(
                                  const Duration(milliseconds: 500));
                              controller.postChatMessages(
                                  isAuto: true,
                                  message: "Apakah Gvinum Travel sigap?");
                            },
                          ),
                          const SizedBox(width: 10),
                          AllMaterial.autoChatItem(
                            svg: "assets/icon/update.svg",
                            context: "ter-update?",
                            onTap: () async {
                              await Future.delayed(
                                  const Duration(milliseconds: 500));
                              controller.postChatMessages(
                                  isAuto: true,
                                  message: "Apakah Gvinum Travel ter-update?");
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),

          // Chat Input Field
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
                      title: "Fitur sedang digarap, coba lagi nanti!",
                    );
                  },
                ),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: 40,
                      maxHeight: 150,
                    ),
                    child: Scrollbar(
                      child: TextField(
                        controller: controller.textController,
                        maxLines: null,
                        minLines: 1,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "Kirim pesan ke admin...",
                          border: InputBorder.none,
                          hintStyle:
                              AllMaterial.inter(color: Colors.grey.shade500),
                        ),
                        onSubmitted: (_) => controller.postChatMessages(),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () => controller.postChatMessages(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
