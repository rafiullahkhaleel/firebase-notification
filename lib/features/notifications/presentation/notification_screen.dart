import 'package:firebase_notification/features/notifications/data/notification_services.dart';
import 'package:firebase_notification/features/notifications/domain/notification_repositry.dart';
import 'package:flutter/material.dart';

/// 🔹 Presentation Layer: UI part (Widget)
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final repo = NotificationRepository(NotificationServices());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repo.initializeNotification();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Permission Example'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            repo.initializeNotification();
          },
          child: const Text("Request Notification Permission"),
        ),
      ),
    );
  }
}
