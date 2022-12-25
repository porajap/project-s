import 'package:flutter/material.dart';
import 'package:project_s/src/models/home/register_selected_model.dart';
import 'package:project_s/src/models/home/register_model.dart';
import 'package:project_s/src/utils/app_bar.dart';

import '../../my_app.dart';
import '../../services/home_service.dart';

class RegisterAtPage extends StatefulWidget {
  const RegisterAtPage({Key? key}) : super(key: key);

  @override
  State<RegisterAtPage> createState() => _RegisterAtPageState();
}

class _RegisterAtPageState extends State<RegisterAtPage> {
  @override
  void initState() {
    getRegister();
    super.initState();
  }

  RegisterModel registerData = RegisterModel();

  Future<void> getRegister() async {
    HomeService _homeService = HomeService();

    registerData = await _homeService.getRegister();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "หน่วยงานที่ต้องการติดต่อ", context: context, showBack: true),
      body: Container(
        child: registerData.data == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: registerData.data?.length,
                itemBuilder: (_, index) {
                  var _register = registerData.data?[index];
                  var _organizeName = _register?.organizeName ?? "";
                  var _organizeId = _register?.organizeId ?? 0;
                  var _format = _register?.format ?? 2;
                  return InkWell(
                    onTap: () {
                      var _value = RegisterAtSelected(
                        title: _organizeName,
                        organizeId: int.parse('$_organizeId'),
                        format: int.parse('$_format'),
                      );

                      Navigator.pop(context, _value);
                    },
                    child: ListTile(
                      title: Text("${_register?.organizeName}"),
                      trailing: Icon(Icons.arrow_drop_down_rounded),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
