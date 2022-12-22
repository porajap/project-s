import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../utils/app_theme.dart';
import '../../utils/constants.dart';
import '../components/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(0, 0),
          child: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColor.whiteColor,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: LoginForm(),
          ),
        ),
        bottomNavigationBar: Container(
          color: AppColor.whiteColor,
          child: Image.asset("${Constants.imageUrl}/login_bg.png"),
        ),
      ),
    );
  }
}
