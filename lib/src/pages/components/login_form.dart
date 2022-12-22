import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../bloc/auth/auth_bloc.dart';
import '../../my_app.dart';
import '../../utils/app_theme.dart';
import '../../utils/constants.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _phoneController = new TextEditingController(text: "0123456780");
  bool isEnabledButton = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              child: Image.asset("${Constants.imageUrl}/logo.png", width: 180,),
            ),
            SizedBox(height: 50),
            Column(
              children: [
                Text("กรอกเบอร์โทรศัพท์ของคุณ", style: TextStyle(color: AppColor.textPrimaryColor, fontWeight: FontWeight.bold),),
                SizedBox(height: 10),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    suffixIcon: SizedBox(),
                    hintText: "0123456780"
                  ),
                  validator: (value) {
                    if (value == null || value.trim().length == 0) {
                      return 'กรุณากรอกเบอร์มือถือ';
                    }

                    if (value.length < 10) {
                      return 'กรุณากรอกเบอร์มือถือ 10 หลัก';
                    }

                    return null;
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            buildButton(),
          ],
        ),
      ),
    );
  }

  Widget buildButton() => Container(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: !isEnabledButton ? null : login,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text("${Constants.loginSignIn}"),
          ),
        ),
      );

  Future<void> login() async {
    if(_formKey.currentState!.validate()){
      context.read<AuthBloc>().add(AuthEventCheckPhone(phone: _phoneController.text.trim()));
    }
  }

}
