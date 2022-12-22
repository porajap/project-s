import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_s/src/models/response_model.dart';
import 'package:project_s/src/services/auth.dart';
import 'package:project_s/src/services/pref_service.dart';

import '../../models/logged_model.dart';
import '../../my_app.dart';
import '../../services/custom_exception.dart';
import '../../utils/constants.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final authService = AuthService();
  final preService = SharedPreferencesService();

  AuthBloc() : super(AuthStateLoading()) {
    on<AuthEventCheckPhone>((event, emit) async {
      emit(AuthStateLoading());

      ResponseModel _res = await authService.checkPhone(phone: event.phone);

      emit(AuthStateCheckPhone(res: _res));
    });

    on<AuthEventAppStart>((event, emit) async {
      final bool isLogin = await preService.getIsLoggedIn();

      if (isLogin) {
        emit(AuthStateAuthenticated());
      } else {
        emit(AuthStateUnauthenticated());
      }
    });

    on<AuthEventLoggedOut>((event, emit) async {
      emit(AuthStateLoading());
      await authService.logout();
      emit(AuthStateUnauthenticated(showAlert: false));
    });

    on<AuthEventLoggedIn>((event, emit) async {
      emit(AuthStateLoading());

      try {
        LoggedModel _result = await authService.login(password: event.password);

        bool _error = _result.error ?? true;
        if (!_error) {
          emit(AuthStateAuthenticated());
        } else {
          emit(AuthStatePINUnEqual());
        }
      } on TimeoutException {
        String _message = "${Constants.textInternetLost}";
        emit(AuthStateUnauthenticated(showAlert: true, message: _message));
      } on AuthenticationException catch (e) {
        String _message = e.message;
        emit(AuthStateUnauthenticated(showAlert: true, message: _message));
      }
    });
  }
}
