import 'dart:convert';

import 'package:get/get.dart';
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/data/api_url.dart';

import 'package:http/http.dart' as http;
import 'package:gvinum_travel/app/model/chat_list_model.dart';

class ChatListController extends GetxController {
  var token = AllMaterial.box.read("token");
  var chat = Rx<AllChatListModel?>(null);
  var chatList = [].obs;

  RxSet<int> selectedRoomIds = <int>{}.obs;
  RxBool isSelectionMode = false.obs;

  void toggleSelection(int roomId) {
    if (selectedRoomIds.contains(roomId)) {
      selectedRoomIds.remove(roomId);
    } else {
      selectedRoomIds.add(roomId);
    }
    if (selectedRoomIds.isEmpty) {
      isSelectionMode.value = false;
    } else {
      isSelectionMode.value = true;
    }
  }

  void clearSelection() {
    selectedRoomIds.clear();
    isSelectionMode.value = false;
  }

  Future<void> deleteSelectedRooms() async {
    final idsToDelete = selectedRoomIds.toList();
    print("Delete chat dijalankan untuk ID: $idsToDelete");

    try {
      for (var id in idsToDelete) {
        final response = await http.delete(
          Uri.parse("${ApiUrl.urlDeleteChatAdmin}$id"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        );

        if (response.statusCode == 200) {
          print("Room $id berhasil dihapus");
        } else {
          print("Gagal hapus room $id: ${response.body}");
        }
      }
      chat.value?.data
          ?.removeWhere((item) => idsToDelete.contains(item.roomId));
      chat.refresh();
      fetchChatListAdmin();
      clearSelection();
      update();
    } catch (e) {
      print("Error saat menghapus: $e");
    }
  }

  Future<void> fetchChatListAdmin() async {
    print("fetch chat list dijalankan...");
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetChatList),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var responseData = AllChatListModel.fromJson(data);
        chat.value = responseData;
        chatList.add(responseData.data);
        print(data);
      } else {
        print(data);
      }
      update();
    } catch (e) {
      print("$e");
    }
  }

  static void refreshChat() {
    var fi = Get.put(ChatListController());
    fi.fetchChatListAdmin();
  }

  Future<void> readChatAdmin(int? id, int jumlahBelumDibaca) async {
    print("read chat dijalankan...");
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetReadChatAdmin}$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(data);
        if (jumlahBelumDibaca > 0) {
          fetchChatListAdmin();
        }
      } else {
        print(data);
      }
      update();
    } catch (e) {
      print("$e");
    }
  }

  @override
  void onInit() {
    fetchChatListAdmin();
    super.onInit();
  }
}
