
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:gvinum_travel/all_material.dart';

void setupFirebaseMessaging() {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  messaging.requestPermission();

  messaging.getToken().then((token) {
    print("FCM Token: $token");
      AllMaterial.box.write("fcmToken", token);
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Pesan diterima saat aplikasi di latar depan: ${message.messageId}');
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('Aplikasi dibuka dari notifikasi: ${message.messageId}');
  });
}


