part of 'create_pin_bloc.dart';

enum PINStatus { enterFirst, enterSecond, equals, unequals }

@immutable
class CreatePINState {
  final PINStatus pinStatus;
  final String firstPIN;
  final String secondPIN;
  LoggedModel? loggedInData = LoggedModel(user: User());

  CreatePINState({
    this.firstPIN = "",
    this.secondPIN = "",
    required this.pinStatus,
    this.loggedInData,
  });

  int getCountsOfPIN() {
    if (firstPIN.length < 4) {
      return firstPIN.length;
    } else {
      return secondPIN.length;
    }
  }

  CreatePINState copyWith({
    PINStatus? pinStatus,
    String? firstPIN,
    String? secondPIN,
  }) {
    return CreatePINState(
      pinStatus: pinStatus ?? this.pinStatus,
      firstPIN: firstPIN ?? this.firstPIN,
      secondPIN: secondPIN ?? this.secondPIN,
      // loggedInData: loggedInData,
    );
  }
}
