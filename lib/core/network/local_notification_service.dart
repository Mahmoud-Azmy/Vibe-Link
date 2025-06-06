import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  // Ensure this is a top-level function or a static method as required,
  // properly annotated for background execution.
  @pragma('vm:entry-point')
  static void notificationTapBackground(
    NotificationResponse notificationResponse,
  ) {
    // Implement your background notification tap logic here
    // e.g., print details, navigate, update data
    print('Background notification tapped: ${notificationResponse.payload}');
  }

  // Separate handler for foreground/tap-to-open notifications
  static void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) {
    // Implement your foreground notification tap logic here
    print('Foreground notification tapped: ${notificationResponse.payload}');
  }

  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
      onDidReceiveNotificationResponse:
          onDidReceiveNotificationResponse, // Use the new handler
    );
  }

  static Future<void> showNotification(RemoteMessage message) async {
    final NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        message.notification?.android?.channelId ?? 'default_channel_id',
        'Default Channel',
        importance: Importance.max,
        priority: Priority.high,
      ),

      // Add iOSNotificationDetails if needed
    );
    await _flutterLocalNotificationsPlugin.show(
      1,
      message.notification?.title ?? 'Default Title',
      message.notification?.body ?? 'Default Body',
      notificationDetails,
      payload: message.data['postId'].toString(),
    );
  }
}
