import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'Customerfeedback', // id
  'Customerfeedback', // title
  description: 'This channel is used for important notifications.',
  importance: Importance.max,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message : ${message.messageId}");
}



class FirebaseNotification {

  initialize() async {
    await Firebase.initializeApp();
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    flutterLocalNotificationPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload) async {
      debugPrint('onclick payload $payload');
    });

    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await flutterLocalNotificationPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);


    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint(message.toString());
      notify(message);
    });
  }

  notify(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;

    if (notification != null) {
      AndroidNotificationDetails notificationDetails =
          AndroidNotificationDetails(channel.id, channel.name,
              channelDescription: channel.description,
              styleInformation:
                  BigTextStyleInformation(notification.body ?? ''),
              importance: Importance.max,
              priority: Priority.high,
              groupKey: channel.id);
      NotificationDetails notificationDetailsPlatformSpecifics =
          NotificationDetails(android: notificationDetails);

      flutterLocalNotificationPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          notificationDetailsPlatformSpecifics);
    }

    List<ActiveNotification>? activeNotifications =
        await flutterLocalNotificationPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.getActiveNotifications();
    if (activeNotifications != null && activeNotifications.isNotEmpty) {
      List<String> lines =
          activeNotifications.map((e) => e.title.toString()).toList();
      InboxStyleInformation inboxStyleInformation = InboxStyleInformation(lines,
          contentTitle: "${activeNotifications.length - 1} messages",
          summaryText: "${activeNotifications.length - 1} messages");
      AndroidNotificationDetails groupNotificationDetails =
          AndroidNotificationDetails(channel.id, channel.name,
              channelDescription: channel.description,
              styleInformation: inboxStyleInformation,
              setAsGroupSummary: true,
              groupKey: channel.id);

      NotificationDetails groupNotificationDetailsPlatformSpecifics =
          NotificationDetails(android: groupNotificationDetails);
      await flutterLocalNotificationPlugin.show(
          0, '', '', groupNotificationDetailsPlatformSpecifics);
    }
  }
}
