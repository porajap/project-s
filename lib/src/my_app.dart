import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:project_s/src/pages/auth/auth_pin_page.dart';
import 'package:project_s/src/pages/auth/create_pin_page.dart';
import 'package:project_s/src/pages/auth/login_page.dart';
import 'package:project_s/src/services/navigation_service.dart';
import 'package:project_s/src/utils/app_theme.dart';
import 'package:project_s/src/utils/constants.dart';

import 'bloc/auth/auth_bloc.dart';
import 'bloc/auth_pin/auth_pin_bloc.dart';
import 'pages/home/home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

final logger = Logger(
  printer: PrettyPrinter(),
);

final loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    if (kReleaseMode) {
      Logger.level = Level.nothing;
    } else {
      Logger.level = Level.debug;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      title: '${Constants.appName}',
      theme: AppTheme().lightTheme,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      home: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthStateCheckPhone) {
            if (state.res.error!) {
              BotToast.showText(text: state.res.message ?? "Phone is invalid");
            }

            if (state is AuthStatePINUnEqual) {
              BotToast.showText(text: "PIN is invalid");
            }
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            BotToast.closeAllLoading();

            if (state is AuthStateTokenInvalid) {
              BotToast.showText(text: "Token invalid");

              WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.popUntil(context, (route) => route.isFirst));

              return LoginPage();
            }

            if (state is AuthStateCheckPhone) {
              var _res = state.res;
              bool _error = _res.error ?? false;
              bool _firstLogin = _res.firstLogin ?? false;
              context.read<AuthPinBloc>().add(AuthNullPINEvent());

              if (!_error) {
                if (_firstLogin) {
                  return CreatePIN();
                } else {
                  return AuthPIN();
                }
              }
              return LoginPage();
            }

            if (state is AuthStateUnauthenticated) {
              return LoginPage();
            }

            if (state is AuthStateAuthenticated) {
              return HomePage();
            }

            if (state is AuthStatePINUnEqual) {
              BotToast.showText(text: "PIN is invalid");

              context.read<AuthPinBloc>().add(AuthNullPINEvent());
              return AuthPIN();
            }

            return Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
