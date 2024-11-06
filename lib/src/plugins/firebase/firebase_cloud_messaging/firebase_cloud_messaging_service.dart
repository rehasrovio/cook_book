import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseCloudMessagingService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initFireBaseMessaging() async {
    await _firebaseMessaging.requestPermission();

    final token = await _firebaseMessaging.getToken();

    print('TOKEN -> $token');

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title -> ${message.notification?.title}');
  print('Body -> ${message.notification?.body}');
  print('payload -> ${message.data}');
}
