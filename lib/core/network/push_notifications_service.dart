import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static Future init() async {
    await messaging.requestPermission();
    String? token = await messaging.getToken();
    log('token $token');
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    await Firebase.initializeApp();
    // This method will be called when the app is in the background or terminated
    // and a notification is received.
    log('Handling a background message: ${message.messageId}');
    log('Handling a background message: ${message.data}');
    log('Handling a background message: ${message.notification?.title}');
    log('Handling a background message: ${message.notification?.body}');
  }
}
