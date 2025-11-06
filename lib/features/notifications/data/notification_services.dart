import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  firebaseInit(){
    FirebaseMessaging.onMessage.listen((message) {
      debugPrint("Message received: ${message.messageId}");
      if (message.notification != null) {
        debugPrint("Notification Title: ${message.notification!.title}");
        debugPrint("Notification Body: ${message.notification!.body}");
      }
    });
  }

  Future<void> requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      sound: true,
      provisional: false,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint("User granted permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint("User granted provisional permission");
    } else {
      debugPrint("User declined or has not accepted permission");
    }
  }

  Future<void> getDeviceToken() async {
    try {
      String? token = await messaging.getToken();
      if (token != null) {
        debugPrint("Device Token: $token");
      } else {
        debugPrint("Token is null");
      }
    } catch (e) {
      debugPrint("Error getting token: $e");
    }
    messaging.onTokenRefresh.listen((newToken) {
      debugPrint("Token refreshed: $newToken");
    });
  }
}
