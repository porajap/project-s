import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_s/src/bloc/BlocObserver.dart';
import 'package:project_s/src/bloc/auth/auth_bloc.dart';
import 'package:project_s/src/bloc/auth_pin/auth_pin_bloc.dart';
import 'package:project_s/src/bloc/create_pin/create_pin_bloc.dart';
import 'package:project_s/src/my_app.dart';

import 'firebase_options.dart';
import 'src/services/push_notification_service.dart';

PushNotificationService pushNotificationService = PushNotificationService();

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    await pushNotificationService.setupFlutterNotifications();
  }

  BlocOverrides.runZoned(
    () {
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (_) => AuthBloc()..add(AuthEventAppStart()),
            ),
            BlocProvider<AuthPinBloc>(
              create: (_) => AuthPinBloc(authenticationBloc: BlocProvider.of<AuthBloc>(_)),
            ),
            BlocProvider<CreatePINBloc>(
              create: (_) => CreatePINBloc(authenticationBloc: BlocProvider.of<AuthBloc>(_)),
            ),
          ],
          child: MyApp(),
        ),
      );
    },
    blocObserver: SimpleBlocObserver(),
  );
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await pushNotificationService.setupFlutterNotifications();
  pushNotificationService.showFlutterNotification(message);
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
