import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_s/src/pages/auth/login_page.dart';

import '../../../bloc/auth/auth_bloc.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/constants.dart';
import '../../../utils/my_dialog.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  void menuOnSelect(String key) async {
    switch (key) {
      case "SETTING":
        break;
      case "LOGOUT":
        MyDialog.dialogConfirm(
          context: context,
          callback: () => {
            Navigator.popUntil(context, (route) => route.isFirst),
            context.read<AuthBloc>().add(AuthEventLoggedOut()),
          },
          title: "${Constants.textLogout}",
          msg: "${Constants.textLogoutMsg}",
        );
        break;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("หน้าหลัก"),
      actions: [
        PopupMenuButton<String>(
          tooltip: "${Constants.textMenu}",
          splashRadius: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          onSelected: menuOnSelect,
          icon: Icon(
            Icons.more_vert,
            color: AppColor.whiteColor,
            size: 24,
          ),
          itemBuilder: (BuildContext context) => [...buildPopupMenuItems()],
        ),
      ],
    );
  }

  List<PopupMenuEntry<String>> buildPopupMenuItems() {
    List<PopupMenuEntry<String>> popupMenuItem = [
      PopupMenuItem<String>(
        value: "LOGOUT",
        child: buildMenuItem(
          title: "ออกจากระบบ",
          icon: Icons.logout_rounded,
          color: AppColor.errorColor,
        ),
      ),
    ];

    return popupMenuItem;
  }

  Widget buildMenuItem({
    required IconData icon,
    required Color color,
    required String title,
  }) =>
      Column(
        children: [
          Row(
            children: <Widget>[
              Icon(
                icon,
                color: color,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "$title",
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  color: color,
                ),
              )
            ],
          ),
        ],
      );
}
