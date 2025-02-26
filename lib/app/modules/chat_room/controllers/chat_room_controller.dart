import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatRoomController extends GetxController {
  var messages = <Map<String, dynamic>>[].obs;
  // var messages = <Map<String, dynamic>>[
  //   {"text": "Sumbawa", "isUser": false, "time": "10:11"},
  //   {"text": "Asal mana bang?", "isUser": true, "time": "10:10"},
  //   {"text": "Iya bro", "isUser": false, "time": "10:11"},
  //   {
  //     "text": "Alhamdulillah Baik kok bang, makasih udah nanya balik yo",
  //     "isUser": true,
  //     "time": "10:11"
  //   },
  //   {
  //     "text": "Baik-baik aja sih, abang gimana?",
  //     "isUser": false,
  //     "time": "10:11"
  //   },
  //   {"text": "Apa kabar bang?", "isUser": true, "time": "10:10"},
  //   {"text": "Iya bro", "isUser": false, "time": "10:11"},
  //   {"text": "Gapapa nanya doang?", "isUser": true, "time": "10:11"},
  //   {"text": "Knp emg?", "isUser": false, "time": "10:11"},
  //   {"text": "Yakah?", "isUser": true, "time": "10:10"},
  //   {"text": "Iya bro", "isUser": false, "time": "10:11"},
  //   {
  //     "text": "Apakah Gvinum Travel terpercaya bang? bisa dijelaskan ga?",
  //     "isUser": true,
  //     "time": "10:11"
  //   },
  // ].obs;
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    // Saat pertama kali membuka chat, langsung scroll ke bawah
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (messages.isNotEmpty) {
        scrollToBottom();
      }
    });
  }

  Future sendAutoChat(String text) async {
    final time = DateFormat('HH:mm').format(DateTime.now());

    messages.insert(0, {
      'text': text,
      'time': time,
      'isUser': true,
    });

    textController.clear();
    update();
  }

  void sendMessage() {
    if (textController.text.trim().isNotEmpty) {
      messages.insert(0, {
        'text': textController.text.trim(),
        'time': '${DateTime.now().hour}:${DateTime.now().minute}',
        'isUser': true,
      });
      update();

      textController.clear();
      scrollToBottom();
    }
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
