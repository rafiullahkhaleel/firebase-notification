import 'package:firebase_notification/features/notifications/data/notification_services.dart';

class NotificationRepository{
  final NotificationServices _notificationServices;

  NotificationRepository(this._notificationServices);

  Future<void> initializeNotification()async{
   await _notificationServices.requestNotificationPermission();
  await  _notificationServices.getDeviceToken();
   _notificationServices.firebaseInit();
   _notificationServices.initLocalNotification();
  }
}