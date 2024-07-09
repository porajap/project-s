import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_s/src/my_app.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth_pin/auth_pin_bloc.dart';
import '../../bloc/create_pin/create_pin_bloc.dart';
import '../../utils/app_theme.dart';
import '../../utils/my_dialog.dart';
import '../components/button_of_numpad.dart';
import '../components/pin_sphere.dart';
import '../home/home_page.dart';

class AuthPIN extends StatefulWidget {
  const AuthPIN({Key? key}) : super(key: key);

  @override
  State<AuthPIN> createState() => _AuthPINState();
}

class _AuthPINState extends State<AuthPIN> {
  static const String pinCreated = "Your PIN code is successfully";
  static const String pinNonCreated = "Pin codes do not match";
  static const String ok = "OK";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(flex: 2, child: _MainPart()),
                Expanded(flex: 3, child: _NumPad()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NumPad extends StatelessWidget {
  const _NumPad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthPinBloc, AuthPinState>(
      buildWhen: (previous, current) => current.pinStatus != previous.pinStatus,
      builder: (context, state) {
        BotToast.closeAllLoading();

        if (state.pinStatus == AuthPINStatus.loading) {
          BotToast.showLoading();
        }

        return Container(
          padding: const EdgeInsets.fromLTRB(64, 0, 64, 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonOfNumPad(
                        num: '1',
                        onPressed: () {
                          context.read<AuthPinBloc>().add(AuthPinAddEvent(pinNum: 1));
                        },
                      ),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      child: ButtonOfNumPad(
                        num: '2',
                        onPressed: () {
                          context.read<AuthPinBloc>().add(AuthPinAddEvent(pinNum: 2));
                        },
                      ),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      child: ButtonOfNumPad(
                        num: '3',
                        onPressed: () {
                          context.read<AuthPinBloc>().add(AuthPinAddEvent(pinNum: 3));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Flexible(
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonOfNumPad(
                        num: '4',
                        onPressed: () {
                          context.read<AuthPinBloc>().add(AuthPinAddEvent(pinNum: 4));
                        },
                      ),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      child: ButtonOfNumPad(
                        num: '5',
                        onPressed: () {
                          context.read<AuthPinBloc>().add(AuthPinAddEvent(pinNum: 5));
                        },
                      ),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      child: ButtonOfNumPad(
                        num: '6',
                        onPressed: () {
                          context.read<AuthPinBloc>().add(AuthPinAddEvent(pinNum: 6));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Flexible(
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonOfNumPad(
                        num: '7',
                        onPressed: () {
                          context.read<AuthPinBloc>().add(AuthPinAddEvent(pinNum: 7));
                        },
                      ),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      child: ButtonOfNumPad(
                        num: '8',
                        onPressed: () {
                          context.read<AuthPinBloc>().add(AuthPinAddEvent(pinNum: 8));
                        },
                      ),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      child: ButtonOfNumPad(
                        num: '9',
                        onPressed: () {
                          context.read<AuthPinBloc>().add(AuthPinAddEvent(pinNum: 9));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Flexible(
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      child: ButtonOfNumPad(
                        num: '0',
                        onPressed: () {
                          context.read<AuthPinBloc>().add(AuthPinAddEvent(pinNum: 0));
                        },
                      ),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      child: IconButton(
                        icon: Icon(
                          Icons.backspace,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          context.read<AuthPinBloc>().add(AuthPinEraseEvent());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MainPart extends StatelessWidget {
  static const String enterYourPIN = "Enter your PIN";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthPinBloc, AuthPinState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Flexible(
              flex: 2,
              child: Text(
                enterYourPIN,
                style: TextStyle(color: AppColor.title, fontSize: 36),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) => PinSphere(input: index < state.getCountsOfPIN())),
              ),
            ),
          ]),
        );
      },
    );
  }
}
