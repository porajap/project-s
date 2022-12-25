import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_s/src/bloc/auth/auth_bloc.dart';

import '../../bloc/create_pin/create_pin_bloc.dart';
import '../../utils/app_theme.dart';
import '../../utils/my_dialog.dart';
import '../components/button_of_numpad.dart';
import '../components/pin_sphere.dart';
import '../home/home_page.dart';

class CreatePIN extends StatefulWidget {
  const CreatePIN({Key? key}) : super(key: key);

  @override
  State<CreatePIN> createState() => _CreatePINState();
}

class _CreatePINState extends State<CreatePIN> {
  static const String pinCreated = "Your PIN code is successfully";
  static const String pinNonCreated = "Pin codes do not match";
  static const String ok = "OK";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocListener<CreatePINBloc, CreatePINState>(
        listener: (context, state) {
          if (state.pinStatus == PINStatus.equals) {
            BotToast.showText(text: "$pinCreated");
            context.read<AuthBloc>().add(AuthEventAppStart());
          } else if (state.pinStatus == PINStatus.unequals) {
            MyDialog.dialogCustom(
              title: pinNonCreated,
              context: context,
              cancelText: ok,
              callback: () {
                context.read<CreatePINBloc>().add(CreateNullPINEvent());
              },
              msg: '',
            );
          }
        },
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
      ),
    );
  }

}

class _NumPad extends StatelessWidget {
  const _NumPad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      context.read<CreatePINBloc>().add(CreatePINAddEvent(pinNum: 1));
                    },
                  ),
                ),
                SizedBox(width: 40),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '2',
                    onPressed: () {
                      context.read<CreatePINBloc>().add(CreatePINAddEvent(pinNum: 2));
                    },
                  ),
                ),
                SizedBox(width: 40),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '3',
                    onPressed: () {
                      context.read<CreatePINBloc>().add(CreatePINAddEvent(pinNum: 3));
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
                      context.read<CreatePINBloc>().add(CreatePINAddEvent(pinNum: 4));
                    },
                  ),
                ),
                SizedBox(width: 40),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '5',
                    onPressed: () {
                      context.read<CreatePINBloc>().add(CreatePINAddEvent(pinNum: 5));
                    },
                  ),
                ),
                SizedBox(width: 40),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '6',
                    onPressed: () {
                      context.read<CreatePINBloc>().add(CreatePINAddEvent(pinNum: 6));
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
                      context.read<CreatePINBloc>().add(CreatePINAddEvent(pinNum: 7));
                    },
                  ),
                ),
                SizedBox(width: 40),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '8',
                    onPressed: () {
                      context.read<CreatePINBloc>().add(CreatePINAddEvent(pinNum: 8));
                    },
                  ),
                ),
                SizedBox(width: 40),
                Expanded(
                  child: ButtonOfNumPad(
                    num: '9',
                    onPressed: () {
                      context.read<CreatePINBloc>().add(CreatePINAddEvent(pinNum: 9));
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
                      context.read<CreatePINBloc>().add(CreatePINAddEvent(pinNum: 10));
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
                      context.read<CreatePINBloc>().add(CreatePINEraseEvent());
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MainPart extends StatelessWidget {
  static const String createPIN = "Create PIN";
  static const String reEnterYourPIN = "Re-enter your PIN";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePINBloc, CreatePINState>(
      buildWhen: (previous, current) {
        return previous.firstPIN != current.firstPIN || previous.secondPIN != current.secondPIN;
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Flexible(
              flex: 2,
              child: Text(
                state.pinStatus == PINStatus.enterFirst ? createPIN : reEnterYourPIN,
                style: TextStyle(color: AppColor.textPrimaryColor, fontSize: 36),
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
