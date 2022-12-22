import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'create_pin_event.dart';

part 'create_pin_state.dart';

class CreatePINBloc extends Bloc<CreatePINEvent, CreatePINState> {
  // AuthBloc? authenticationBloc;
  // final authService = AuthService();

  CreatePINBloc()
      : super(CreatePINState(
          pinStatus: PINStatus.enterFirst,
          // loggedInData: LoggedModel(data: Data()),
        )) {
    on<CreatePINAddEvent>(_onEventAdd);
    on<CreatePINEraseEvent>(_onErase);
    on<CreateNullPINEvent>((event, emit) {
      emit(CreatePINState(pinStatus: PINStatus.enterFirst));
    });
  }

  FutureOr<void> _onErase(event, emit) async{
    if (state.firstPIN.isEmpty) {
      emit(CreatePINState(pinStatus: PINStatus.enterFirst));
    } else if (state.firstPIN.length < 4) {
      String firstPIN = state.firstPIN.substring(0, state.firstPIN.length - 1);
      emit(CreatePINState(firstPIN: firstPIN, pinStatus: PINStatus.enterFirst));
    } else if (state.secondPIN.isEmpty) {
      emit(state.copyWith(pinStatus: PINStatus.enterSecond));
    } else {
      String secondPIN = state.secondPIN.substring(0, state.secondPIN.length - 1);
      emit(state.copyWith(secondPIN: secondPIN, pinStatus: PINStatus.enterSecond));
    }
  }

  FutureOr<void> _onEventAdd(event, emit) async {
    if (state.firstPIN.length < 4) {
      String firstPIN = "${state.firstPIN}${event.pinNum}";
      if (firstPIN.length < 4) {
        emit(CreatePINState(firstPIN: firstPIN, pinStatus: PINStatus.enterFirst));
      } else {
        emit(CreatePINState(firstPIN: firstPIN, pinStatus: PINStatus.enterSecond));
      }
    } else {
      String secondPIN = "${state.secondPIN}${event.pinNum}";
      if (secondPIN.length < 4) {
        emit(state.copyWith(secondPIN: secondPIN, pinStatus: PINStatus.enterSecond));
      } else if (secondPIN == state.firstPIN) {
        // var _result = await authService.createPin(pin: secondPIN);

        // emit(CreatePINState(secondPIN: secondPIN, pinStatus: PINStatus.equals, loggedInData: _result));
      } else {
        emit(state.copyWith(secondPIN: secondPIN, pinStatus: PINStatus.unequals));
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
