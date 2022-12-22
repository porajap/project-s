import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../auth/auth_bloc.dart';

part 'auth_pin_event.dart';

part 'auth_pin_state.dart';

class AuthPinBloc extends Bloc<AuthPinEvent, AuthPinState> {
  AuthBloc? authenticationBloc;

  AuthPinBloc({required this.authenticationBloc}) : super(const AuthPinState(pinStatus: AuthPINStatus.enterPIN)) {
    on<AuthPinAddEvent>((event, emit) async {
      String pin = "${state.pin}${event.pinNum}";
      if (pin.length < 4) {
        emit(AuthPinState(pin: pin, pinStatus: AuthPINStatus.enterPIN));
      } else {
        emit(state.copyWith(pin: pin, pinStatus: AuthPINStatus.loading));
        await Future.delayed(Duration(seconds: 1));
        emit(state.copyWith(pin: pin, pinStatus: AuthPINStatus.checkPin));
        authenticationBloc!.add(AuthEventLoggedIn(password: pin));
      }
    });

    on<AuthPinEraseEvent>((event, emit) async {
      String pin = state.pin.substring(0, state.pin.length - 1);
      emit(AuthPinState(pin: pin, pinStatus: AuthPINStatus.enterPIN));
    });

    on<AuthNullPINEvent>((event, emit) async {
      emit(state.copyWith(pin: "", pinStatus: AuthPINStatus.loading));

      emit(AuthPinState(pinStatus: AuthPINStatus.enterPIN, pin: ""));
    });
  }
}
