part of 'auth_pin_bloc.dart';


enum AuthPINStatus { enterPIN, checkPin, loading }
@immutable
class AuthPinState {
  final AuthPINStatus pinStatus;
  final String pin;

  const AuthPinState({required this.pinStatus, this.pin = ""});

  AuthPinState copyWith({
    AuthPINStatus? pinStatus,
    String? pin,
  }) {
    return AuthPinState(
      pinStatus: pinStatus ?? this.pinStatus,
      pin: pin ?? this.pin,
    );
  }

  int getCountsOfPIN(){
    return pin.length;
  }
}