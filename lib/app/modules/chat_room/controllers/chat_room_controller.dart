import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
import 'package:gvinum_travel/app/model/all_chat_message_model.dart';
import 'package:gvinum_travel/app/modules/chat_list/controllers/chat_list_controller.dart';
import 'package:gvinum_travel/app/services/socket_service.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ChatRoomController extends GetxController {
  var chat = Rx<AllChatMessageModel?>(null);
  final textController = TextEditingController();
  final scrollController = ScrollController();
  final chatListCont = Get.put(ChatListController());
  var isUser = false.obs;
  var showScrollToBottomButton = false.obs;
  final token = AllMaterial.box.read("token");
  RxBool adaIsinya = true.obs;

  RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[].obs;
  RxInt roomID = 0.obs;
  var idReceiver = 0.obs;

  Future<void> fetchChatMessages(int id) async {
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetAllMessage}/$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final result = AllChatMessageModel.fromJson(data);
        chat.value = result;

        messages.clear();
        if (result.data != null) {
          messages.addAll(result.data!.map((e) => e.toJson()));
        }

        adaIsinya.value = result.data?.isNotEmpty ?? false;
        update();
        scrollToBottom();
      } else {
        _showError("Gagal mengambil data.");
      }
    } catch (e) {
      _showError("Terjadi kesalahan: $e");
    }
  }

  Future<void> postChatMessages({bool isAuto = false, String? message}) async {
    try {
      final response = await http.post(
        Uri.parse("${ApiUrl.urlPostNewMessage}/${roomID.value}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "receiver_id": idReceiver.value,
          "message": isAuto ? message : textController.text,
        }),
      );

      if (response.statusCode == 200) {
        textController.clear();
        ChatListController.refreshChat();
        chatListCont.fetchChatListAdmin();
        fetchChatMessages(roomID.value);
        scrollToBottom();
      } else {
        _showError("Gagal mengirim pesan.");
      }
    } catch (e) {
      _showError("Terjadi kesalahan saat mengirim pesan: $e");
    }
  }

  void _showError(String message) {
    Get.snackbar("Error", message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white);
  }

  String getChatDateLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final messageDate = DateTime(date.year, date.month, date.day);

    if (messageDate == today) {
      return "Hari ini";
    } else if (messageDate == yesterday) {
      return "Kemarin";
    } else if (now.difference(messageDate).inDays < 7) {
      return DateFormat.EEEE('id_ID').format(date);
    } else {
      return DateFormat('d MMMM yyyy', 'id_ID').format(date);
    }
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void handleScroll() {
    if (!scrollController.hasClients) return;

    final offset = scrollController.offset;
    final isNotAtBottom = offset > 50;

    showScrollToBottomButton.value = isNotAtBottom;
  }

  @override
  void onInit() {
    super.onInit();
    fetchChatMessages(roomID.value);
    scrollController.addListener(handleScroll);

    // Tambah listener dari socket
    SocketService.socket?.on('new_message', (data) {
      print("new_message dari socket: $data");

      if (data['room_id'] == roomID.value) {
        messages.add(data);
        // scrollToBottom();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (messages.isNotEmpty) scrollToBottom();
    });
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.removeListener(handleScroll);
  }
}
