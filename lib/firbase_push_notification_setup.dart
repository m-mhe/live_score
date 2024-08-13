import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FirBasePushNotificationSetup {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  FirBasePushNotificationSetup._();

  static final FirBasePushNotificationSetup instance =
      FirBasePushNotificationSetup._();

  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    //Foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print(message.notification?.title);
      }
      if (kDebugMode) {
        print(message.notification?.body);
      }
      if (kDebugMode) {
        print(message.data);
      }
    });

    //Background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint(message.notification?.title);
      debugPrint(message.notification?.body);
      debugPrint(message.data.toString());
    });

    //Terminated
    FirebaseMessaging.onBackgroundMessage(justDemo);

    await _getToken();
    await _onTokenRefresh();
  }

  Future<void> _getToken() async {
    String? token = await _firebaseMessaging.getToken();
    print("Token :  $token");
  }

  Future<void> _onTokenRefresh() async {
    _firebaseMessaging.onTokenRefresh.listen((String token) {
      print("Token :  $token");
    });
  }
}

Future<void> justDemo(RemoteMessage message) async {}
