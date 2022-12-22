import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_s/src/bloc/BlocObserver.dart';
import 'package:project_s/src/bloc/auth/auth_bloc.dart';
import 'package:project_s/src/bloc/auth_pin/auth_pin_bloc.dart';
import 'package:project_s/src/bloc/create_pin/create_pin_bloc.dart';
import 'package:project_s/src/my_app.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

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
              create: (_) => CreatePINBloc(),
            ),
          ],
          child: MyApp(),
        ),
      );
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
