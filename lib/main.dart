import 'package:cook_book/src/plugins/firebase/firebase_cloud_messaging/firebase_cloud_messaging_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:cook_book/src/features/auth/presentation/pages/sign_in_page.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseCloudMessagingService().initFireBaseMessaging();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cook Book',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GestureDetector(
        onTap: () => primaryFocus?.unfocus(),
        child: const SignInPage(),
      ),
    );
  }
}
